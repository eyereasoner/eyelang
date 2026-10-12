# Find routes through French cities.
# Each connects fact is a one-way road: travel from left to right.
paris connects orleans.
paris connects chartres.
paris connects amiens.
orleans connects blois.
orleans connects bourges.
blois connects tours.
chartres connects lemans.
lemans connects angers.
lemans connects tours.
angers connects nantes.

# One road is enough to reach the next city.
if someone connects something then someone reaches something.

# Take one road, then follow a route from the next city.
if someone connects something and something reaches first then someone reaches first.

# Answer: which cities have a route to Nantes?
who reaches nantes?

# Reason: show the roads along the route from Paris.
does paris reach nantes?
why?

# There is also a route to Tours.
does paris reach tours?
why?

# Roads only go in the direction written above.
does nantes reach paris?

# Check: independently state the expected routes and the missing reverse route.
check that paris reaches nantes.
check that chartres reaches nantes.
check that lemans reaches nantes.
check that angers reaches nantes.
check that paris reaches tours.
check that nantes does not reach paris.
check that tours does not reach nantes.
