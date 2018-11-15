<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Director extends Model
{
    public function genres()
    {
        return $this->belongsToMany(Genre::class, 'directors_genres', 'director_id', 'genre_id')->withPivot('prob');
    }

    public function movies()
    {
        return $this->belongsToMany(Movie::class, 'movies_directors', 'director_id', 'movie_id');
    }
}
