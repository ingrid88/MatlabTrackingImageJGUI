function[y]= plotpillarfiles2(filename, background_file,frame_rate,pixels_per_micrometer)


    c=1;
    for i = 1:length(filename)
        plotpillars(filename{1,i},background_file,c,frame_rate,pixels_per_micrometer)
        c=c+1;
    end

end