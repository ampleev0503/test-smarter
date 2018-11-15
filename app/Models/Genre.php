<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Genre extends Model
{
    public function directors()
    {
        return $this->belongsToMany(Director::class, 'directors_genres', 'genre_id', 'director_id')->withPivot('prob');
    }

    public function movies()
    {
        return $this->belongsToMany(Movie::class, 'movies_genres', 'genre_id', 'movie_id');
    }
}
