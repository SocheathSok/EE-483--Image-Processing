function [out,dict] = imLZW_kh(im)
% [out,dict] = imLZW_kh(im)
%
% A very simple function for LZW compression of an image
% Can find sum of all code lengths as binary: sum(ceil(log2(out)))
%   KH: moved up to a Comment at the top.
%   Original has after last end with # as the comment delimiter.
% im(:) = image referenced as single column stacked vertically
% data = image data convered to 2-digit hex char referenced as single column

    data = dec2hex(im(:),2);    % Stacked columns of image data coded as hex characters
    L = length(im(:));          % Length of im(:) = Mrows * Ncols of im
    dict = mat2cell(dec2hex([0:255],2),ones(256,1),2);  % dict: hex char(0 to 255)
    buffer = '';        % KH: Changed to 2 single quotes to make run properly
    out = uint16([]);   % Create out as a null valued uint16 vector
    n = 257;            % starting index for added codewords in dict

%   Buffer append with next symbol from data
%   Then check if buffer is in dictionary
%       If not,
%           add to dict
%           Find code value for buffer without last symbol append and
%               append to output code out
%            Set buffer to last entered symbol and increment dict index n
%       If in dict, save buffer for next append and interation
%   After last symbol in data is processed, exit add to dict loop

    for i = 1:L,
        newbuffer = strcat(buffer,data(i,:));   % Buffer append with next symbol from data
        if ~ismember(newbuffer,dict),   % If newbuffer is not in dict, Then
            dict{n} = newbuffer;            % Add new Group of symbols code to dict
            [x,m] = ismember(buffer,dict);  % Find dict code for previous buffer
            out = [out,m];                  % Append last symbol/group code 
            n = n+1;                        % Increment dict index n
            buffer = data(i,:);             % Set buffer to last symbol
        else,                           % If newbuffer is in the dict
            buffer = newbuffer;             % save current buffer
        end
    end
    out = [out,im(end)];    % Append last symbol code to out
end
