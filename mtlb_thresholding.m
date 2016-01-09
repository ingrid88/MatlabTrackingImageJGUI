function[] = mtlb_thresholding(file_name)
warning('off', 'Images:initSize:adjustingMag');
ce = 1;

file_extension = file_name(end-3:end);

if file_extension == '.tif'
%%load the tif file
    info = imfinfo(file_name);
    stack_size = numel(info);
    b = imread(file_name, 1);
    figure(2)
    imshow(b);
elseif file_extension == '.avi'
%%load the avi file
    A = VideoReader(file_name);
    stack_size = A.NumberOfFrames;
    b = read(A,1);
    figure(2)
    imshow(b);
else 
   error('please use a tif or avi file!') 
end


%% how many bacteria to pick
prompt = 'how many bacteria do you want to track?';
val = input(prompt);

%Pick bacteria by pressing shift and clicking on the bacteria of interest
S = sprintf('Pick bacteria by pressing shift and clicking on the bacteria of interest');
disp(S)

[x,y] = ginput(val); 
close all;

%output file names
name     = {file_name};
name   = name{1}(1:end-4);
outputFileName = strcat(name,'_BW.tif');

% pre-allocated arrays and cells
list = [];
listF = [];
listR = [];
orientate = [];

%% find the bacteria
    for i = 1:stack_size
        if file_extension == '.avi'
            B=read(A,i);
            C=B(:,:,1);  
        else
            B=imread(file_name, i);
            C=B(:,:,1); 
        end
        
        %% Derivative of Image
        [FX, FY] = gradient(double(C), 1);
        deriv_1 = FX.*FX + FY.*FY;
        diff_threshold      =     10;
        binary_mask = deriv_1 > diff_threshold;
        
        %% Filtering 
        R = 2;          % radius of dilation / erosion. R specifies the radius. R must be a nonnegative integer
        N = 4;          %  N must be 0, 4, 6, or 8
        SE = strel('disk', R, N);
        min_size = 50;

        binary_mask = imfill(binary_mask, 'holes');
        binary_mask = imfill(binary_mask, 'holes');
        binary_mask = imerode(binary_mask, SE);
        binary_mask = bwareaopen(binary_mask, min_size);
        binary_mask = bwareaopen(binary_mask, min_size);
%         figure(2)
%         imshow(binary_mask)
%% COM and # of clusters
    hohenkamp_p = 4;
    [cluster_label, cluster_num] = bwlabel(binary_mask, hohenkamp_p);
    COM = zeros(cluster_num,2);   

    for i=1:cluster_num
         [pos_y,pos_x] = find(cluster_label == i);
         COM(i,1) = mean(pos_x);
         COM(i,2) = mean(pos_y);       
    end 
    actual_cluster_num = length(x); %chosen by user
    cluster_label3 = zeros(size(cluster_label));

%% filter out untracked clusters 
    for i = 1:actual_cluster_num       
        %find COM's that are closest to use picked bacteria
        d = (x(i)-COM(:,1)).^2+(y(i)-COM(:,2)).^2;
        [a b] = min(d);
        track_list(i,1) = b;
        
        %redefine the x and y coordinate of the bacteria
        x(i) = COM(b,1);
        y(i) = COM(b,2);
        cluster_label3(cluster_label==b)=b;  
    end
    figure(2)
    imshow(cluster_label3);
    imwrite(cluster_label3, outputFileName, 'WriteMode', 'append',  'Compression','none');
    ce = ce + 1

    end
end