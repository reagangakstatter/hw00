% Author: Reagan Gakstatter / reg0052@auburn.edu
% Date: 2024-09-01
% Assignment Name: hw00

% The following class defines 3 functions for each problem respectively.
% Please follow the instruction inside each function. 

classdef hw00 
    methods (Static)

        function a_m = p1(m)
            % This function takes an integer m and returns the term a_m in the sequence defined by 
            % a_0 = 0, a_1 = 1, a_2 = 1, and a_n = a_{n-1} + a_{n-2} + a_{n-3} for n >= 3.
            % :param m: an integer
            % :return: the m-th term in the sequence

            if m < 0
                error('m must be a non-negative integer');
            elseif m == 0
                a_m = 0;
            elseif m == 1 || m == 2
                a_m = 1;
            else
                % Initialize the first three terms of the sequence
                a = zeros(1, m+1);
                a(1) = 0; % a_0
                a(2) = 1; % a_1
                a(3) = 1; % a_2
                
                % Use the recurrence relation to compute subsequent terms
                for n = 4:m+1
                    a(n) = a(n-1) + a(n-2) + a(n-3);
                end
                
                % Return the m-th term
                a_m = a(m+1);
            end
        end

        function det_A = p2(A)
            % This function takes a matrix A of size n x n and returns the determinant of A.
            % :param A: a matrix of size n x n
            % :return: the determinant of A

            if size(A,1) ~= size(A,2)
                error('A must be a square matrix');
            else
                % Recursive Laplace expansion to compute the determinant
                n = size(A, 1);
                
                % Base case for 1x1 matrix
                if n == 1
                    det_A = A(1,1);
                    return;
                end

                % Base case for 2x2 matrix
                if n == 2
                    det_A = A(1,1) * A(2,2) - A(1,2) * A(2,1);
                    return;
                end

                % Recursive case for n x n matrix
                det_A = 0;
                for j = 1:n
                    % Minor of A by removing the first row and j-th column
                    minor_A = A(2:end, [1:j-1, j+1:end]);
                    det_A = det_A + (-1)^(1+j) * A(1,j) * hw00.p2(minor_A);
                end
            end
        end

        function p3()
            % This function should have a run time about 1 second.
            % :return: no returns
            
            % Start timer
            tic;

            % Busy-wait until elapsed time reaches approximately 1 second
            while toc < 1
                % Busy loop, no operation inside the loop
            end

            % Display the elapsed time
            disp(['Elapsed time: ', num2str(toc), ' seconds']);
        end

    end
end
