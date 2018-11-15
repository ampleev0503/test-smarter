<?php

namespace App\Http\Controllers;


use App\Models\Actor;
use App\Models\Director;
use App\Models\Genre;
use App\Models\Movie;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;

class SearchController extends Controller
{

    const PAGINATE_COUNT = 3;

    public function index(Request $request)
    {
        $validatedItems = $this->validateQueryData($request);

        if(isset($validatedItems['search']))
        {
            session(['search' => $validatedItems['search']]);
        }

        $search = session()->get('search') ?? null;

        $movies = collect();
        $actors = collect();
        $directors = collect();
        $genres = collect();

        if(isset($search))
        {
              // поиск по фильмам
            $movies = Movie::where('name','like','%'.$search.'%')->paginate(self::PAGINATE_COUNT);
            $total = $movies->total();
            $links = $movies->links();

              // поиск по актерам
            $actors = Actor::where('first_name','like','%'.$search.'%')
                ->orWhere('last_name','like','%'.$search.'%')
                ->paginate(self::PAGINATE_COUNT);
            $total = $this->cmp($total, $actors, $links);

              // поиск по режиссерам
            $directors = Director::where('first_name','like','%'.$search.'%')
                ->orWhere('last_name','like','%'.$search.'%')
                ->paginate(self::PAGINATE_COUNT);
            $total = $this->cmp($total, $directors, $links);

              // поиск по жанрам
            $genres = Genre::where('name','like','%'.$search.'%')
                ->paginate(self::PAGINATE_COUNT);
            $total = $this->cmp($total, $genres, $links);

        }

        return view('main', compact('search','movies', 'actors', 'directors', 'genres', 'links'));
    }

    function fetch_data(Request $request)
    {
        if($request->ajax())
        {
            $search = session()->get('search') ?? null;

            if(isset($search))
            {
                // поиск по фильмам
                $movies = Movie::where('name','like','%'.$search.'%')->paginate(self::PAGINATE_COUNT);
                $total = $movies->total();
                $links = $movies->links();

                // поиск по актерам
                $actors = Actor::where('first_name','like','%'.$search.'%')
                    ->orWhere('last_name','like','%'.$search.'%')
                    ->paginate(self::PAGINATE_COUNT);
                $total = $this->cmp($total, $actors, $links);

                // поиск по режиссерам
                $directors = Director::where('first_name','like','%'.$search.'%')
                    ->orWhere('last_name','like','%'.$search.'%')
                    ->paginate(self::PAGINATE_COUNT);
                $total = $this->cmp($total, $directors, $links);

                // поиск по жанрам
                $genres = Genre::where('name','like','%'.$search.'%')
                    ->paginate(self::PAGINATE_COUNT);
                $total = $this->cmp($total, $genres, $links);

            }

            return view('pagination_data', compact('movies', 'actors', 'directors', 'genres', 'links'))->render();
        }
    }

    protected function cmp(int $total, LengthAwarePaginator $paginator, &$links)
    {
        if($total < $paginator->total())
        {
            $total = $paginator->total();
            $links = $paginator->links();
        }
        return $total;
    }

    protected function validateQueryData(Request $request)
    {
        return $this->validate($request, [
            'search' => 'string'
        ]);
    }

}
