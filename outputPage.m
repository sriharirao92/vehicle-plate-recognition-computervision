function varargout = simple(varargin)
% SIMPLE M-file for simple.fig
%      SIMPLE, by itself, creates a new SIMPLE or raises the existing
%      singleton*.
%
%      H = SIMPLE returns the handle to a new SIMPLE or the handle to
%      the existing singleton*.
%
%      SIMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLE.M with the given input arguments.
%
%      SIMPLE('Property','Value',...) creates a new SIMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simple_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simple_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help simple
 
% Last Modified by GUIDE v2.5 05-May-2014 00:56:09
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simple_OpeningFcn, ...
                   'gui_OutputFcn',  @simple_OutputFcn, ...
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
 
 
% --- Executes just before simple is made visible.
function simple_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simple (see VARARGIN)
movegui(hObject,'center');
set(handles.Status,'string','Waiting for input...');
set(handles.vehnum,'string',' ');
set(handles.SelectImage,'value',1);
handles.current_data=imread('Image0.jpg');
imshow(imresize(handles.current_data,[370 480]));
% Choose default command line output for simple
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes simple wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = simple_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on selection change in SelectImage.
function SelectImage_Callback(hObject, eventdata, handles)
% hObject    handle to SelectImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.vehnum,'string',' ');
    str = get(handles.SelectImage, 'String');
    val = get(handles.SelectImage,'Value');
    switch str{val};
       
        case ' ' % User selects nothing.
         handles.current_data = imread('Image0.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
      
        case 'Image1' % User selects Image1.
         handles.current_data = imread('Image1.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
      
        case 'Image2' % User selects Image2.
         handles.current_data = imread('Image2.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
      
        case 'Image3' % User selects Image3.
        handles.current_data = imread('Image3.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
      
        case 'Image4' % User selects Image4.
         handles.current_data = imread('Image4.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
      
        case 'Image5' % User selects Image5.
         handles.current_data = imread('Image5.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image6' % User selects Image6.
         handles.current_data = imread('Image6.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image7' % User selects Image7.
           handles.current_data = imread('Image7.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image8' % User selects Image8.
            handles.current_data = imread('Image8.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image9' % User selects Image9.
              handles.current_data = imread('Image9.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image10' % User selects Image10.
              handles.current_data = imread('Image10.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image11' % User selects Image11.
              handles.current_data = imread('Image11.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image12' % User selects Image12.
              handles.current_data = imread('Image12.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image13' % User selects Image13.
              handles.current_data = imread('Image13.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image14' % User selects Image14.
             handles.current_data = imread('Image14.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
         
        case 'Image15' % User selects Image15.
              handles.current_data = imread('Image15.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image16' % User selects Image16.
            handles.current_data = imread('Image16.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image17' % User selects Image17.
              handles.current_data = imread('Image17.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
        
        case 'Image18' % User selects Image18.
              handles.current_data = imread('Image18.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
         
         case 'Image19' % User selects Image19.
              handles.current_data = imread('Image19.jpg') ;
         imshow(imresize(handles.current_data,[370 480]));
         
    end
    set(handles.Status,'string','Press RUN')
      
      
% Hints: contents = cellstr(get(hObject,'String')) returns SelectImage contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectImage
    guidata(hObject, handles);
 
% --- Executes during object creation, after setting all properties.
function SelectImage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exitDialog();
 
% --- Executes during object creation, after setting all properties.
function RealTimeImg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RealTimeImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: place code in OpeningFcn to populate RealTimeImg
 
 
% --- Executes during object creation, after setting all properties.
function vehnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vehnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
      
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'string',y,'FontSize',30,'BackgroundColor','black','ForegroundColor','white');
% end
 
 
% --- Executes on button press in RunPushButton.
function RunPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to RunPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.SelectImage,'Value');
if(val==1)
    SelectImage();
else
set(handles.Status,'string','Please Wait....');
pause(0.1);
phase1(handles.current_data);
set(handles.Status,'string','Done');
fopen('output.txt','r');
y=fileread('output.txt');
set(handles.vehnum,'string',y);
gh=get(handles.uploadcheck,'value');
    if(gh==1)
        q=fileread('output.txt');
        javaaddpath 'mysql-connector-java-5.1.30-bin.jar';
        conn=database('anpr', 'root', 'root123', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost/');
        colnames = {'num','date','time'};
        date = datestr(now,'dd-mm-yyyy');
        Time = datestr(now,'HH:MM:SS');
        exdata = {q,date,Time};
        insert(conn,'anpr_timelog',colnames,exdata);
    end
end
 
 
% --- Executes on button press in uploadcheck.
function uploadcheck_Callback(hObject, eventdata, handles)
% hObject    handle to uploadcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
u=get(hObject,'value');
if(u~=1)
    set(handles.UploadPush,'visible','on');
    pause(0.1);
else
    set(handles.UploadPush,'visible','off');
    pause(0.1);
end
% Hint: get(hObject,'Value') returns toggle state of uploadcheck
 
 
% --- Executes on button press in UploadPush.
function UploadPush_Callback(hObject, eventdata, handles)
% hObject    handle to UploadPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q=fileread('output.txt');
javaaddpath 'mysql-connector-java-5.1.30-bin.jar';
conn=database('anpr', 'root', 'root123', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost/');
colnames = {'num','date','time'};
Date = datestr(now,'dd-mm-yyyy');
Time = datestr(now,'HH:MM:SS');
exdata = {q,Date,Time};
insert(conn,'anpr_timelog',colnames,exdata);
set(handles.Status,'string','Manual upload complete');
pause(0.1)
 
% --- Executes on button press in MainPagePush.
function MainPagePush_Callback(hObject, eventdata, handles)
% hObject    handle to MainPagePush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(simple,'visible','off');
main_page();
 
% --- Executes during object creation, after setting all properties.
function uploadcheck_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uploadcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'value',1);
 
 
% --- Executes during object creation, after setting all properties.
function UploadPush_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UploadPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'visible','off');
 
 
% --- Executes during object creation, after setting all properties.
function Status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% set(hObject,'string','Waiting for input...');


