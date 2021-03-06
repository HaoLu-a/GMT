% TdFilterUnit < ProcBaseUnit
% FIR and IIR filtering for time-domain inputs. 
%
% TdFilterUnit Properties:
%  *coeffNum - numerator coefficients of z-transformed filter transfer function
%              [nCh x nCoeff]
%  *coeffDenom - denominator coefficients of z transfer function
%                [nCh x nCoeff]
%
% TdFilterUnit Methods:
%   TdFilterUnit - create new object (parent, ID, cN, cD) 
%
% Copyright (c) 2012-2020 Advanced Bionics. All rights reserved.

classdef TdFilterUnit < ProcUnit
    properties (SetObservable)
        coeffNum = 1; % numerator coefficients of z-transformed transfer function
        coeffDenom = 1; % denominator coefficients
        enable = true; 
    end 
    methods
        function obj = TdFilterUnit(parent, ID, cN, cD, enable)
            % obj = TDFilterUnit(parent, ID, cN, cD)
            % Create new object with speficied parent, ID, coeffNum and coeffDenom
            % If unspecified, cN and cD default to 1.
            obj = obj@ProcUnit(parent, ID, 1 ,1);
            if nargin > 2
                obj.coeffNum = cN;
            end
            if nargin > 3 
                obj.coeffDenom = cD;
            end
            if nargin > 4 
                obj.enable = enable;
            end
            
        end
        
        function y = run(obj)
            % y = run(obj)
            x = obj.getInput(1);
            if obj.enable
                y = tdFilterFunc(obj, x);
            else
                y = x;
            end
            obj.setOutput(1, y);
        end
    end
end