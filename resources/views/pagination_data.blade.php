<div class="table-responsive">
    @if($movies->count() > 0)
    <h3>Фильмы</h3>
    <table class="table table-striped table-bordered">
        <tr>
            <th width="5%">ID</th>
            <th width="57%">Name</th>
            <th width="19%">Year</th>
            <th width="19%">Rank</th>
        </tr>
        @foreach($movies as $movie)
            <tr>
                <td>{{ $movie->id }}</td>
                <td>{{ $movie->name }}</td>
                <td>{{ $movie->year }}</td>
                <td>{{ $movie->rank }}</td>
            </tr>
        @endforeach
    </table>
    @endif

    @if($actors->count() > 0)
    <h3>Актёры</h3>
    <table class="table table-striped table-bordered">
        <tr>
            <th width="5%">ID</th>
            <th width="38%">First Name</th>
            <th width="38%">Last Name</th>
            <th width="19%">Gender</th>
        </tr>
        @foreach($actors as $actor)
            <tr>
                <td>{{ $actor->id }}</td>
                <td>{{ $actor->first_name }}</td>
                <td>{{ $actor->last_name }}</td>
                <td>{{ $actor->gender }}</td>
            </tr>
        @endforeach
    </table>
    @endif

    @if($directors->count() > 0)
    <h3>Режиссёры</h3>
    <table class="table table-striped table-bordered">
        <tr>
            <th width="5%">ID</th>
            <th width="47%">First Name</th>
            <th width="48%">Last Name</th>
        </tr>
        @foreach($directors as $director)
            <tr>
                <td>{{ $director->id }}</td>
                <td>{{ $director->first_name }}</td>
                <td>{{ $director->last_name }}</td>
            </tr>
        @endforeach
    </table>
    @endif

    @if($genres->count() > 0)
    <table class="table table-striped table-bordered">
        <tr>
            <th width="5%">ID</th>
            <th width="95%">Name</th>
        </tr>
        @foreach($genres as $genre)
            <tr>
                <td>{{ $genre->id }}</td>
                <td>{{ $genre->name }}</td>
            </tr>
        @endforeach
    </table>
    @endif

    @if(isset($links))
        {!! $links !!}
    @endif
</div>
