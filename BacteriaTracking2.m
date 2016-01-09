function varargout = BacteriaTracking2(varargin)
%BACTERIATRACKING2 M-file for BacteriaTracking2.fig
%      BACTERIATRACKING2, by itself, creates a new BACTERIATRACKING2 or raises the existing
%      singleton*.
%
%      H = BACTERIATRACKING2 returns the handle to a new BACTERIATRACKING2 or the handle to
%      the existing singleton*.
%
%      BACTERIATRACKING2('Property','Value',...) creates a new BACTERIATRACKING2 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to BacteriaTracking2_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      BACTERIATRACKING2('CALLBACK') and BACTERIATRACKING2('CALLBACK',hObject,...) call the
%      local function named CALLBACK in BACTERIATRACKING2.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BacteriaTracking2

% Last Modified by GUIDE v2.5 05-Jan-2016 14:12:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BacteriaTracking2_OpeningFcn, ...
                   'gui_OutputFcn',  @BacteriaTracking2_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BacteriaTracking2 is made visible.
function BacteriaTracking2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for BacteriaTracking2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BacteriaTracking2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BacteriaTracking2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in tracking_method.
function tracking_method_Callback(hObject, eventdata, handles)
% hObject    handle to tracking_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tracking_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tracking_method
contents = cellstr(get(hObject,'String'))
choice = contents{get(hObject,'Value')}

switch choice
    case contents{2}
        disp('ImageJ: Multi Pillar Tracking(8bit tif)')
        handles.tracking = 'multiple';
    case contents{3}
        disp('ImageJ: Single Tracking (8bit tif)')
        handles.tracking = 'single';
    case contents{4}
        disp('Matlab: Bacteria Tracking (avi)')
        handles.tracking = 'matlab';
    otherwise
        disp('NONE') 
        handles.tracking = '';
end
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function tracking_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tracking_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in frame_rate_options.
function frame_rate_options_Callback(hObject, eventdata, handles)
% hObject    handle to frame_rate_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns frame_rate_options contents as cell array
%        contents{get(hObject,'Value')} returns selected item from frame_rate_options
contents = cellstr(get(hObject,'String'))
choice = contents{get(hObject,'Value')}

switch choice
    case contents{2}
        disp('20 f/s')
        handles.speed = 20;
    case contents{3}
        disp('10 f/s')
        handles.speed = 10';
    otherwise
        disp('NONE') 
        handles.speed = '';
end

guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function frame_rate_options_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame_rate_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in objective_options.
function objective_options_Callback(hObject, eventdata, handles)
% hObject    handle to objective_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns objective_options contents as cell array
%        contents{get(hObject,'Value')} returns selected item from objective_options
contents = cellstr(get(hObject,'String'))
choice = contents{get(hObject,'Value')}

switch choice
    case contents{2}
        disp('Flash: 60x')
        handles.objective = 9;
    case contents{3}
        disp('Flash: 100x')
        handles.objective = 11.66;
    case contents{4}
        disp('Hulk: 60x')
        handles.objective = 9;
    case contents{5}
        disp('Hulk: 40x')
        handles.objective = 9;
    otherwise
        disp('NONE') 
        handles.objective = '';
end
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function objective_options_CreateFcn(hObject, eventdata, handles)
% hObject    handle to objective_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start_analysis.
function start_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to start_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% variables
analysis_technique = handles.analysis_method;
frame_rate = handles.speed;
pixels_per_micrometer  =  handles.objective;
pillar_files = handles.trak_flz;
try
    background_file = handles.background_file;
catch
    background_file = 0;
end
%% error handling 

% pillar pulls
if strcmp(analysis_technique,'ppulls')
    if strcmp(pillar_files,'')
        error('we need a file list!')
    end
    for i = 1:length(pillar_files)
        if ~strcmp(pillar_files{1,i}(end-3:end),'.txt')
            error('please only choose txt files')
        end
    end
    if strcmp(background_file,'')
        error('we need a background pillar (not moved by bacteria)')
    end
% Centroid Positions
elseif strcmp(analysis_technique,'centroids')
    
    if isa(pillar_files,'cell')
        error('we need 1 avi file to analyse!')
    end
    if ~strcmp(pillar_files(end-3:end),'.tif')
        error('we need a tif stack to work with')
    end
% 1 point Surface Movement
elseif strcmp(analysis_technique,'onesurface')
     if isa(pillar_files,'cell')
         error('we need 1 point to do 1 point analysis of a moving bacteria')
     end
% 2 point Surface Movement
elseif strcmp(analysis_technique,'twosurface')
     if length(pillar_files) ~= 2
         error('we need two points if you want two point analysis')
     end
else
    error('something went wrong')
end

% pillar pulls
if strcmp(analysis_technique,'ppulls')
    plotpillarfiles2(pillar_files, background_file,frame_rate,pixels_per_micrometer)
% Centroid Positions
elseif strcmp(analysis_technique,'centroids')
    centroid_data(pillar_files)
% 1 point Surface Movement
elseif strcmp(analysis_technique,'onesurface')
    plotpillarfiles2_modified()
% 2 point Surface Movement
elseif strcmp(analysis_technique,'twosurface')
    Super()
else
    error('something went wrong')
end


function destination_folder_view_Callback(hObject, eventdata, handles)
% hObject    handle to destination_folder_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of destination_folder_view as text
%        str2double(get(hObject,'String')) returns contents of destination_folder_view as a double


% --- Executes during object creation, after setting all properties.
function destination_folder_view_CreateFcn(hObject, eventdata, handles)
% hObject    handle to destination_folder_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in destination_folder_select.
function destination_folder_select_Callback(hObject, eventdata, handles)
% hObject    handle to destination_folder_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'off');

% handles.video_path     = strcat(pathname,filename);
set(handles.destination_folder_view, 'String',  strcat(pathname,filename));
guidata(hObject,handles)


function analysis_track_files_view_Callback(hObject, eventdata, handles)
% hObject    handle to analysis_track_files_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of analysis_track_files_view as text
%        str2double(get(hObject,'String')) returns contents of analysis_track_files_view as a double


% --- Executes during object creation, after setting all properties.
function analysis_track_files_view_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysis_track_files_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in analysis_track_files_select.
function analysis_track_files_select_Callback(hObject, eventdata, handles)
% hObject    handle to analysis_track_files_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');
% 
handles.trak_flz     = strcat(pathname,filename);
filenamelist = '';
if isa(filename,'cell')
    for k=1:length(filename)
        filenamelist = strcat(' ',filenamelist,filename{k},', ');
    end
    set(handles.analysis_track_files_view, 'String',  filenamelist );
else
    set(handles.analysis_track_files_view, 'String', strcat(pathname,filename));
end
guidata(hObject,handles)


function analysis_background_file_view_Callback(hObject, eventdata, handles)
% hObject    handle to analysis_background_file_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of analysis_background_file_view as text
%        str2double(get(hObject,'String')) returns contents of analysis_background_file_view as a double


% --- Executes during object creation, after setting all properties.
function analysis_background_file_view_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysis_background_file_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in analysis_background_file_select.
function analysis_background_file_select_Callback(hObject, eventdata, handles)
% hObject    handle to analysis_background_file_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'off');

handles.background_file    = strcat(pathname,filename);
set(handles.analysis_background_file_view, 'String',  strcat(pathname,filename));
guidata(hObject,handles)


function video_title_Callback(hObject, eventdata, handles)
% hObject    handle to video_title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of video_title as text
%        str2double(get(hObject,'String')) returns contents of video_title as a double
handles.video_path = get(hObject,'String')
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function video_title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to video_title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in choose_video_file.
function choose_video_file_Callback(hObject, eventdata, handles)
% hObject    handle to choose_video_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');

handles.video_path     = strcat(pathname,filename);
set(handles.video_title, 'String',  strcat(pathname,filename));
guidata(hObject,handles)

% --- Executes on button press in launch_imagej.
function launch_imagej_Callback(hObject, eventdata, handles)
% hObject    handle to launch_imagej (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tracking = handles.tracking;
path_directory = handles.video_path;
    if strcmp(tracking,'multiple') || strcmp(tracking,'single')
        %% Start imageJ
        javaaddpath 'C:\Program Files\MATLAB\R2013a\java\ij.jar'
        javaaddpath 'C:\Program Files\MATLAB\R2013a\java\mij.jar'
        MIJ.start('C:\Program Files\ImageJ\plugins')
        if strcmp(tracking,'multiple')               
            %% Open NanoTracking imageJ Software
            path = strcat('path=[',path_directory,']')            
            MIJ.run('Open...', path);
            MIJ.run('Nano TrackingBis');
        else               
            %% Open NanoTracking imageJ Software
            path = strcat('path=[',path_directory,']')            
            MIJ.run('Open...', path);
            MIJ.run('Nano TrackingBis orig');
        end
    elseif strcmp(tracking,'matlab')
        %% Centroid finding or possibly two point finding 
%         path = strcat('path=[',path_directory,']') 
%         MIJ.run('Open...', path);
%         MIJ.run('
        h = msgbox('Close all Windows Explorer windows before continuing...','Warning')
        mtlb_thresholding(path_directory);
        %% output should be centroid data / the two end points of the bacteria
    end


% --- Executes on selection change in analysis_options.
function analysis_options_Callback(hObject, eventdata, handles)
% hObject    handle to analysis_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns analysis_options contents as cell array
%        contents{get(hObject,'Value')} returns selected item from analysis_options

contents = cellstr(get(hObject,'String'))
choice = contents{get(hObject,'Value')}

switch choice
    case contents{2}
        disp('Pillar Pulls')
        handles.analysis_method = 'ppulls';
    case contents{3}
        disp('Centroid Positions')
        handles.analysis_method = 'centroids';
%         disp('1 point Surface Movement')
%         handles.analysis_method = 'onesurface';
    case contents{4}
        disp('2 point Surface Movement')
        handles.analysis_method = 'twosurface';
    case contents{5}
        disp('Centroid Positions')
        handles.analysis_method = 'centroids';
    otherwise
        disp('NONE') 
        handles.analysis_method = '';
end
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function analysis_options_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysis_options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
