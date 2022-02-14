# HTTP Protocol with HTTPie
# Members: Ethan Kamus

clear
arg="cpsc$1"

echo == 2. RETRIEVE INITIAL URL ==
http https://catalog.fullerton.edu

echo == 3. FORM SUBMISSION ==
http --form POST https://catalog.fullerton.edu/search_advanced.php? \
	cur_cat_oid==70 \
	search_database==Search \
	search_db==Search \
	cpage==1 \
	ecpage==1 \
	ppage==1 \
	spage==1 \
	tpage==1 \
	location==33 \
	filter[keyword]==cpsc449 \
	filter[exact_match]==1 \

echo == 4. PIPELINE ==
http --form POST https://catalog.fullerton.edu/search_advanced.php? \
	cur_cat_oid==70 \
	search_database==Search \
	search_db==Search \
	cpage==1 \
	ecpage==1 \
	ppage==1 \
	spage==1 \
	tpage==1 \
	location==33 \
	filter[keyword]==cpsc449 \
	filter[exact_match]==1 \
	| grep "Best Match:"

echo	
echo == 5. POSITIONAL PARAMETER ==
http --form POST https://catalog.fullerton.edu/search_advanced.php? \
	cur_cat_oid==70 \
	search_database==Search \
	search_db==Search \
	cpage==1 \
	ecpage==1 \
	ppage==1 \
	spage==1 \
	tpage==1 \
	location==33 \
	filter[keyword]==$arg \
	filter[exact_match]==1 \
	| grep "Best Match:"
