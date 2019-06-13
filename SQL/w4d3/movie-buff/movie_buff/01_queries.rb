def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3

  <<-SQL
  SELECT id, title, score
  FROM movies
  WHERE score BETWEEN 2 AND 3;
  SQL

  Movie
    .select(:id, :title, :score)
    .where(score: (2..3))
end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor

  <<-SQL
  SELECT movies.id, movies.title
  FROM movies
  JOIN castings ON castings.movie_id = movies.id
  JOIN actors  ON castings.actor_id = actors.id
  WHERE actors.name = 'Harrison Ford' AND ord != 1;
  SQL

  Movie
    .select(:id, :title)
    .joins(:actors)
    .where(actors: { name: 'Harrison Ford'})
    .where.not(castings: { ord: 1 } )

end

def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)
  (<<-SQL)
  SELECT moves.id, movies.title
  FROM movies
  GROUP BY movies.id
  ORDER BY (COUNT(actors.id))
  LIMIT 3
  SQL

  Movie
    .select(:id, :title)
    .joins(:actors)
    .group('movies.id')
    .order('COUNT(actors.id) DESC')
    .limit(3)
end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.
    (<<-SQL)
    SELECT movies.id, movies.title
    FROM movies
    WHERE actors.name IN (?);
    SQL

    Movie
      .select(:id, :title)
      .joins(:director)
      .where('actors.name IN (?)', them)
end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.
    (<<-SQL)
    SELECT movies.title
    FROM movies
    WHERE movies.yr < 1940;
    SQL
    
    Movie.where('yr < 1940').pluck(:title)
end
