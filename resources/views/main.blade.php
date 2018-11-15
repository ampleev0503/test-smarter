<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .box{
            width:600px;
            margin:0 auto;
        }
    </style>
</head>
<body>
<br />
<div class="container">
    <form  role="form" action="{{route('search')}}" method="get">
        @csrf
        <div class="form-group">
            <input type="text" class="form-control" name="search" value="{{$search}}" required>
            <p class="help-block">Введите строку для поиска</p>

        <button type="submit" class="btn btn-success">Найти</button>
        </div>

    </form>
</div>

<div class="container">


    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <div id="table_data">
        @include('pagination_data')
    </div>
</div>

</body>
</html>

<script>
    $(document).ready(function(){

        $(document).on('click', '.pagination a', function(event){
            event.preventDefault();
            var page = $(this).attr('href').split('page=')[1];
            fetch_data(page);
        });

        function fetch_data(page)
        {
            $.ajax({
                url:"/search/fetch_data?page="+page,
                success:function(data)
                {
                    $('#table_data').html(data);
                }
            });
        }

    });
</script>
