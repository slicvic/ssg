<?php namespace App\Models;

use Hash;
use Auth;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableInterface;
use Illuminate\Auth\Authenticatable as AuthenticableTrait;

class User extends BaseSiteSpecific implements AuthenticatableInterface {

    use AuthenticableTrait;

    public static $signupRules = [
        'site_id' => 'required',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|min:6',
        'firstname' => 'required',
        'lastname' => 'required'
    ];

    /*
    public static $rules = [
        'site_id' => 'required',
        'company_name' => 'required_without:firstname,lastname',
        'email' => 'sometimes|required|email|unique:users,email',
        'password' => 'sometimes|required|min:6',
        'firstname' => 'required_without:company_name',
        'lastname' => 'required_without:company_name'
    ];
    */

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'users';

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = ['password', 'remember_token'];

    protected $fillable = [
        'site_id',
        'country_id',
        'email',
        'password',
        'company_name',
        'firstname',
        'lastname',
        'dob',
        'nin',
        'phone',
        'cellphone',
        'address1',
        'address2',
        'city',
        'state',
        'postal_code',
    ];

    /**
     * ----------------------------------------------------
     * Relationships
     * ----------------------------------------------------
     */

    public function packages()
    {
        return $this->hasMany('App\Models\Package');
    }

    public function roles()
    {
        return $this->belongsToMany('App\Models\Role', 'roles_users');
    }

    public function country()
    {
        return $this->belongsTo('App\Models\Country');
    }

    public function site()
    {
        return $this->belongsTo('App\Models\Site');
    }

    /**
     * ----------------------------------------------------
     * /Relationships
     * ----------------------------------------------------
     */

    /**
     * Gets the user's full name.
     *
     * @return string
     */
    public function name()
    {
        return trim(ucwords(strtolower($this->firstname . ' ' . $this->lastname)));
    }

    /**
     * Gets list of assigned roles as an array.
     *
     * @return array
     */
    public function rolesArray()
    {
        $roles = [];
        foreach ($this->roles as $role) {
            $roles[$role->id] = $role->name;
        }
        return $roles;
    }

    /**
     * Gets the casillero id.
     *
     * @return string
     */
    public function trackingId()
    {
        return  '';
    }

    /**
     * Login event callback.
     *
     * @see app/observers.php
     */
    public function afterLogin()
    {
        // @TODO: call this on login event
        $this->logins += 1;
        $this->last_login = date('Y-m-d H:i:s');
        $this->save();
    }

    /**
     * Determines if the user is an agent.
     *
     * @return bool
     */
    public function isAgent()
    {
        return $this->hasRole(Role::AGENT);
    }

    /**
     * Determines if the user is an admin.
     *
     * @return bool
     */
    public function isAdmin()
    {
        return $this->hasRole(Role::ADMIN);
    }

    /**
     * Determines if the user is a client.
     *
     * @return bool
     */
    public function isClient()
    {
        return $this->hasRole(Role::CLIENT);
    }

    /**
     * Generates a password recovery token.
     *
     * @return string
     */
    public function makePasswordRecoveryToken()
    {
        return urlencode(base64_encode(Hash::make($this->makePlainPasswordRecoveryToken())));
    }

    /**
     * Generates a plain text password recovery token.
     *
     * @return string
     */
    private function makePlainPasswordRecoveryToken()
    {
        return $this->email . ':' . $this->password . ':' . $this->created_at;
    }

    /**
     * Determines if a password recovery token is valid.
     *
     * @param  string $token
     * @return bool
     */
    public function checkPasswordRecoveryToken($token)
    {
        return Hash::check($this->makePlainPasswordRecoveryToken(), base64_decode(urldecode($token)));
    }

    /**
     * Assigns the specified roles to the user.
     *
     * @param  array  $role_ids
     * @return void
     */
    public function attachRoles(array $role_ids = [])
    {
        return $this->roles()->sync($role_ids);
    }

    /**
     * Determines if the user has the given role.
     *
     * @param  int  $roleId
     * @return bool
     */
    public function hasRole($roleId)
    {
        return in_array($roleId, array_fetch($this->roles->toArray(), 'id'));
    }

    /**
     * Overrides parent method to sanitize certain attributes.
     *
     * @see parent::setAttribute()
     */
    public function setAttribute($key, $value)
    {
        switch ($key) {
            case 'password':
                $value = empty($value) ? $this->password : Hash::make($value);
                break;
            case 'dob':
                if (is_string($value))
                    $value = date('Y-m-d', strtotime($value));
                else if (is_array($value))
                    $value = date('Y-m-d', strtotime($value['year'] . '/' . $value['month'] . '/' . $value['day']));
                else
                    $value = NULL;
        }

        return parent::setAttribute($key, $value);
    }

    /**
     * Validates the specified credentials.
     *
     * @param  string $username
     * @param  string $password
     * @return User|FALSE
     */
    public static function validateCredentials($username, $password)
    {
        $user = User::where('id', $username)
            ->orWhere('email', $username)
            ->first();

        if ($user && Hash::check($password, $user->password) && $user->hasRole(Role::LOGIN))
            return $user;

        return FALSE;
    }

    /**
     * Retrieves a list of users for a jQuery Autocomplete input field.
     *
     * @param  string $searchTerm  A search query
     * @param  array  $siteIds     List of site ids
     * @return User[]
     */
    public static function getUsersForAutocomplete($searchTerm, array $siteIds = NULL)
    {
        $searchTerm = '%' . $searchTerm . '%';
        $where = '(id LIKE ? OR firstname LIKE ? OR lastname LIKE ? OR company_name LIKE ? OR email LIKE ? OR phone LIKE ? or cellphone LIKE ?)';
        $where .= count($siteIds) ? ' AND site_id IN (' . implode(',', $siteIds) . ')' : '';
        return User::whereRaw($where, [$searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm])->get();
    }

    /**
     * Retrieves a list of users for a jQuery Datatable plugin.
     *
     * @param  string   $criteria     Lists of criterias
     * @param  int      $offset
     * @param  int      $limit
     * @param  string   $orderBy
     * @param  string   $order
     *
     * @return [total => X, users => User[]]
     */
    public static function getUsersForDatatable(array $criteria = [], $offset = 0, $limit = 10, $orderBy = 'id', $order = 'DESC')
    {
        $sql = '1';
        $bindings = [];

        if (isset($criteria['site_id']) && is_array($criteria['site_id']) && count($criteria['site_id']))
        {
            $sql .= ' AND site_id IN (' . implode(',', $criteria['site_id']) . ')';
        }

        if ( ! empty($criteria['search_term']))
        {
            $searchTerm = '%' . $criteria['search_term'] . '%';
            $sql .= ' AND (id LIKE ? OR firstname LIKE ? OR lastname LIKE ? OR company_name LIKE ? OR email LIKE ? OR phone LIKE ? or cellphone LIKE ?)';
            $bindings = [$searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm];
        }

        $query = User::whereRaw($sql, $bindings);
        $total = $query->count();
        $results = $query
            ->orderBy($orderBy, $order)
            ->limit($limit)
            ->get();

        return ['total' => $total, 'users' => $results];
    }
}
