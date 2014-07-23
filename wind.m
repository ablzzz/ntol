function y=wind(x,fs)

frame_len=1*fs;
shift=0.25*fs;
no_frames=max(floor((length(x)-frame_len)/shift),0)+1;
if no_frames==1
    y(1,:)=x;
    y_out=y;
else

    for i=1:no_frames
        y(i,:)=x((i-1)*shift+1:(i-1)*shift+frame_len);
    end
    [m,ind]=max(diag(y*y'));
    y_out=y(ind,:);
end
