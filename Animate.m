
function Animate(drawing,radii,limSetup, offset, pauseVal, makeGif, drawLine)

pauseVal = pauseVal/1000;

figure(1);

if(makeGif) %write gif data
    axis tight manual 
    filename = 'Animacja.gif';
    frame=getframe(gca);
    im=frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    imwrite(imind,cm,filename,'gif','DelayTime',0, 'Loopcount',inf);
end

%animation data
cla;
aone = gca; 
hold on;

d = squeeze(drawing(end,:,:));
d = d';

if(drawLine)
    pl2 = animatedline(aone, 'Color', 'k','LineWidth',2);
else
    pl2 = plot(aone,d(1,1), d(1,2),'k.','MarkerSize',8);
end

set(aone, 'xtick', []); %clear numbers from axes
set(aone, 'ytick', []);

set(aone, 'XLim', [-offset+limSetup.MinX, offset + limSetup.MaX]);
set(aone, 'YLim', [-offset+limSetup.MinY, offset + limSetup.MaY]);

i = 0;

%if there is to many pixels wont't draw circles 
if limSetup.size < 1500 
    
    circ = viscircles(aone, drawing(1:end-1,:,1),radii(2:end),'Color','#FF8800' ,'LineWidth',0.1); % dr(...,1)
    l = plot(aone,drawing(1:end,1,1),drawing(1:end,2,1), 'LineWidth', 2, 'Color', 'r'); %1 ...2
    set(pl2, 'Color','#0072BD');
    
    while i < size(drawing,3)
        i = i+1;
        %delete circles from last frame
        delete(circ);
        
        % draw circles 
        circ = viscircles(aone, drawing(1:end-1,:,i),radii(2:end),'Color', [0.5 0.5 0.5],'LineWidth',0.1);
        % draw radius
        set(l, 'XData', drawing(1:end,1,i), 'YData', drawing(1:end,2,i),'Color','r','LineWidth',2);
        
        %draw image pixel or line
        if(drawLine)
            addpoints(pl2, d(i,1), d(i,2));
        else
            set(pl2,'XData', d(1:i,1),'YData', d(1:i,2));
        end
        drawnow;
        pause(pauseVal);
        if(makeGif)
            frame(i) = getframe(aone); %for gif
        end
        
    end
    delete(circ);
    delete(l);
    
else
    l = plot(aone,drawing(2:end,1,1),drawing(2:end,2,1), 'LineWidth', 2, 'Color', 'r');
    set(pl2, 'Color','#0072BD');
    
    while i < size(drawing,3)
        i = i+1;
        % draw radius
        set(l, 'XData', drawing(1:end,1,i), 'YData', drawing(1:end,2,i),'Color','r','LineWidth',2);
        %draw image pixel or line
        if(drawLine)
            addpoints(pl2, d(i,1), d(i,2));
        else
            set(pl2,'XData', d(1:i,1),'YData', d(1:i,2));
        end
        pause(pauseVal);
        if(makeGif)
            frame(i) = getframe(aone); %for gif
        end
        
    end
    delete(l);
end

hold off;

%making a gif
if(makeGif)
    for index=1:i
        im=frame2im(frame(index)); 
        [imind,cm] = rgb2ind(im,256);
        imwrite(imind,cm,filename, 'gif','DelayTime',0,'WriteMode','append');
    end
end


end

