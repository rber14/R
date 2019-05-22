library(readr)
course_offerings <- read_csv("Downloads/uw-madison-courses/course_offerings.csv")

courses <- read_csv("Downloads/uw-madison-courses/courses.csv")

grade_distributions <- read_csv("Downloads/uw-madison-courses/grade_distributions.csv")

instructors <- read_csv("Downloads/uw-madison-courses/instructors.csv")

rooms <- read_csv("Downloads/uw-madison-courses/rooms.csv")

schedules <- read_csv("Downloads/uw-madison-courses/schedules.csv")

sections <- read_csv("Downloads/uw-madison-courses/sections.csv")

subject_memberships <- read_csv("Downloads/uw-madison-courses/subject_memberships.csv")

subjects <- read_csv("Downloads/uw-madison-courses/subjects.csv")

teachings <- read_csv("Downloads/uw-madison-courses/teachings.csv")

yearCodes <- read_csv("Documents/yr_code_formated.csv")
library(RSQLite)

uwMad = dbConnect(drv = SQLite(), dbname = "/Users/robertocampos/Downloads/uw-madison-courses/database.sqlite3")

dbListTables(uwMad)
courses_byTerm = dbGetQuery(uwMadison, "SELECT course_offerings.uuid as course_offering_uuid, courses.name as courses, course_offerings.term_code FROM courses, course_offerings WHERE courses.uuid = course_offerings.course_uuid AND courses.name = course_offerings.name ORDER BY course_offerings.term_code DESC")
View(courses_byTerm)

dbWriteTable(uwMad, "courses_byTerm" , courses_byTerm)
sections_byterm = dbGetQuery(uwMadison, "SELECT sections.uuid, courses_byTerm.courses, courses_byTerm.term_code FROM courses_byTerm, sections WHERE courses_byTerm.course_offering_uuid = sections.course_offering_uuid")
dbWriteTable(uwMad, "yearCodes", yearCodes)
dbWriteTable(uwMad, "sections_byterm", sections_byterm)

sections_by_year = dbGetQuery(uwMad, "SELECT sections_byterm.uuid, sections_byterm.courses, yearCodes.CalendarYear FROM sections_byterm, yearCodes WHERE yearCodes.term_code = sections_byterm.term_code")
View(sections_by_year)

ggplot(sections_by_year, aes(x=sections_by_year$CalendarYear, color = CalendarYear)) + geom_histogram(alpha = .5) + ggtitle("Year vs. Number of Sections") + theme(plot.title = element_text(hjust = 0.5)) + labs(x="Year", y="Number of Sections")

