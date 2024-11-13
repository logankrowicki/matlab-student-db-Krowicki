%Manage student data
classdef StudentDatabase
    properties
        %Array to hold students data
        Students = [];  
    end
    
    methods
        % Create student database object
        function obj = StudentDatabase()
            %Create empty array for data
            obj.Students = [];  
        end
        
        % Add a students data to the data base
        function obj = addStudent(obj, student)
            %Use array to add student data
            obj.Students = [obj.Students, student]; 
        end
        
        % Finding a student using their ID
        function student = findStudentByID(obj, studentID)
            student = [];  
            for i = 1:length(obj.Students)
                % Look through all students and compare to find ID
                if strcmp(obj.Students(i).StudentID, studentID)
                    %Return if the student is found
                    student = obj.Students(i);  
                    return;
                end
            end
            disp('Student not found.');
        end
        
        % List the students by their department
        function studentsInDept = getStudentsByDepartment(obj, department)
            studentsInDept = [];
            %loop through and add students to departments
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).Department, department)
                    studentsInDept = [studentsInDept, obj.Students(i)];
                end
            end
        end
        
        % Saving data to file
        function saveToFile(obj, filename)
            try
                save(filename, 'obj');  % Save the database to a .mat file
                fprintf('Database saved to %s\n', filename);
            catch
                error('Error saving database to file.');
            end
        end
        
        % Load the database from a file
        function obj = loadFromFile(obj, filename)
            try
                %Load and retrive data
                data = load(filename);  
                obj = data.obj;  
                fprintf('Database loaded from %s\n', filename);
            catch
                %Error if the file cannot be found
                error('Error loading database from file.');
            end
        end
    end
end
