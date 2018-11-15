<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    public function actors()
    {
        return $this->belongsToMany(Actor::class, 'roles', 'movie_id', 'actor_id')->withPivot('role');
    }

    public function directors()
    {
        return $this->belongsToMany(Director::class, 'movies_directors', 'movie_id', 'director_id');
    }

    public function genres()
    {
        return $this->belongsToMany(Genre::class, 'movies_genres', 'movie_id', 'genre_id');
    }
}
