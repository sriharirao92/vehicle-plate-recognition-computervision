function varargout = exitDialog(varargin)
% EXITDIALOG M-file for exitDialog.fig
%      EXITDIALOG, by itself, creates a new EXITDIALOG or raises the existing
%      singleton*.
%
%      H = EXITDIALOG returns the handle to a new EXITDIALOG or the handle to
%      the existing singleton*.
%
%      EXITDIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXITDIALOG.M with the given input arguments.
%
%      EXITDIALOG('Property','Value',...) creates a new EXITDIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exitDialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exitDialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help exitDialog
 
% Last Modified by GUIDE v2.5 02-May-2014 16:25:18
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exitDialog_OpeningFcn, ...
                   'gui_OutputFcn',  @exitDialog_OutputFcn, ...
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
 
 
% --- Executes just before exitDialog is made visible.
function exitDialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exitDialog (see VARARGIN)
 
% Choose default command line output for exitDialog
movegui(hObject,'center');
handles.output = hObject;
imshow(imread('question.jpg'));
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes exitDialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = exitDialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on button press in ExitYesPush.
function ExitYesPush_Callback(hObject, eventdata, handles)
% hObject    handle to ExitYesPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(ExitDialog,'visible','off');
set(simple,'visible','off');
 
% --- Executes on button press in ExitNoPush.
function ExitNoPush_Callback(hObject, eventdata, handles)
% hObject    handle to ExitNoPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(ExitDialog,'visible','off');


