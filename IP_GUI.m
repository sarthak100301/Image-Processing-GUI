function varargout = IP_GUI(varargin)
% IP_GUI MATLAB code for IP_GUI.fig
%      IP_GUI, by itself, creates a new IP_GUI or raises the existing
%      singleton*.
%
%      H = IP_GUI returns the handle to a new IP_GUI or the handle to
%      the existing singleton*.
%
%      IP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IP_GUI.M with the given input arguments.
%
%      IP_GUI('Property','Value',...) creates a new IP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IP_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IP_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IP_GUI

% Last Modified by GUIDE v2.5 01-Dec-2021 01:14:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IP_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @IP_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before IP_GUI is made visible.
function IP_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IP_GUI (see VARARGIN)

% Choose default command line output for IP_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IP_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IP_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rot_clock.
function rot_clock_Callback(hObject, eventdata, handles)
% hObject    handle to rot_clock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
aclock=a;
aclock=imrotate(aclock,270);
axes(handles.axes1);
imshow(aclock);


% --- Executes on button press in rot_anti_clock.
function rot_anti_clock_Callback(hObject, eventdata, handles)
% hObject    handle to rot_anti_clock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
aclock=a;
aclock=imrotate(aclock,90);
axes(handles.axes1);
imshow(aclock);


% --- Executes on button press in edg_dect.
function edg_dect_Callback(hObject, eventdata, handles)
% hObject    handle to edg_dect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
aedge=a;
aedge=rgb2gray(aedge);
aedge=edge(aedge,'Canny');
axes(handles.axes1);
imshow(aedge);


% --- Executes on button press in comp_img.
function comp_img_Callback(hObject, eventdata, handles)
% hObject    handle to comp_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
acomp=a;
acomp=imcomplement(acomp);
axes(handles.axes1);
imshow(acomp);


% --- Executes on button press in rgb_noise.
function rgb_noise_Callback(hObject, eventdata, handles)
% hObject    handle to rgb_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
I=a;
J = imnoise(I,'salt & pepper',0.2);
axes(handles.axes1);
imshow(J);


% --- Executes on button press in rgb_noise_filt.
function rgb_noise_filt_Callback(hObject, eventdata, handles)
% hObject    handle to rgb_noise_filt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
I=a;
J = imnoise(I,'salt & pepper',0.2);
r = medfilt2(J(:, :, 1), [3 3]);
g = medfilt2(J(:, :, 2), [3 3]);
b = medfilt2(J(:, :, 3), [3 3]);
% reconstruct the image from r,g,b channels
K = cat(3, r, g, b);
axes(handles.axes1);
imshow(K);


% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
axes(handles.axes1);
imshow(a);


% --- Executes on button press in upload_image.
function upload_image_Callback(hObject, eventdata, handles)
% hObject    handle to upload_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('.jpg')
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)

% --- Executes on button press in rgb_to_gray.
function rgb_to_gray_Callback(hObject, eventdata, handles)
% hObject    handle to rgb_to_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
agray=rgb2gray(a);
axes(handles.axes1);
imshow(agray);


% --- Executes on button press in bin_image.
function bin_image_Callback(hObject, eventdata, handles)
% hObject    handle to bin_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
abw=im2bw(a);
axes(handles.axes1);
imshow(abw)


% --- Executes on button press in histogram_button.
function histogram_button_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
ahist=a;
ahist=rgb2gray(ahist);
imhist(ahist);
img_adj = imadjust(ahist, [0.4,0.86],[0.0,1.0]);
axes(handles.axes1);
% hold on;
imhist(ahist);
% imhist(img_adj);
% hold off;


% --- Executes on button press in histogram_adjust.
function histogram_adjust_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_adjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
img_eq = histeq(a);
axes(handles.axes1);
imshow(img_eq);


% --- Executes on button press in gray_adj.
function gray_adj_Callback(hObject, eventdata, handles)
% hObject    handle to gray_adj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
img=a;
gray = rgb2gray(img);
adj_img = imadjust(gray, [0.3,0.7],[]);
axes(handles.axes1);
imshow(adj_img);


% --- Executes on button press in obj_detect.
function obj_detect_Callback(hObject, eventdata, handles)
% hObject    handle to obj_detect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
picture = a;
%%load the AlexNet which is already pre-trained and store it in nnet
nnet = alexnet;
image(picture);    
%%resize the picture to [227,227] since the AlexNet has been trained with images of the size [227,227] and our image must be compared with them. It will be easier to compare if the images are of the same dimensions.
picture = imresize(picture,[227,227]);
imshow(picture);
%%classify command to find the category to which the image belongs and we store that in variable 'label'
label = classify(nnet, picture);
title(upper(char(label)));


% --- Executes on button press in save_image.
function save_image_Callback(hObject, eventdata, handles)
% hObject    handle to save_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
img=a;
[filename, foldername] = uiputfile('.jpg','.tif','Where do you want to save it!');
complete_name = fullfile(foldername, filename);
imwrite(img, complete_name);
