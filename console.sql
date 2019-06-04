create table movie
(
    mov_id          integer primary key auto_increment,
    mov_title       char(50),
    mov_year        integer,
    mov_time        integer,
    mov_lang        char(50),
    mov_dt_rel      date,
    mov_rel_country char(5)
);

create table movie_cast
(
    act_id integer,
    mov_id integer,
    role   char(30),
    foreign key (act_id) references actor (act_id),
    foreign key (mov_id) references movie (mov_id)
);
create table reviewer
(
    rev_id   integer primary key auto_increment,
    rev_name char(30)
);
create table actor
(
    act_id     integer primary key auto_increment,
    act_fname  char(20),
    act_lname  char(20),
    act_gender char(1)
);
create table director
(
    dir_id    integer primary key auto_increment,
    dir_fname char(20),
    dir_lname char(20)
);
create table movie_direction
(
    dir_id integer,
    mov_id integer,
    foreign key (dir_id) references director (dir_id),
    foreign key (mov_id) references movie (mov_id)
);
create table genres
(
    gen_id    integer primary key auto_increment,
    gen_title char(20)
);
create table movie_genres
(
    mov_id integer,
    gen_id integer,
    foreign key (mov_id) references movie (mov_id),
    foreign key (gen_id) references genres (gen_id)
);
create table rating
(
    mov_id        integer,
    rev_id        integer,
    rev_stars     integer,
    num_o_ratings integer,
    foreign key (mov_id) references movie (mov_id),
    foreign key (rev_id) references reviewer (rev_id)
);

insert into actor(actor.act_fname, actor.act_lname, actor.act_gender)
values ('Mathias', 'Limbourg', 'M'),
       ('Maarten', 'Reygaerts', 'M'),
       ('Nona', 'Graulus', 'F'),
       ('Anne', 'Habils', 'F'),
       ('Jean-Michel', 'Limbourg', 'M'),
       ('Julien', 'Pallard', 'M'),
       ('Jorn', 'Reygaerts', 'M'),
       ('Aurelie', 'Limbourg', 'F'),
       ('Tom', 'Van den Brande', 'M'),
       ('Annie', 'Spitaals', 'F')
;

insert into director(dir_fname, dir_lname)
VALUES ('Mathias', 'Limbourg'),
       ('Maarten', 'Reygaerts'),
       ('Nona', 'Graulus'),
       ('Anne', 'Habils'),
       ('Jean-Michel', 'Limbourg'),
       ('Julien', 'Pallard'),
       ('Jorn', 'Reygaerts'),
       ('Aurelie', 'Limbourg'),
       ('Tom', 'Van den Brande'),
       ('Annie', 'Spitaals')
;
insert into movie_direction(dir_id, mov_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10);

insert into movie(mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country)
values ('The Shawshank Redemption', '1994', 222, 'English', '1994-01-14', 'USA'),
       ('The Godfather', '1972', 255, 'English', '1972-01-24', 'USA'),
       ('The Godfather: Part 2', '1974', 322, 'English', '1974-01-20', 'USA'),
       ('The Dark Knight', '2008', 232, 'English', '2008-01-23', 'USA'),
       ('12 Angry Men', '1957', 136, 'English', '1957-01-10', 'ENG'),
       ('Schindlers List', '1993', 315, 'English', '1994-01-4', 'ENG'),
       ('Lord Of The Rings: Return of the king', '2003', 321, 'English', '2003-01-17', 'ENG'),
       ('Pulp Fiction', '2003', 234, 'English', '1994-01-9', 'ENG'),
       ('Fight Club', '1999', 219, 'English', '1999-01-10', 'ENG'),
       ('Inception', '2010', 228, 'English', '2010-01-21', 'ENG');

insert into movie_cast(act_id, mov_id, role)
VALUES (1, 1, 'Hoofdrol'),
       (2, 2, 'Moordenaar'),
       (3, 3, 'Poetsman'),
       (4, 4, 'Figurant'),
       (5, 5, 'Hoofdrol'),
       (6, 6, 'Chauffeur'),
       (7, 7, 'Portier'),
       (8, 8, 'Wie?'),
       (9, 9, 'Hoofdrol'),
       (10, 10, 'Rich bich');


insert into reviewer(rev_name)
values ('Mathias'),
       ('Maarten'),
       ('Brecht'),
       ('Aurelie'),
       ('Nona'),
       ('Jean-Michel'),
       ('Anne'),
       ('Julien'),
       ('Jorn'),
       ('Gunter');

insert into genres(gen_title)
values ('Comedy'),
       ('Horror'),
       ('Sport'),
       ('Docu'),
       ('Thriller'),
       ('Action'),
       ('Romance'),
       ('Triliogy'),
       ('News'),
       ('Horror');

insert into movie_genres(mov_id, gen_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10);

insert into rating(rev_stars, num_o_ratings)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10);


#1. Schrijf een query om de naam en het jaar van de films te vinden.
select mov_year, mov_title
from movie;

#2. Schrijf een query om het jaar te vinden waarin de film American Beaty uitkwam.
select mov_year
from movie
where mov_title like 'American Beauty';

#3. Schrijf een query om de film te vinden die in 1999 uit is gebracht.
select mov_year, mov_title
from movie
where mov_year like '1999';

#4. Schrijf een query om de films te vinden die voor 1998 zijn uitgebracht.
select mov_year, mov_title
from movie
where mov_year < 1998;

#5. Schrijf een query om de naam van alle recensenten en de naam de films samen te voegen in een enkele lijst.
select concat(rev_name, mov_title)
from reviewer r
         inner join rating on rating.rev_id = r.rev_id
         inner join movie m on m.mov_id = rating.mov_id;

#6. Schrijf een query om de naam te vinden van alle revieuwers die 7 of meer sterren op hun rating hebben staan.
select rev_name
from reviewer
         inner join rating on reviewer.rev_id = rating.rev_id
where rev_stars < 7;

#7. Schrijf een query om de titels te vinden van alle films die geen rating hebben.
select mov_title
from movie
         inner join rating r on r.mov_id = mov_id
where rev_stars = null;

#8. Schrijf een query om de titels van de films met ID 5,7,9 te vinden.
select mov_title
from movie
where mov_id = 5
   or mov_id = 7
   or mov_id = 9;

#9. Schrijf een query om het ID nummer te vinden van de acteur met de voornaam woody en de achternaam allen.
select act_lname, act_fname
from actor
where act_lname like 'Limbourg'
  and act_fname like 'Allen';

#10. Schrijf een query om de naam te vinden van de regisseur (voor- en achternaam) die een film regisseerde die een rol heeft gespeeld voor 'Eyes wide Shut'.
select dir_id
from movie_direction md
         inner join movie m on m.mov_id = md.dir_id
where mov_title like 'Eyes Wide Shut';

#11. Schrijf een query om alle films die in het land buiten het verinigd koninkrijk zijn uitgebracht op te sommen
select *
from movie
where mov_rel_country != 'ENG';

#12. Schrijf een query om alle jaren te vinden die minstens 1 film hebben opgeleverd en die een beoordeling van meer dan 3 sterren hebben gekregen. Toon de resultaten in oplopende volgorde.
select mov_year
from movie
where mov_id in (select mov_id from rating where rev_stars > 3)
group by mov_year
having count(mov_year) > 1;
#13. Schrijf een query om de naam van de revieuwer, de filmtitel en de sterren terug te geven voor de films die door een reviewer zijn beoordeeld en moeten worden beoordeeld. sorteer het resutaat op naam de de reviewer, filmtitel en aantal sterren.

#14.
select movie.mov_title, max(r.rev_stars)
from movie movie
         inner join rating r on movie.mov_id = r.mov_id
group by r.mov_id
order by movie.mov_title;
#15.

#16.
select count(act_id)
from actor
#where (select mov_year from movie where mov_year between (1990, 2000))

#17.

#18.

#19.

#20.




