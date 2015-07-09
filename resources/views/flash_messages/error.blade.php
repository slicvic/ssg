<div class="alert alert-danger">
    <h4><i class="fa fa-times-circle"></i> Whoops! There was an error:</h4>
    <ul>
        @if (is_array($message))
            <li>{!! implode('</li><li>', $message) !!}</li>
        @elseif (is_string($message))
            <li>{{ $message }}</li>
        @endif
    </ul>
</div>
