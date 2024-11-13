%Class to have the student data
classdef Student
   
    properties
        %Id, full name, age, gpa, and department for each student
        StudentID   
        FullName    
        Age        
        GPA         
        Department  
    end
 
    %Initailize student data
    methods
        function obj = Student(studentID, fullName, age, gpa, department)
            if nargin > 0
                %Make sure Id is at least 3 digits long
                if length(num2str(studentID)) < 3
                    error('Student ID must be at least 3 digits long.');
                end
                %Assign values to each property
                obj.StudentID = studentID;
                obj.FullName = fullName;
                obj.Age = age;
                obj.GPA = gpa;
                obj.Department = department;
            end
        end
        
        % Printing the student information with labels
        function displayInfo(obj)
            fprintf('Student ID: %s\n', num2str(obj.StudentID));
            fprintf('Name: %s\n', obj.FullName);
            fprintf('Age: %d\n', obj.Age);
            fprintf('GPA: %.2f\n', obj.GPA);
            fprintf('Department: %s\n', obj.Department);
            fprintf('-----------------------------\n');
        end
        
        % Make sure the student inputed a valid GPA and tell them if they
        % didn't
        function obj = updateGPA(obj, newGPA)
            if newGPA < 0 || newGPA > 4.0
                error('Invalid GPA. GPA must be between 0 and 4.');
            end
            obj.GPA = newGPA;
        end
    end
end
