function varargout = Information_Hiding(varargin)
addpath(genpath(pwd));%����ʹ���ļ��е�m�ļ�
% Last Modified by GUIDE v2.5 02-Dec-2019 19:09:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Information_Hiding_OpeningFcn, ...
                   'gui_OutputFcn',  @Information_Hiding_OutputFcn, ...
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

function figure1_CreateFcn(hObject, eventdata, handles)
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
ii=imread('background.jpg');%����ͼƬ
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','on');

%��ʼ������
function Information_Hiding_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
setappdata(handles.axes1,'flageax',0);
setappdata(handles.axes1,'flag',0);
setappdata(handles.axes7,'flag',0);
setappdata(handles.axes7,'flageax',0);
setappdata(handles.axes9,'flag',0);
setappdata(handles.axes9,'flageax',0);
set(handles.uipanel9, 'Visible', 'On');
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');
set(handles.uipanel6, 'Visible', 'off');
set(handles.uipanel7, 'Visible', 'off');
% set(handles.uipanel2, 'Position', [43 1.5 64 16.857]);  % �����û������
handles.output = hObject;
guidata(hObject, handles);
function varargout = Information_Hiding_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%LSB�˵�
function LSB_Callback(hObject, eventdata, handles)
set(handles.uipanel1, 'Visible', 'On');
set(handles.uipanel3, 'Visible', 'On');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');
set(handles.uipanel6, 'Visible', 'off');
set(handles.uipanel7, 'Visible', 'off');
set(handles.uipanel9, 'Visible', 'off');
%LSBѡ������ͼƬ
function togglebutton4_Callback(hObject, eventdata, handles)
inputphoto=uigetfile('*.*','ѡ������ͼƬ');
if inputphoto==0
    msgbox('δѡ���κ�ͼƬ','��ʾ');
else
    setappdata(handles.axes1,'flag',1);
    setappdata(handles.axes1,'inputphoto',inputphoto);
    setappdata(handles.axes1,'flag',1);
    axes(handles.axes1);
    imshow(inputphoto);
    msgbox('ѡ������ͼƬ�ɹ�','��ʾ');
end
%LSB��д��Ϣ
function togglebutton1_Callback(hObject, eventdata, handles)
if getappdata(handles.axes1,'flag')<1
    msgbox('δѡ��ͼƬ','��ʾ');
else
    setappdata(handles.axes1,'flag',2);%����дflag
    inputphoto=getappdata(handles.axes1,'inputphoto');%�ó�ͼƬ��Ϣ
    string=get(handles.edit1,'string');
    key=double(str2num(get(handles.edit5,'string')));%�õ��������key
    set(handles.edit8,'string',key);%����һ��
    [ste_cover,len_total]=randanhide(inputphoto,'read.txt','LSB_hide.bmp',key,string);
    axes(handles.axes6);imshow(ste_cover);
    msgbox('������Ϣ�ɹ�,��������Ϣ��LSB_hide.bmp��','��ʾ');
    len_total=len_total;
    set(handles.edit7,'string',len_total);
    set(handles.edit9,'string',len_total);%������λ
%     setappdata(handles.axes1,'len_total',len_total);
end
function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%LSBrandѡ��hide����ͼƬ
function togglebutton12_Callback(hObject, eventdata, handles)
setgophoto=uigetfile('*.*','ѡ������ͼƬ');
setappdata(handles.axes1,'setgophoto',setgophoto);
setappdata(handles.axes1,'flageax',1)
%LSBrand��ȡ��Ϣ
function togglebutton3_Callback(hObject, eventdata, handles)
if getappdata(handles.axes1,'flageax')<1
    msgbox('δѡ��ͼƬ','��ʾ');
else
    % len_total=getappdata(handles.axes1,'len_total')
    len_total=double(str2num(get(handles.edit9,'string')));%������λ
    key=double(str2num(get(handles.edit8,'string')));%�õ��������key
    setgophoto=getappdata(handles.axes1,'setgophoto');
    %�����Ϣ
    randlsbget(setgophoto,len_total,'extract.txt',key);
    extract=fread(fopen( 'extract.txt', 'r'),inf,'char=>char');
    set(handles.text10,'string',extract');
    msgbox('��ȡ��Ϣ�ɹ�,����ȡ��extract.txt��','��ʾ');
end
%################����ΪLSB�ĵ���
%################���¿�ʼDCT
%DCTѡ��ͼƬ
function togglebutton9_Callback(hObject, eventdata, handles)
inputphoto=uigetfile('*.*','ѡ������ͼƬ');
if inputphoto==0
    msgbox('δѡ���κ�ͼƬ','��ʾ');
else
    setappdata(handles.axes7,'flag',1);
    setappdata(handles.axes7,'inputphoto',inputphoto);
    axes(handles.axes7);
    imshow(inputphoto);
    msgbox('ѡ������ͼƬ�ɹ�','��ʾ');
end
%DCT��д��ť
function togglebutton8_Callback(hObject, eventdata, handles)
if getappdata(handles.axes7,'flag')<1
    msgbox('δѡ��ͼƬ','��ʾ');
else
    setappdata(handles.axes7,'flag',2);%����дflag
    inputphoto=getappdata(handles.axes7,'inputphoto');%�ó�ͼƬ��Ϣ
    string=get(handles.edit3,'string');%���������Ϣ
    key=double(str2num(get(handles.edit10,'string')));%�õ��������key
    set(handles.edit12,'string',key);%����һ��
    [count,msg,result]=hidedctadv1(inputphoto,'DCT_hide.bmp','read.txt',key,0.1,string);
    axes(handles.axes8);imshow(result);%չʾ��дͼƬ
    msgbox('������Ϣ�ɹ�,��������Ϣ��DCT_hide.bmp��','��ʾ');
    set(handles.edit11,'string',count);
    set(handles.edit13,'string',count);%������λ
end
%DCT��ȡѡ��ͼƬ
function togglebutton13_Callback(hObject, eventdata, handles)
setgophoto=uigetfile('*.*','ѡ������ͼƬ');
setappdata(handles.axes7,'setgophoto',setgophoto);
setappdata(handles.axes7,'flageax',1);
%DCT��ȡ
function togglebutton7_Callback(hObject, eventdata, handles)
if getappdata(handles.axes7,'flageax')<1
else
    len_total=double(str2num(get(handles.edit13,'string')));%������λ
    key=double(str2num(get(handles.edit12,'string')));%�õ��������key
    setgophoto=getappdata(handles.axes7,'setgophoto');
    %�����Ϣ
    extractdctadv1(setgophoto,'extract.txt',key,len_total);
    extract=fread(fopen( 'extract.txt', 'r'),inf,'char=>char');
    set(handles.text14,'string',extract');
    msgbox('��ȡ��Ϣ�ɹ�,����ȡ��extract.txt��','��ʾ');
 end
%DCT�İ�ť
function DCT_Callback(hObject, eventdata, handles)
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'on');
set(handles.uipanel5, 'Visible', 'on');
set(handles.uipanel6, 'Visible', 'off');
set(handles.uipanel7, 'Visible', 'off');
set(handles.uipanel9, 'Visible', 'off');
%################����ΪDCT
%################���¿�ʼWSVD
%WSVD�Ĳ˵�
function Untitled_2_Callback(hObject, eventdata, handles)
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');
set(handles.uipanel6, 'Visible', 'on');
set(handles.uipanel7, 'Visible', 'on');
set(handles.uipanel9, 'Visible', 'off');
%WSVDѡ��ˮӡ
function togglebutton16_Callback(hObject, eventdata, handles)
inputphoto=uigetfile('*.*','ѡ������ͼƬ');
if inputphoto==0
    msgbox('δѡ���κ�ͼƬ','��ʾ');
else
    setappdata(handles.axes9,'flag',1);
    setappdata(handles.axes9,'inputphoto',inputphoto);
    axes(handles.axes9);
    imshow(inputphoto);
    msgbox('ѡ������ͼƬ�ɹ�','��ʾ');
end
%WSVDǶ��ˮӡ
function togglebutton15_Callback(hObject, eventdata, handles)
if getappdata(handles.axes9,'flag')<1
    msgbox('δѡ��ͼƬ','��ʾ');
else
    inputphoto=getappdata(handles.axes9,'inputphoto');%�ó�ͼƬ��Ϣ
    key=double(str2num(get(handles.edit14,'string')));%�õ��������key
    [ watermarkimagergb, watermarkimage, waterCA, watermark2,correlationU, correlationV] =...
    water( inputphoto, 'Water_hide.png', key, 'db6',2 , 0.1, 0.99);
    msgbox('ˮӡ��Ƕ��Water_hide.png��','��ʾ');
    axes(handles.axes10);imshow(watermarkimage);%չʾ��дͼƬ
    set(handles.edit19,'string',key);
end
%WSVD��ȡѡ��ͼƬ
function togglebutton18_Callback(hObject, eventdata, handles)
inputimg=uigetfile('*.*','ѡ������ͼƬ');
setappdata(handles.axes9,'inputimg',inputimg);
setappdata(handles.axes9,'flageax',1);
%WSVDѡ��ԭͼ
function togglebutton17_Callback(hObject, eventdata, handles)
if getappdata(handles.axes9,'flageax')<1
    msgbox('δѡ��ԭͼ','��ʾ');
else
    setgophoto=uigetfile('*.*','ѡ������ͼƬ');
    setappdata(handles.axes9,'setgophoto',setgophoto);
    setappdata(handles.axes9,'flageax',2);
end
%WSVD�Ƚ�
function togglebutton14_Callback(hObject, eventdata, handles)
if getappdata(handles.axes9,'flageax')<1
    msgbox('δѡ��ԭͼ','��ʾ');
elseif getappdata(handles.axes9,'flageax')<2
    msgbox('δѡ��ˮӡͼ','��ʾ');
else
    key=double(str2num(get(handles.edit19,'string')));%�õ��������key
    inputimg=getappdata(handles.axes9,'inputimg');
    setgophoto=getappdata(handles.axes9,'setgophoto');
    %�����Ϣ
    [ corr_coef, corr_DCTcoef] = wavedetect( setgophoto, inputimg, key, 'db6',2 , 0.1, 0.99)
    set(handles.edit20,'string',corr_coef);
    msgbox('�Ƚϳɹ�','��ʾ');
end
%˵���˵�
function Untitled_3_Callback(hObject, eventdata, handles)
set(handles.uipanel9, 'Visible', 'On');
set(handles.uipanel1, 'Visible', 'off');
set(handles.uipanel3, 'Visible', 'off');
set(handles.uipanel4, 'Visible', 'off');
set(handles.uipanel5, 'Visible', 'off');
set(handles.uipanel6, 'Visible', 'off');
set(handles.uipanel7, 'Visible', 'off');

    
    
    
 %##################
 %����Ϊ������Ļص���
 %#################
function popupmenu2_Callback(hObject, eventdata, handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu2_ButtonDownFcn(hObject, eventdata, handles)

function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function togglebutton7_CreateFcn(hObject, eventdata, handles)

function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)

function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)

function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit9_Callback(hObject, eventdata, handles)

function edit9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit10_Callback(hObject, eventdata, handles)

function edit10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(hObject, eventdata, handles)

function edit11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit12_Callback(hObject, eventdata, handles)

function edit12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_Callback(hObject, eventdata, handles)

function edit13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit14_Callback(hObject, eventdata, handles)

function edit14_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit19_Callback(hObject, eventdata, handles)

function edit19_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit20_Callback(hObject, eventdata, handles)

function edit20_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton1_Callback(hObject, eventdata, handles)

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% --- Executes on button press in radiobutton3.

function radiobutton3_Callback(hObject, eventdata, handles)

% hObject    handle to radiobutton3 (see GCBO)