PGDMP  !    ;                }            cargo_express    17.4    17.4 ^    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17268    cargo_express    DATABASE     s   CREATE DATABASE cargo_express WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU';
    DROP DATABASE cargo_express;
                     cargo_express_owner    false            �            1259    17417    cargos    TABLE       CREATE TABLE public.cargos (
    id integer NOT NULL,
    client_id integer NOT NULL,
    employee_id integer,
    route_id integer NOT NULL,
    cargo_name character varying(255) NOT NULL,
    payment_method character varying(100),
    payment_status character varying(100),
    cargo_status character varying(100),
    cargo_weight numeric(10,3),
    cargo_volume numeric(10,3)
);
    DROP TABLE public.cargos;
       public         heap r       postgres    false            �           0    0    TABLE cargos    COMMENT     b   COMMENT ON TABLE public.cargos IS 'Информация о перевозимых грузах.';
          public               postgres    false    226            �           0    0    COLUMN cargos.id    COMMENT     �   COMMENT ON COLUMN public.cargos.id IS 'Уникальный идентификатор груза (первичный ключ).';
          public               postgres    false    226            �           0    0    COLUMN cargos.client_id    COMMENT     �   COMMENT ON COLUMN public.cargos.client_id IS 'Внешний ключ к таблице clients, указывающий на клиента-отправителя.';
          public               postgres    false    226            �           0    0    COLUMN cargos.employee_id    COMMENT     �   COMMENT ON COLUMN public.cargos.employee_id IS 'Внешний ключ к таблице employees, указывающий на сотрудника, ответственного за груз.';
          public               postgres    false    226            �           0    0    COLUMN cargos.route_id    COMMENT     �   COMMENT ON COLUMN public.cargos.route_id IS 'Внешний ключ к таблице routes, указывающий на маршрут перевозки груза.';
          public               postgres    false    226            �           0    0    COLUMN cargos.cargo_name    COMMENT     n   COMMENT ON COLUMN public.cargos.cargo_name IS 'Наименование или описание груза.';
          public               postgres    false    226            �           0    0    COLUMN cargos.payment_method    COMMENT     �   COMMENT ON COLUMN public.cargos.payment_method IS 'Метод оплаты за перевозку (например, Наличные, Карта, Безнал).';
          public               postgres    false    226            �           0    0    COLUMN cargos.payment_status    COMMENT     �   COMMENT ON COLUMN public.cargos.payment_status IS 'Статус оплаты (например, Ожидает оплаты, Оплачен, Просрочен).';
          public               postgres    false    226            �           0    0    COLUMN cargos.cargo_status    COMMENT     �   COMMENT ON COLUMN public.cargos.cargo_status IS 'Текущий статус груза (например, Принят, В пути, Доставлен, Отменен).';
          public               postgres    false    226            �           0    0    COLUMN cargos.cargo_weight    COMMENT     �   COMMENT ON COLUMN public.cargos.cargo_weight IS 'Вес груза в условных единицах (например, кг).';
          public               postgres    false    226            �           0    0    COLUMN cargos.cargo_volume    COMMENT     �   COMMENT ON COLUMN public.cargos.cargo_volume IS 'Объём груза в условных единицах (например, м³).';
          public               postgres    false    226            �            1259    17416    cargos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cargos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.cargos_id_seq;
       public               postgres    false    226            �           0    0    cargos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.cargos_id_seq OWNED BY public.cargos.id;
          public               postgres    false    225            �            1259    17384    clients    TABLE     4  CREATE TABLE public.clients (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    middle_name character varying(100),
    date_of_birth date,
    phone_number character varying(50),
    email character varying(255),
    address text
);
    DROP TABLE public.clients;
       public         heap r       postgres    false            �           0    0    TABLE clients    COMMENT     P   COMMENT ON TABLE public.clients IS 'Информация о клиентах.';
          public               postgres    false    220            �           0    0    COLUMN clients.id    COMMENT     �   COMMENT ON COLUMN public.clients.id IS 'Уникальный идентификатор клиента (первичный ключ).';
          public               postgres    false    220            �           0    0    COLUMN clients.first_name    COMMENT     I   COMMENT ON COLUMN public.clients.first_name IS 'Имя клиента.';
          public               postgres    false    220                        0    0    COLUMN clients.last_name    COMMENT     P   COMMENT ON COLUMN public.clients.last_name IS 'Фамилия клиента.';
          public               postgres    false    220                       0    0    COLUMN clients.middle_name    COMMENT     T   COMMENT ON COLUMN public.clients.middle_name IS 'Отчество клиента.';
          public               postgres    false    220                       0    0    COLUMN clients.date_of_birth    COMMENT     _   COMMENT ON COLUMN public.clients.date_of_birth IS 'Дата рождения клиента.';
          public               postgres    false    220                       0    0    COLUMN clients.phone_number    COMMENT     u   COMMENT ON COLUMN public.clients.phone_number IS 'Контактный номер телефона клиента.';
          public               postgres    false    220                       0    0    COLUMN clients.email    COMMENT     j   COMMENT ON COLUMN public.clients.email IS 'Адрес электронной почты клиента.';
          public               postgres    false    220                       0    0    COLUMN clients.address    COMMENT     J   COMMENT ON COLUMN public.clients.address IS 'Адрес клиента.';
          public               postgres    false    220            �            1259    17383    clients_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public               postgres    false    220                       0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public               postgres    false    219            �            1259    17406 	   employees    TABLE     <  CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    middle_name character varying(100),
    date_of_birth date,
    phone_number character varying(50),
    email character varying(255),
    vehicle_id integer
);
    DROP TABLE public.employees;
       public         heap r       postgres    false                       0    0    TABLE employees    COMMENT     X   COMMENT ON TABLE public.employees IS 'Информация о сотрудниках.';
          public               postgres    false    224                       0    0    COLUMN employees.id    COMMENT     �   COMMENT ON COLUMN public.employees.id IS 'Уникальный идентификатор сотрудника (первичный ключ).';
          public               postgres    false    224            	           0    0    COLUMN employees.first_name    COMMENT     Q   COMMENT ON COLUMN public.employees.first_name IS 'Имя сотрудника.';
          public               postgres    false    224            
           0    0    COLUMN employees.last_name    COMMENT     X   COMMENT ON COLUMN public.employees.last_name IS 'Фамилия сотрудника.';
          public               postgres    false    224                       0    0    COLUMN employees.middle_name    COMMENT     \   COMMENT ON COLUMN public.employees.middle_name IS 'Отчество сотрудника.';
          public               postgres    false    224                       0    0    COLUMN employees.date_of_birth    COMMENT     g   COMMENT ON COLUMN public.employees.date_of_birth IS 'Дата рождения сотрудника.';
          public               postgres    false    224                       0    0    COLUMN employees.phone_number    COMMENT     }   COMMENT ON COLUMN public.employees.phone_number IS 'Контактный номер телефона сотрудника.';
          public               postgres    false    224                       0    0    COLUMN employees.email    COMMENT     r   COMMENT ON COLUMN public.employees.email IS 'Адрес электронной почты сотрудника.';
          public               postgres    false    224                       0    0    COLUMN employees.vehicle_id    COMMENT     �   COMMENT ON COLUMN public.employees.vehicle_id IS 'Внешний ключ к таблице vehicles, указывающий на закрепленное транспортное средство.';
          public               postgres    false    224            �            1259    17405    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public               postgres    false    224                       0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public               postgres    false    223            �            1259    17395    routes    TABLE     T  CREATE TABLE public.routes (
    id integer NOT NULL,
    route_number character varying(50) NOT NULL,
    origin character varying(255) NOT NULL,
    destination character varying(255) NOT NULL,
    departure_date date,
    arrival_date date,
    route_distance numeric(10,2),
    route_status character varying(100),
    comments text
);
    DROP TABLE public.routes;
       public         heap r       postgres    false                       0    0    TABLE routes    COMMENT     d   COMMENT ON TABLE public.routes IS 'Информация о маршрутах перевозок.';
          public               postgres    false    222                       0    0    COLUMN routes.id    COMMENT     �   COMMENT ON COLUMN public.routes.id IS 'Уникальный идентификатор маршрута (первичный ключ).';
          public               postgres    false    222                       0    0    COLUMN routes.route_number    COMMENT     e   COMMENT ON COLUMN public.routes.route_number IS 'Уникальный номер маршрута.';
          public               postgres    false    222                       0    0    COLUMN routes.origin    COMMENT     a   COMMENT ON COLUMN public.routes.origin IS 'Пункт отправления маршрута.';
          public               postgres    false    222                       0    0    COLUMN routes.destination    COMMENT     d   COMMENT ON COLUMN public.routes.destination IS 'Пункт назначения маршрута.';
          public               postgres    false    222                       0    0    COLUMN routes.departure_date    COMMENT     �   COMMENT ON COLUMN public.routes.departure_date IS 'Планируемая или фактическая дата отправления по маршруту.';
          public               postgres    false    222                       0    0    COLUMN routes.arrival_date    COMMENT     �   COMMENT ON COLUMN public.routes.arrival_date IS 'Планируемая или фактическая дата прибытия по маршруту.';
          public               postgres    false    222                       0    0    COLUMN routes.route_distance    COMMENT     �   COMMENT ON COLUMN public.routes.route_distance IS 'Расстояние по маршруту в условных единицах (например, км).';
          public               postgres    false    222                       0    0    COLUMN routes.route_status    COMMENT     �   COMMENT ON COLUMN public.routes.route_status IS 'Текущий статус маршрута (например, Запланирован, Активен, Завершен).';
          public               postgres    false    222                       0    0    COLUMN routes.comments    COMMENT     x   COMMENT ON COLUMN public.routes.comments IS 'Дополнительные комментарии к маршруту.';
          public               postgres    false    222            �            1259    17394    routes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.routes_id_seq;
       public               postgres    false    222                       0    0    routes_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;
          public               postgres    false    221            �            1259    17373    vehicles    TABLE     �   CREATE TABLE public.vehicles (
    id integer NOT NULL,
    make character varying(255),
    plate_number character varying(50),
    color character varying(50),
    condition text,
    inspection_date date,
    vehicle_type character varying(100)
);
    DROP TABLE public.vehicles;
       public         heap r       postgres    false                       0    0    TABLE vehicles    COMMENT     l   COMMENT ON TABLE public.vehicles IS 'Информация о транспортных средствах.';
          public               postgres    false    218                       0    0    COLUMN vehicles.id    COMMENT     �   COMMENT ON COLUMN public.vehicles.id IS 'Уникальный идентификатор транспортного средства (первичный ключ).';
          public               postgres    false    218                       0    0    COLUMN vehicles.make    COMMENT     e   COMMENT ON COLUMN public.vehicles.make IS 'Марка транспортного средства.';
          public               postgres    false    218                       0    0    COLUMN vehicles.plate_number    COMMENT     �   COMMENT ON COLUMN public.vehicles.plate_number IS 'Государственный номер транспортного средства.';
          public               postgres    false    218                        0    0    COLUMN vehicles.color    COMMENT     d   COMMENT ON COLUMN public.vehicles.color IS 'Цвет транспортного средства.';
          public               postgres    false    218            !           0    0    COLUMN vehicles.condition    COMMENT     �   COMMENT ON COLUMN public.vehicles.condition IS 'Текущее состояние транспортного средства.';
          public               postgres    false    218            "           0    0    COLUMN vehicles.inspection_date    COMMENT        COMMENT ON COLUMN public.vehicles.inspection_date IS 'Дата последнего технического осмотра.';
          public               postgres    false    218            #           0    0    COLUMN vehicles.vehicle_type    COMMENT     �   COMMENT ON COLUMN public.vehicles.vehicle_type IS 'Тип транспортного средства (например, грузовик, фургон).';
          public               postgres    false    218            �            1259    17372    vehicles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.vehicles_id_seq;
       public               postgres    false    218            $           0    0    vehicles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;
          public               postgres    false    217            9           2604    17420 	   cargos id    DEFAULT     f   ALTER TABLE ONLY public.cargos ALTER COLUMN id SET DEFAULT nextval('public.cargos_id_seq'::regclass);
 8   ALTER TABLE public.cargos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            6           2604    17387 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            8           2604    17409    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            7           2604    17398 	   routes id    DEFAULT     f   ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);
 8   ALTER TABLE public.routes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            5           2604    17376    vehicles id    DEFAULT     j   ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);
 :   ALTER TABLE public.vehicles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    17417    cargos 
   TABLE DATA           �   COPY public.cargos (id, client_id, employee_id, route_id, cargo_name, payment_method, payment_status, cargo_status, cargo_weight, cargo_volume) FROM stdin;
    public               postgres    false    226   �k       �          0    17384    clients 
   TABLE DATA           v   COPY public.clients (id, first_name, last_name, middle_name, date_of_birth, phone_number, email, address) FROM stdin;
    public               postgres    false    220   �m       �          0    17406 	   employees 
   TABLE DATA           {   COPY public.employees (id, first_name, last_name, middle_name, date_of_birth, phone_number, email, vehicle_id) FROM stdin;
    public               postgres    false    224   �p       �          0    17395    routes 
   TABLE DATA           �   COPY public.routes (id, route_number, origin, destination, departure_date, arrival_date, route_distance, route_status, comments) FROM stdin;
    public               postgres    false    222   �q       �          0    17373    vehicles 
   TABLE DATA           k   COPY public.vehicles (id, make, plate_number, color, condition, inspection_date, vehicle_type) FROM stdin;
    public               postgres    false    218   �s       %           0    0    cargos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cargos_id_seq', 16, true);
          public               postgres    false    225            &           0    0    clients_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clients_id_seq', 10, true);
          public               postgres    false    219            '           0    0    employees_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.employees_id_seq', 5, true);
          public               postgres    false    223            (           0    0    routes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.routes_id_seq', 12, true);
          public               postgres    false    221            )           0    0    vehicles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.vehicles_id_seq', 6, true);
          public               postgres    false    217            K           2606    17424    cargos cargos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cargos DROP CONSTRAINT cargos_pkey;
       public                 postgres    false    226            ?           2606    17393    clients clients_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_email_key;
       public                 postgres    false    220            A           2606    17391    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public                 postgres    false    220            G           2606    17415    employees employees_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_email_key;
       public                 postgres    false    224            I           2606    17413    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public                 postgres    false    224            C           2606    17402    routes routes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.routes DROP CONSTRAINT routes_pkey;
       public                 postgres    false    222            E           2606    17404    routes routes_route_number_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_route_number_key UNIQUE (route_number);
 H   ALTER TABLE ONLY public.routes DROP CONSTRAINT routes_route_number_key;
       public                 postgres    false    222            ;           2606    17380    vehicles vehicles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.vehicles DROP CONSTRAINT vehicles_pkey;
       public                 postgres    false    218            =           2606    17382 "   vehicles vehicles_plate_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_plate_number_key UNIQUE (plate_number);
 L   ALTER TABLE ONLY public.vehicles DROP CONSTRAINT vehicles_plate_number_key;
       public                 postgres    false    218            M           2606    17430    cargos fk_cargo_client    FK CONSTRAINT     �   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT fk_cargo_client FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.cargos DROP CONSTRAINT fk_cargo_client;
       public               postgres    false    4673    220    226            N           2606    17435    cargos fk_cargo_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT fk_cargo_employee FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.cargos DROP CONSTRAINT fk_cargo_employee;
       public               postgres    false    226    4681    224            O           2606    17440    cargos fk_cargo_route    FK CONSTRAINT     �   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT fk_cargo_route FOREIGN KEY (route_id) REFERENCES public.routes(id) ON DELETE RESTRICT;
 ?   ALTER TABLE ONLY public.cargos DROP CONSTRAINT fk_cargo_route;
       public               postgres    false    4675    222    226            L           2606    17425    employees fk_employee_vehicle    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employee_vehicle FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employee_vehicle;
       public               postgres    false    224    218    4667            �   C  x��T[��@�n��cy<�ع'��x�Z@2R`����+�Drv����
=7��ǉ��	�Q�xU�U=m�����9/}�+��;^rK��|�X��+�������K|�}M��wXm�7��y��G�sCƥ�KS2I��QF]���?au��ʿ!���\`��`�T`�}C|��_��# ')��<#KȖ�N��8��F&G,,�K�J"QN94ˉoU��o��+Ɩ��2T�
	l!D��"��\�E'd���!�.�g�9[1,P�� �5������#�+�����#S�91�I��Xm
�ļ#�G�� �Xr�C�f�l���`��A�:l��_y�|�
�iӤkI.������)��=�T˘Jѳ���*��A��3�yq�:w�pM�x�D���դ4F����꺐c`hÕ9K�!j{�.Qà��<��l+Tg*�{�M�Wqr̴�ej��<�䗽Ї���n�Q(\�k!6t2+'$�G���Nf��-49I3sԾܻ����C
潀y0�i�+Ea{��Vi���bJo�1�_wZ�S�\�|��O7����^IE� ���      �   �  x�]TKN�@^�O�}��o�8AO��W�H�(	e�*��DՇ�(QU�]�EH�p�n�o�6�U�����FgtK%�]Q%��t���4�u}Isy�Dٖ-,�a,��0�Y6Ir>H��b���%�A/�[E��#Zr����@,���I3n
��r�7FTf.O�G-���K̃D�X�o9�"a�,X������~���p�ѣ��;U��{>�k���0\F�h��� ���<�֨�>�i	V�����oٮ%lE���f	��a7�� ��v�����j�όB�c�M�P�/�㴒�[�q1�d�_�DYBXN�Ɔ,�;��y:)/F�p�m�ʎ������u�6�.΃R����a���Ct@{�7�l�'EoG��ei>�r�Q-��E� sL+��jd���Z�E�}+�S�V,�cح��B�q]x�G��Jj��.�:B�;Ű<�!�m�����W�硎bA�S���P����;�w,��m��|?�6��
6>l�A�C��F���JZʓ.�Ȉ]�w��X�ƌ�yl=��λaFQ���IO���q[�ƀ�|"#f�9ׁ�JC��6}YK>��_=oxײ����,�<��b�z��ӡ�V�P�`�&]7�e,��l�o��lۇ~��Cy"O�:\b�U���.P�!�@��N� �y1�v4ߡ����k��
rg&U��tz�׼c�����(      �     x�]�AN�@��o�bf23�Bw���i�E�0Y!7,ؘc4ޠ�F��ύ��:��7������a�5�ѽ�	/ؠ���>Pۥ]�{�D*�\���t��T墘�c3��6�2?w�b���Ʈ�Eu
s��K힍[X9z&��p�=]ǐ�p:1������nq���=v~ꃾ��\^r�z\C��/n���6e�3��2�����_��_A�:�J�$t҉���%�s�A������^�!�x��vȝ�ז�V��q���Hc��f~wv	��1��<�H      �   �  x��T�N�@|�~E ����>�M411�1��^
HU(�p����[i��> ��vfΜ�*q|2�R	z�Ҝ��	z��6�e&z����3����{.���@���5T"�rIA�5��撖�t�Ġ��7���i��i�����3�[f�q$��G0�R-�k��@����[&�B��G^�������YU,p�O�a��b����#83@$an��vPK�B �\�[����Y�X���4��a�G�D�SZs��9SQ+�GЬ��\7uwP�T��,���q���٬Ǵn�`X͹ŵJ��p|�����f��%�G��0��̘_�h'5a ;���%�Aq��W��B6�ԉ���V��ٰ�E�n�P��/��,��\ѧOs���FNw���w-x^�U򖽣8�ޙjo�tݺ�E�O:��goa�͜���}EA?�r���>�k�A4a�Ӻ��j�Gn�Il0Ώ�0"�K:�<��Σ�      �     x����JA��٧�Vv�n�Oy���F�`B��a:�,D,��A��ʒ��=��9�!Q,����o�� ��vօu�؉���Tr�=Q��\�dɂV:��R!Э�)���Wn�<��褃i
t�_>ݕ�,�a����lт�5J��&*�ݬ;(��I��5���4��&�݄�k7cѪ6YK*�=�)�{��R�l��B����_����[<-Qy�kF,�L8�#����#� ����j3U���ٰGQ�4�[�=�H~C?6��B�/�k��     