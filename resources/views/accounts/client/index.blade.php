@extends('layouts.admin.page.index')

@section('icon', 'group')
@section('title', 'Customers')
@section('subtitle', 'Manage Your Customers')

@section('actions')
    <a href="/clients/create" class="btn btn-primary"><i class="fa fa-plus"></i> Add New Customer</a>
@stop

@section('thead')
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Mobile</th>
    <th>Registered?</th>
    <th>Action</th>
@stop

@section('tbody')
    @foreach ($accounts as $account)
        <tr>
            <td>{{ $account->id }}</td>
            <td>{{ $account->name }}</td>
            <td>{{ $account->email }}</td>
            <td>{{ $account->phone }}</td>
            <td>{{ $account->mobile_phone }}</td>
            <td>{!! $account->user_id ? '<span class="badge badge-primary">Yes</span>' : '<span class="badge badge-danger">No</span>' !!}</td>

            <td><a href="/clients/edit/{{ $account->id }}" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> Edit</a></td>
        </tr>
    @endforeach
@stop

@section('script')
<script>
    jQuery(function() {
        /*$('table').dataTable({
            'aaSorting': [[ 0, 'desc' ]],
            'processing': true,
            'serverSide': true,
            'ajax': '/clients/ajax-datatable',
        });*/
    });
</script>
@stop
