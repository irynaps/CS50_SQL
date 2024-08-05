CREATE INDEX "course_title_index" ON "courses" ("title");
CREATE INDEX "department_index" ON "courses" ("department");
CREATE INDEX "semester_index" ON "courses" ("semester");

CREATE INDEX "name_index" ON "students" ("name");

CREATE INDEX "student_index" ON "enrollments" ("student_id");
CREATE INDEX "course_enrollments_index" ON "enrollments" ("course_id");

CREATE INDEX "course_satisfies_index" ON "satisfies" ("course_id");
CREATE INDEX "requirement_satisfies_index" ON "satisfies" ("requirement_id");

CREATE INDEX "requitements_index" ON "requirements" ("name");
