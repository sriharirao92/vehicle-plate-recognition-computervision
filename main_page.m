function varargout = main_page(varargin)
% MAIN_PAGE M-file for main_page.fig
%      MAIN_PAGE, by itself, creates a new MAIN_PAGE or raises the existing
%      singleton*.
%
%      H = MAIN_PAGE returns the handle to a new MAIN_PAGE or the handle to
%      the existing singleton*.
%
%      MAIN_PAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_PAGE.M with the given input arguments.
%
%      MAIN_PAGE('Property','Value',...) creates a new MAIN_PAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_page_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_page_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help main_page
 
% Last Modified by GUIDE v2.5 02-May-2014 15:57:38
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_page_OpeningFcn, ...
                   'gui_OutputFcn',  @main_page_OutputFcn, ...
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
 
 
% --- Executes just before main_page is made visible.
function main_page_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_page (see VARARGIN)
movegui(hObject,'center');
% Choose default command line output for main_page
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes main_page wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = main_page_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(main_page,'visible','off');
simple();
 
 
% --- Executes on button press in ReadMePush.
function ReadMePush_Callback(hObject, eventdata, handles)
% hObject    handle to ReadMePush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('D:\ALL IP\buildgui.pdf');


