function [start,contour] = IPcontour(img)

% Find starting point
[~,h] = size(img);
starty = ceil(h/2);
searching = true;
stack = [];
startx = 0;
stack(end+1) = starty;

while (searching == true)
    starty = stack(1);
    stack(1)=[];
    if (max(img(starty,:)) > 0)
        % Found a point with an object
        startx = find(img(starty,:), 1);
        searching = false;
    else
        % Do something with starty
        half = round(starty/2);
        if (starty-half == 0 || starty+half > h)
            % reached the edge, no objects found, throw an error
            error('Could not find any object');
        end
        % put two new values on the stack
        % half the difference and subtract/add it from the current value
        stack(end+1) = starty-half;
        stack(end+1) = starty+half;
    end
end

start = [starty, startx];
contour = bwtraceboundary(img,start,'N');

end