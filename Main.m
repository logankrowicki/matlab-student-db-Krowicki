%Create database for students
db = StudentDatabase();

% Sample student data
student1 = Student('564', 'Jack Johnson', 22, 3.6, 'Computer Programming');
student2 = Student('927', 'Allen Moore', 21, 2.8, 'Mechanical Engineering');
student3 = Student('284', 'Tommy Boone', 23, 3.2, 'Literature');
student4 = Student('834', 'Emily Smith', 20, 3.8, 'Art');

% Add to data base
db = db.addStudent(student1);
db = db.addStudent(student2);
db = db.addStudent(student3);
db = db.addStudent(student4);

% Saving to the file
db.saveToFile('student_database.mat');

% Retrieve data base from file
dbLoaded = db.loadFromFile('student_database.mat');

% Display student information with Id
student = dbLoaded.findStudentByID('564');
if ~isempty(student)
    student.displayInfo();
end

% Retrieve the students department
csStudents = dbLoaded.getStudentsByDepartment('Computer Programming');
for i = 1:length(csStudents)
    csStudents(i).displayInfo();
end

% Create plot
visualizeData(dbLoaded);

% Function to create and visualize data
function visualizeData(studentDatabase)
    % Pull data
    gpas = [studentDatabase.Students.GPA];
    ages = [studentDatabase.Students.Age];
    departments = {studentDatabase.Students.Department};
    
    % Histogram for GPA
    figure;
    histogram(gpas, 10, 'FaceColor', 'c', 'EdgeColor', 'k');
    %Chart titles
    title('GPA Distribution');
    xlabel('GPA');
    ylabel('Number of Students');
    grid on;
    
    % Bar Chart for Average GPA
    uniqueDepts = unique(departments);
    avgGPAs = zeros(1, length(uniqueDepts));
    for i = 1:length(uniqueDepts)
        deptGPA = gpas(strcmp(departments, uniqueDepts{i}));
        avgGPAs(i) = mean(deptGPA);
    end
    figure;
    bar(avgGPAs, 'FaceColor', 'm');
    set(gca, 'XTickLabel', uniqueDepts);
    %Chart titles
    title('Average GPA by Department');
    xlabel('Department');
    ylabel('Average GPA');
    grid on;
    
    % Histogram for Age
    figure;
    histogram(ages, 8, 'FaceColor', 'g', 'EdgeColor', 'k');
    %Chart titles
    title('Age Distribution');
    xlabel('Age');
    ylabel('Number of Students');
    grid on;
end
