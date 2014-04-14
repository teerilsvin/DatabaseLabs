DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS engineers CASCADE;
DROP TABLE IF EXISTS astronauts CASCADE;
DROP TABLE IF EXISTS flightcontrolop CASCADE;
DROP TABLE IF EXISTS crew CASCADE;
DROP TABLE IF EXISTS spacecraft CASCADE;
DROP TABLE IF EXISTS systems CASCADE;
DROP TABLE IF EXISTS parts CASCADE;
DROP TABLE IF EXISTS catalog CASCADE;
DROP TABLE IF EXISTS suppliers CASCADE;
DROP TABLE IF EXISTS partsid CASCADE;
DROP TABLE IF EXISTS systemsid CASCADE;

-- People --
CREATE TABLE people (
  pid		char(3) not null,
  firstname	text,
  lastname	text,
  age		integer,
 primary key(pid)
);

-- SpaceCraft --
CREATE TABLE spacecraft (
  sid		char(3) not null,
  name		text,
  tailnum	integer,
  weighttons	integer,
  fueltype	text,
  crewcap	integer,
 primary key(sid)
);

-- Suppliers --
CREATE TABLE suppliers (
  supid		integer not null,
  name		text,
  address	text,
  paymentterms	text,
 primary key(supid)
);

-- Systems --
CREATE TABLE systems (
  sysid		char(3) not null,
  sysname	text,
  description	text,
 primary key(sysid)
);

-- Parts --
CREATE TABLE parts (
  partid	char(3) not null,
  partname	text,
  description	text,
 primary key(partid)
);

-- Engineers --
CREATE TABLE engineers (
  pid		char(3) not null references people(pid),
  highestdegree	text,
  favvidgame	text,
 primary key(pid)
);

-- Astronauts --
CREATE TABLE astronauts (
  pid		char(3) not null references people(pid),
  yrsflying	integer,
  golfhandicap	text,
 primary key(pid)
);

-- Flight Control Operator --
CREATE TABLE flightcontrolop (
  pid		char(3) not null references people(pid),
  chairpref	text,
  prefdrink	text,
 primary key(pid)
);

--Crew --
CREATE TABLE crew (
  pid		char(3) not null references people(pid),
  sid		char(3) not null references spacecraft(sid),
 primary key(pid, sid)
);

-- SystemsID --
CREATE TABLE systemsid (
  sid		char(3) not null references spacecraft(sid),
  sysid		char(3) not null references systems(sysid),
 primary key(sid, sysid)
);

-- PartsID --
CREATE TABLE partsid (
  partid	char(3) not null references parts(partid),
  sysid		char(3) not null references systems(sysid),
 primary key(partid, sysid)
);

-- Catalog --
CREATE TABLE catalog (
  supid		integer not null references suppliers(supid),
  partid	char(3) not null references parts(partid),
 primary key(supid, partid)
);

-- People --
INSERT INTO people( pid, firstname, lastname, age )
  VALUES('p01', 'Sean', 'Connery', 34);
INSERT INTO people( pid, firstname, lastname, age )
  VALUES('p02', 'Freddie', 'Mercury', 28);
INSERT INTO people( pid, firstname, lastname, age )
  VALUES('p03', 'Bob', 'Marley', 27);
INSERT INTO people( pid, firstname, lastname, age )
  VALUES('p04', 'Jimmy', 'Page', 41);
INSERT INTO people( pid, firstname, lastname, age )
  VALUES('p05', 'Keith', 'Richards', 52);
INSERT INTO people( pid, firstname, lastname, age )
  VALUES('p06', 'Billy', 'Joel', 36);

-- SpaceCraft --
INSERT INTO spacecraft( sid, name, tailnum, weighttons, fueltype, crewcap )
  VALUES('s01', 'Apollo13', 1, 500, 'diesel', 6);
INSERT INTO spacecraft( sid, name, tailnum, weighttons, fueltype, crewcap )
  VALUES('s02', 'Apollo11', 2, 700, 'diesel', 3);
INSERT INTO spacecraft( sid, name, tailnum, weighttons, fueltype, crewcap )
  VALUES('s03', 'Sputnik', 3, 200, 'regular', 2);
INSERT INTO spacecraft( sid, name, tailnum, weighttons, fueltype, crewcap )
  VALUES('s04', 'Wheatley', 4, 1, 'premium', 1);

-- Suppliers -- 
INSERT INTO suppliers( supid, name, address, paymentterms )
  VALUES(1, 'Aperture Laboratories', '100 Wheat Field Ln.', 'credit');
INSERT INTO suppliers( supid, name, address, paymentterms )
  VALUES(2, 'Wheatley Laboratories', '102 Wheat Field Ln.', 'hugs');
INSERT INTO suppliers( supid, name, address, paymentterms )
  VALUES(3, 'Umbrella Corp.', '34 Zombie St.', 'check');
INSERT INTO suppliers( supid, name, address, paymentterms )
  VALUES(4, 'Malcom Reynolds', '1 Serenity Ln.', 'cash');

-- Systems --
INSERT INTO systems( sysid, sysname, description )
  VALUES('i01', 'Z/OS', 'Mainframe OS' );
INSERT INTO systems( sysid, sysname, description )
  VALUES('i02', 'Flood', 'Virus to use against alien space craft' );
INSERT INTO systems( sysid, sysname, description )
  VALUES('i03', 'PostGreSQL', 'Used to create and update databases about aliens' );
INSERT INTO systems( sysid, sysname, description )
  VALUES('i04', 'Oxygen', 'Controls amount of oxygen in the craft' );
INSERT INTO systems( sysid, sysname, description )
  VALUES('i05', 'autopilot', 'used to crash the craft' );
INSERT INTO systems( sysid, sysname, description )
  VALUES('i06', 'Sprinklers', 'Used to put out spontaneous combustions');

-- Parts --
INSERT INTO parts( partid, partname, description )
  VALUES('a01', 'keyboard', 'you know what its used for');
 INSERT INTO parts( partid, partname, description )
  VALUES('a02', 'monitor', 'used to see pictures of cats');
INSERT INTO parts( partid, partname, description )
  VALUES('a03', 'flash drive', 'carries the flood virus');
INSERT INTO parts( partid, partname, description )
  VALUES('a04', 'tube', 'use a series of them to create the internet');
INSERT INTO parts( partid, partname, description )
  VALUES('a05', 'motherboard', 'some important computer part or whatever');
INSERT INTO parts( partid, partname, description )
  VALUES('a06', 'valve', 'creator of Steam');
INSERT INTO parts( partid, partname, description )
  VALUES('a07', 'joystick', 'helpful for flying');

-- Engineers --
INSERT INTO engineers( pid, highestdegree, favvidgame )
  VALUES('p01', 'Actors Masters', 'Golden Eye');
INSERT INTO engineers( pid, highestdegree, favvidgame )
  VALUES('p04', 'Guitar PhD', 'Rock Band');

-- Astronauts --
INSERT INTO astronauts( pid, yrsflying, golfhandicap )
  VALUES('p02', 14, 'Sings the ball into the hole');
INSERT INTO astronauts( pid, yrsflying, golfhandicap )
  VALUES('p05', 11, 'Never stops playing even when you want him to');

-- Flight Control Operator --
INSERT INTO flightcontrolop( pid, chairpref, prefdrink )
  VALUES('p03', 'Deputy', 'Beer');
INSERT INTO flightcontrolop( pid, chairpref, prefdrink )
  VALUES('p06', 'pilot', 'Whiskey');

-- Crew --
INSERT INTO crew( pid, sid )
  VALUES('p01', 's01');
INSERT INTO crew( pid, sid )
  VALUES('p02', 's01');
INSERT INTO crew( pid, sid )
  VALUES('p03', 's01');
INSERT INTO crew( pid, sid )
  VALUES('p06', 's01');
INSERT INTO crew( pid, sid )
  VALUES('p01', 's02');
INSERT INTO crew( pid, sid )
  VALUES('p04', 's02');
INSERT INTO crew( pid, sid )
  VALUES('p05', 's02');
INSERT INTO crew( pid, sid )
  VALUES('p05', 's03');
INSERT INTO crew( pid, sid )
  VALUES('p06', 's03');
INSERT INTO crew( pid, sid )
  VALUES('p02', 's04');

-- SystemsID --
INSERT INTO systemsid( sid, sysid )
  VALUES('s01', 'i01');
INSERT INTO systemsid( sid, sysid )
  VALUES('s01', 'i03');
INSERT INTO systemsid( sid, sysid )
  VALUES('s01', 'i05');
INSERT INTO systemsid( sid, sysid )
  VALUES('s01', 'i06');
INSERT INTO systemsid( sid, sysid )
  VALUES('s02', 'i02');
INSERT INTO systemsid( sid, sysid )
  VALUES('s02', 'i04');
INSERT INTO systemsid( sid, sysid )
  VALUES('s02', 'i05');
INSERT INTO systemsid( sid, sysid )
  VALUES('s03', 'i02');
INSERT INTO systemsid( sid, sysid )
  VALUES('s03', 'i03');
INSERT INTO systemsid( sid, sysid )
  VALUES('s03', 'i05');
INSERT INTO systemsid( sid, sysid )
  VALUES('s04', 'i01');
INSERT INTO systemsid( sid, sysid )
  VALUES('s04', 'i03');

-- PartsID --
INSERT INTO partsid( partid, sysid )
  VALUES('a01', 'i01');
INSERT INTO partsid( partid, sysid )
  VALUES('a02', 'i01');
INSERT INTO partsid( partid, sysid )
  VALUES('a05', 'i01');
INSERT INTO partsid( partid, sysid )
  VALUES('a03', 'i02');
INSERT INTO partsid( partid, sysid )
  VALUES('a01', 'i03');
INSERT INTO partsid( partid, sysid )
  VALUES('a02', 'i03');
INSERT INTO partsid( partid, sysid )
  VALUES('a05', 'i03');
INSERT INTO partsid( partid, sysid )
  VALUES('a04', 'i04');
INSERT INTO partsid( partid, sysid )
  VALUES('a05', 'i04');
INSERT INTO partsid( partid, sysid )
  VALUES('a06', 'i04');
INSERT INTO partsid( partid, sysid )
  VALUES('a05', 'i05');
INSERT INTO partsid( partid, sysid )
  VALUES('a07', 'i05');
INSERT INTO partsid( partid, sysid )
  VALUES('a02', 'i06');
INSERT INTO partsid( partid, sysid )
  VALUES('a06', 'i06');

-- Catalog --
INSERT INTO catalog( supid, partid )
  VALUES(1, 'a06');
INSERT INTO catalog( supid, partid )
  VALUES(1, 'a07');
INSERT INTO catalog( supid, partid )
  VALUES(2, 'a03');
INSERT INTO catalog( supid, partid )
  VALUES(2, 'a04');
INSERT INTO catalog( supid, partid )
  VALUES(3, 'a03');
INSERT INTO catalog( supid, partid )
  VALUES(3, 'a05');
INSERT INTO catalog( supid, partid )
  VALUES(4, 'a01');
INSERT INTO catalog( supid, partid )
  VALUES(4, 'a02');
INSERT INTO catalog( supid, partid )
  VALUES(4, 'a05');
