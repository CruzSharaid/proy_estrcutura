PGDMP                      |            posss    17.0    17.0 n    y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            {           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            |           1262    16495    posss    DATABASE     x   CREATE DATABASE posss WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE posss;
                     postgres    false            �            1255    16613    crear_usuario_estudiante()    FUNCTION     �   CREATE FUNCTION public.crear_usuario_estudiante() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO usuarios (username, password, rol)
    VALUES (NEW.cod_est::TEXT, NEW.cod_est::TEXT, 'ESTUDIANTE');
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.crear_usuario_estudiante();
       public               postgres    false            �            1259    16496 
   asignatura    TABLE     �   CREATE TABLE public.asignatura (
    cod_asig integer NOT NULL,
    nom_asig character varying(100),
    cod_doc integer,
    cod_sem integer,
    cod_carr integer
);
    DROP TABLE public.asignatura;
       public         heap r       postgres    false            �            1259    16499    asignatura_cod_asig_seq    SEQUENCE     �   CREATE SEQUENCE public.asignatura_cod_asig_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.asignatura_cod_asig_seq;
       public               postgres    false    217            }           0    0    asignatura_cod_asig_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.asignatura_cod_asig_seq OWNED BY public.asignatura.cod_asig;
          public               postgres    false    218            �            1259    16698    asignatura_horario_dia    TABLE     �   CREATE TABLE public.asignatura_horario_dia (
    id integer NOT NULL,
    asignatura_id integer,
    dia_id integer,
    horario_id integer
);
 *   DROP TABLE public.asignatura_horario_dia;
       public         heap r       postgres    false            �            1259    16697    asignatura_horario_dia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asignatura_horario_dia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.asignatura_horario_dia_id_seq;
       public               postgres    false    239            ~           0    0    asignatura_horario_dia_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.asignatura_horario_dia_id_seq OWNED BY public.asignatura_horario_dia.id;
          public               postgres    false    238            �            1259    16500 
   asistencia    TABLE     �   CREATE TABLE public.asistencia (
    id_asist integer NOT NULL,
    fecha_asist date,
    estado_asist character varying(50),
    cod_est character varying(20),
    cod_asig integer
);
    DROP TABLE public.asistencia;
       public         heap r       postgres    false            �            1259    16503    asistencia_id_asist_seq    SEQUENCE     �   CREATE SEQUENCE public.asistencia_id_asist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.asistencia_id_asist_seq;
       public               postgres    false    219                       0    0    asistencia_id_asist_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.asistencia_id_asist_seq OWNED BY public.asistencia.id_asist;
          public               postgres    false    220            �            1259    16504    carrera    TABLE     h   CREATE TABLE public.carrera (
    cod_carr integer NOT NULL,
    descrip_carr character varying(100)
);
    DROP TABLE public.carrera;
       public         heap r       postgres    false            �            1259    16507    carrera_cod_carr_seq    SEQUENCE     �   CREATE SEQUENCE public.carrera_cod_carr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.carrera_cod_carr_seq;
       public               postgres    false    221            �           0    0    carrera_cod_carr_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.carrera_cod_carr_seq OWNED BY public.carrera.cod_carr;
          public               postgres    false    222            �            1259    16638    dias    TABLE     e   CREATE TABLE public.dias (
    id integer NOT NULL,
    nombre_dia character varying(20) NOT NULL
);
    DROP TABLE public.dias;
       public         heap r       postgres    false            �            1259    16637    dias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dias_id_seq;
       public               postgres    false    235            �           0    0    dias_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dias_id_seq OWNED BY public.dias.id;
          public               postgres    false    234            �            1259    16508    docente    TABLE     �   CREATE TABLE public.docente (
    cod_doc integer NOT NULL,
    nom_doc character varying(50),
    apat_doc character varying(50),
    amat_doc character varying(50),
    tit_doc character varying(50)
);
    DROP TABLE public.docente;
       public         heap r       postgres    false            �            1259    16511    docente_cod_doc_seq    SEQUENCE     �   CREATE SEQUENCE public.docente_cod_doc_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.docente_cod_doc_seq;
       public               postgres    false    223            �           0    0    docente_cod_doc_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.docente_cod_doc_seq OWNED BY public.docente.cod_doc;
          public               postgres    false    224            �            1259    16735    documento_permiso    TABLE     �   CREATE TABLE public.documento_permiso (
    id_doc integer NOT NULL,
    id_per integer,
    ruta_pdf character varying(500) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.documento_permiso;
       public         heap r       postgres    false            �            1259    16734    documento_permiso_id_doc_seq    SEQUENCE     �   CREATE SEQUENCE public.documento_permiso_id_doc_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.documento_permiso_id_doc_seq;
       public               postgres    false    241            �           0    0    documento_permiso_id_doc_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.documento_permiso_id_doc_seq OWNED BY public.documento_permiso.id_doc;
          public               postgres    false    240            �            1259    16512 
   estudiante    TABLE     >  CREATE TABLE public.estudiante (
    cod_est character varying(20) NOT NULL,
    nombre_est character varying(100),
    apat_est character varying(100),
    amat_est character varying(100),
    ci_est integer,
    correo_est character varying(200),
    cod_sem integer,
    cod_carr integer,
    id_usuario integer
);
    DROP TABLE public.estudiante;
       public         heap r       postgres    false            �            1259    16645    horario    TABLE     i   CREATE TABLE public.horario (
    id integer NOT NULL,
    descripcion character varying(10) NOT NULL
);
    DROP TABLE public.horario;
       public         heap r       postgres    false            �            1259    16644    horario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.horario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.horario_id_seq;
       public               postgres    false    237            �           0    0    horario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.horario_id_seq OWNED BY public.horario.id;
          public               postgres    false    236            �            1259    16517    jefatura    TABLE     �   CREATE TABLE public.jefatura (
    cod_jef integer NOT NULL,
    nombre_jef character varying(100),
    cargo_jef character varying(100),
    cod_carr integer,
    cod_usuario integer
);
    DROP TABLE public.jefatura;
       public         heap r       postgres    false            �            1259    16520    jefatura_cod_jef_seq    SEQUENCE     �   CREATE SEQUENCE public.jefatura_cod_jef_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.jefatura_cod_jef_seq;
       public               postgres    false    226            �           0    0    jefatura_cod_jef_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.jefatura_cod_jef_seq OWNED BY public.jefatura.cod_jef;
          public               postgres    false    227            �            1259    16521    permiso    TABLE       CREATE TABLE public.permiso (
    id_per integer NOT NULL,
    fecha_sol_per date,
    motivo_per character varying(500),
    estado_per character varying(50),
    comprb bytea,
    cod_est character varying(20),
    cod_jef integer,
    fecha_permitida date,
    cod_asig integer
);
    DROP TABLE public.permiso;
       public         heap r       postgres    false            �            1259    16526    permiso_id_per_seq    SEQUENCE     �   CREATE SEQUENCE public.permiso_id_per_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permiso_id_per_seq;
       public               postgres    false    228            �           0    0    permiso_id_per_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permiso_id_per_seq OWNED BY public.permiso.id_per;
          public               postgres    false    229            �            1259    16527    semestre    TABLE     g   CREATE TABLE public.semestre (
    cod_sem integer NOT NULL,
    descrip_sem character varying(100)
);
    DROP TABLE public.semestre;
       public         heap r       postgres    false            �            1259    16530    semestre_cod_sem_seq    SEQUENCE     �   CREATE SEQUENCE public.semestre_cod_sem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.semestre_cod_sem_seq;
       public               postgres    false    230            �           0    0    semestre_cod_sem_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.semestre_cod_sem_seq OWNED BY public.semestre.cod_sem;
          public               postgres    false    231            �            1259    16605    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    rol text NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    16604    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public               postgres    false    233            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public               postgres    false    232            �            1259    24911    usuarios_id_seq1    SEQUENCE     �   ALTER TABLE public.usuarios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    233            �           2604    16531    asignatura cod_asig    DEFAULT     z   ALTER TABLE ONLY public.asignatura ALTER COLUMN cod_asig SET DEFAULT nextval('public.asignatura_cod_asig_seq'::regclass);
 B   ALTER TABLE public.asignatura ALTER COLUMN cod_asig DROP DEFAULT;
       public               postgres    false    218    217            �           2604    16701    asignatura_horario_dia id    DEFAULT     �   ALTER TABLE ONLY public.asignatura_horario_dia ALTER COLUMN id SET DEFAULT nextval('public.asignatura_horario_dia_id_seq'::regclass);
 H   ALTER TABLE public.asignatura_horario_dia ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    238    239    239            �           2604    16532    asistencia id_asist    DEFAULT     z   ALTER TABLE ONLY public.asistencia ALTER COLUMN id_asist SET DEFAULT nextval('public.asistencia_id_asist_seq'::regclass);
 B   ALTER TABLE public.asistencia ALTER COLUMN id_asist DROP DEFAULT;
       public               postgres    false    220    219            �           2604    16533    carrera cod_carr    DEFAULT     t   ALTER TABLE ONLY public.carrera ALTER COLUMN cod_carr SET DEFAULT nextval('public.carrera_cod_carr_seq'::regclass);
 ?   ALTER TABLE public.carrera ALTER COLUMN cod_carr DROP DEFAULT;
       public               postgres    false    222    221            �           2604    16641    dias id    DEFAULT     b   ALTER TABLE ONLY public.dias ALTER COLUMN id SET DEFAULT nextval('public.dias_id_seq'::regclass);
 6   ALTER TABLE public.dias ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    234    235            �           2604    16534    docente cod_doc    DEFAULT     r   ALTER TABLE ONLY public.docente ALTER COLUMN cod_doc SET DEFAULT nextval('public.docente_cod_doc_seq'::regclass);
 >   ALTER TABLE public.docente ALTER COLUMN cod_doc DROP DEFAULT;
       public               postgres    false    224    223            �           2604    16738    documento_permiso id_doc    DEFAULT     �   ALTER TABLE ONLY public.documento_permiso ALTER COLUMN id_doc SET DEFAULT nextval('public.documento_permiso_id_doc_seq'::regclass);
 G   ALTER TABLE public.documento_permiso ALTER COLUMN id_doc DROP DEFAULT;
       public               postgres    false    240    241    241            �           2604    16648 
   horario id    DEFAULT     h   ALTER TABLE ONLY public.horario ALTER COLUMN id SET DEFAULT nextval('public.horario_id_seq'::regclass);
 9   ALTER TABLE public.horario ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    236    237            �           2604    16535    jefatura cod_jef    DEFAULT     t   ALTER TABLE ONLY public.jefatura ALTER COLUMN cod_jef SET DEFAULT nextval('public.jefatura_cod_jef_seq'::regclass);
 ?   ALTER TABLE public.jefatura ALTER COLUMN cod_jef DROP DEFAULT;
       public               postgres    false    227    226            �           2604    16536    permiso id_per    DEFAULT     p   ALTER TABLE ONLY public.permiso ALTER COLUMN id_per SET DEFAULT nextval('public.permiso_id_per_seq'::regclass);
 =   ALTER TABLE public.permiso ALTER COLUMN id_per DROP DEFAULT;
       public               postgres    false    229    228            �           2604    16537    semestre cod_sem    DEFAULT     t   ALTER TABLE ONLY public.semestre ALTER COLUMN cod_sem SET DEFAULT nextval('public.semestre_cod_sem_seq'::regclass);
 ?   ALTER TABLE public.semestre ALTER COLUMN cod_sem DROP DEFAULT;
       public               postgres    false    231    230            ]          0    16496 
   asignatura 
   TABLE DATA           T   COPY public.asignatura (cod_asig, nom_asig, cod_doc, cod_sem, cod_carr) FROM stdin;
    public               postgres    false    217   �       s          0    16698    asignatura_horario_dia 
   TABLE DATA           W   COPY public.asignatura_horario_dia (id, asignatura_id, dia_id, horario_id) FROM stdin;
    public               postgres    false    239   ��       _          0    16500 
   asistencia 
   TABLE DATA           \   COPY public.asistencia (id_asist, fecha_asist, estado_asist, cod_est, cod_asig) FROM stdin;
    public               postgres    false    219   7�       a          0    16504    carrera 
   TABLE DATA           9   COPY public.carrera (cod_carr, descrip_carr) FROM stdin;
    public               postgres    false    221   �       o          0    16638    dias 
   TABLE DATA           .   COPY public.dias (id, nombre_dia) FROM stdin;
    public               postgres    false    235   Ə       c          0    16508    docente 
   TABLE DATA           P   COPY public.docente (cod_doc, nom_doc, apat_doc, amat_doc, tit_doc) FROM stdin;
    public               postgres    false    223   �       u          0    16735    documento_permiso 
   TABLE DATA           U   COPY public.documento_permiso (id_doc, id_per, ruta_pdf, fecha_creacion) FROM stdin;
    public               postgres    false    241   ��       e          0    16512 
   estudiante 
   TABLE DATA           �   COPY public.estudiante (cod_est, nombre_est, apat_est, amat_est, ci_est, correo_est, cod_sem, cod_carr, id_usuario) FROM stdin;
    public               postgres    false    225   �       q          0    16645    horario 
   TABLE DATA           2   COPY public.horario (id, descripcion) FROM stdin;
    public               postgres    false    237   B�       f          0    16517    jefatura 
   TABLE DATA           Y   COPY public.jefatura (cod_jef, nombre_jef, cargo_jef, cod_carr, cod_usuario) FROM stdin;
    public               postgres    false    226   n�       h          0    16521    permiso 
   TABLE DATA           �   COPY public.permiso (id_per, fecha_sol_per, motivo_per, estado_per, comprb, cod_est, cod_jef, fecha_permitida, cod_asig) FROM stdin;
    public               postgres    false    228   �       j          0    16527    semestre 
   TABLE DATA           8   COPY public.semestre (cod_sem, descrip_sem) FROM stdin;
    public               postgres    false    230   ��      m          0    16605    usuarios 
   TABLE DATA           ?   COPY public.usuarios (id, username, password, rol) FROM stdin;
    public               postgres    false    233   g�      �           0    0    asignatura_cod_asig_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.asignatura_cod_asig_seq', 1, false);
          public               postgres    false    218            �           0    0    asignatura_horario_dia_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.asignatura_horario_dia_id_seq', 275, true);
          public               postgres    false    238            �           0    0    asistencia_id_asist_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.asistencia_id_asist_seq', 129, true);
          public               postgres    false    220            �           0    0    carrera_cod_carr_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.carrera_cod_carr_seq', 1, false);
          public               postgres    false    222            �           0    0    dias_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.dias_id_seq', 5, true);
          public               postgres    false    234            �           0    0    docente_cod_doc_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.docente_cod_doc_seq', 1, false);
          public               postgres    false    224            �           0    0    documento_permiso_id_doc_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.documento_permiso_id_doc_seq', 1, false);
          public               postgres    false    240            �           0    0    horario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.horario_id_seq', 3, true);
          public               postgres    false    236            �           0    0    jefatura_cod_jef_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.jefatura_cod_jef_seq', 1, false);
          public               postgres    false    227            �           0    0    permiso_id_per_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permiso_id_per_seq', 43, true);
          public               postgres    false    229            �           0    0    semestre_cod_sem_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.semestre_cod_sem_seq', 1, false);
          public               postgres    false    231            �           0    0    usuarios_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.usuarios_id_seq', 181, false);
          public               postgres    false    232            �           0    0    usuarios_id_seq1    SEQUENCE SET     @   SELECT pg_catalog.setval('public.usuarios_id_seq1', 185, true);
          public               postgres    false    242            �           2606    16703 2   asignatura_horario_dia asignatura_horario_dia_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.asignatura_horario_dia
    ADD CONSTRAINT asignatura_horario_dia_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.asignatura_horario_dia DROP CONSTRAINT asignatura_horario_dia_pkey;
       public                 postgres    false    239            �           2606    16539    asignatura asignatura_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (cod_asig);
 D   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_pkey;
       public                 postgres    false    217            �           2606    16541    asistencia asistencia_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_pkey PRIMARY KEY (id_asist);
 D   ALTER TABLE ONLY public.asistencia DROP CONSTRAINT asistencia_pkey;
       public                 postgres    false    219            �           2606    16543    carrera carrera_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (cod_carr);
 >   ALTER TABLE ONLY public.carrera DROP CONSTRAINT carrera_pkey;
       public                 postgres    false    221            �           2606    16643    dias dias_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.dias
    ADD CONSTRAINT dias_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.dias DROP CONSTRAINT dias_pkey;
       public                 postgres    false    235            �           2606    16545    docente docente_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (cod_doc);
 >   ALTER TABLE ONLY public.docente DROP CONSTRAINT docente_pkey;
       public                 postgres    false    223            �           2606    16743 (   documento_permiso documento_permiso_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.documento_permiso
    ADD CONSTRAINT documento_permiso_pkey PRIMARY KEY (id_doc);
 R   ALTER TABLE ONLY public.documento_permiso DROP CONSTRAINT documento_permiso_pkey;
       public                 postgres    false    241            �           2606    16720 $   estudiante estudiante_id_usuario_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_id_usuario_key UNIQUE (id_usuario);
 N   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_id_usuario_key;
       public                 postgres    false    225            �           2606    16547    estudiante estudiante_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (cod_est);
 D   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_pkey;
       public                 postgres    false    225            �           2606    16650    horario horario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.horario DROP CONSTRAINT horario_pkey;
       public                 postgres    false    237            �           2606    16549    jefatura jefatura_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.jefatura
    ADD CONSTRAINT jefatura_pkey PRIMARY KEY (cod_jef);
 @   ALTER TABLE ONLY public.jefatura DROP CONSTRAINT jefatura_pkey;
       public                 postgres    false    226            �           2606    16551    permiso permiso_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id_per);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public                 postgres    false    228            �           2606    16553    semestre semestre_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.semestre
    ADD CONSTRAINT semestre_pkey PRIMARY KEY (cod_sem);
 @   ALTER TABLE ONLY public.semestre DROP CONSTRAINT semestre_pkey;
       public                 postgres    false    230            �           2606    16612    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    233            �           2606    16554 "   asignatura asignatura_cod_doc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_cod_doc_fkey FOREIGN KEY (cod_doc) REFERENCES public.docente(cod_doc);
 L   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_cod_doc_fkey;
       public               postgres    false    217    4775    223            �           2606    16704 @   asignatura_horario_dia asignatura_horario_dia_asignatura_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura_horario_dia
    ADD CONSTRAINT asignatura_horario_dia_asignatura_id_fkey FOREIGN KEY (asignatura_id) REFERENCES public.asignatura(cod_asig);
 j   ALTER TABLE ONLY public.asignatura_horario_dia DROP CONSTRAINT asignatura_horario_dia_asignatura_id_fkey;
       public               postgres    false    239    4769    217            �           2606    16709 9   asignatura_horario_dia asignatura_horario_dia_dia_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura_horario_dia
    ADD CONSTRAINT asignatura_horario_dia_dia_id_fkey FOREIGN KEY (dia_id) REFERENCES public.dias(id);
 c   ALTER TABLE ONLY public.asignatura_horario_dia DROP CONSTRAINT asignatura_horario_dia_dia_id_fkey;
       public               postgres    false    4789    235    239            �           2606    16714 =   asignatura_horario_dia asignatura_horario_dia_horario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura_horario_dia
    ADD CONSTRAINT asignatura_horario_dia_horario_id_fkey FOREIGN KEY (horario_id) REFERENCES public.horario(id);
 g   ALTER TABLE ONLY public.asignatura_horario_dia DROP CONSTRAINT asignatura_horario_dia_horario_id_fkey;
       public               postgres    false    239    4791    237            �           2606    16559 #   asistencia asistencia_cod_asig_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_cod_asig_fkey FOREIGN KEY (cod_asig) REFERENCES public.asignatura(cod_asig);
 M   ALTER TABLE ONLY public.asistencia DROP CONSTRAINT asistencia_cod_asig_fkey;
       public               postgres    false    219    4769    217            �           2606    16564 "   asistencia asistencia_cod_est_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_cod_est_fkey FOREIGN KEY (cod_est) REFERENCES public.estudiante(cod_est);
 L   ALTER TABLE ONLY public.asistencia DROP CONSTRAINT asistencia_cod_est_fkey;
       public               postgres    false    225    4779    219            �           2606    16569    asignatura cod_carr    FK CONSTRAINT     {   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT cod_carr FOREIGN KEY (cod_carr) REFERENCES public.carrera(cod_carr);
 =   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT cod_carr;
       public               postgres    false    221    217    4773            �           2606    16574    asignatura cod_sem    FK CONSTRAINT     y   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT cod_sem FOREIGN KEY (cod_sem) REFERENCES public.semestre(cod_sem);
 <   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT cod_sem;
       public               postgres    false    230    217    4785            �           2606    16744 /   documento_permiso documento_permiso_id_per_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.documento_permiso
    ADD CONSTRAINT documento_permiso_id_per_fkey FOREIGN KEY (id_per) REFERENCES public.permiso(id_per);
 Y   ALTER TABLE ONLY public.documento_permiso DROP CONSTRAINT documento_permiso_id_per_fkey;
       public               postgres    false    241    4783    228            �           2606    16579 #   estudiante estudiante_cod_carr_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_cod_carr_fkey FOREIGN KEY (cod_carr) REFERENCES public.carrera(cod_carr);
 M   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_cod_carr_fkey;
       public               postgres    false    4773    225    221            �           2606    16584 "   estudiante estudiante_cod_sem_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_cod_sem_fkey FOREIGN KEY (cod_sem) REFERENCES public.semestre(cod_sem);
 L   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_cod_sem_fkey;
       public               postgres    false    230    4785    225            �           2606    16615    jefatura fk_usuario    FK CONSTRAINT     y   ALTER TABLE ONLY public.jefatura
    ADD CONSTRAINT fk_usuario FOREIGN KEY (cod_usuario) REFERENCES public.usuarios(id);
 =   ALTER TABLE ONLY public.jefatura DROP CONSTRAINT fk_usuario;
       public               postgres    false    226    233    4787            �           2606    16726    estudiante fk_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id) ON DELETE SET NULL;
 ?   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT fk_usuario;
       public               postgres    false    225    233    4787            �           2606    16589    jefatura jefatura_cod_carr_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jefatura
    ADD CONSTRAINT jefatura_cod_carr_fkey FOREIGN KEY (cod_carr) REFERENCES public.carrera(cod_carr);
 I   ALTER TABLE ONLY public.jefatura DROP CONSTRAINT jefatura_cod_carr_fkey;
       public               postgres    false    226    221    4773            �           2606    16594    permiso permiso_cod_est_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_cod_est_fkey FOREIGN KEY (cod_est) REFERENCES public.estudiante(cod_est);
 F   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_cod_est_fkey;
       public               postgres    false    228    225    4779            �           2606    16599    permiso permiso_cod_jef_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_cod_jef_fkey FOREIGN KEY (cod_jef) REFERENCES public.jefatura(cod_jef);
 F   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_cod_jef_fkey;
       public               postgres    false    228    226    4781            ]   �  x��W�r�H<����V
�cZ�'�&��3s��6��c�U��A�&Ʀ�����՛�V��&�\7��V��U����]�u�+���Zl���f�hƠ�'�M_YݚQE%#�{��ю���\�uAm|�L���E��vc`����w��2���I|d'�2���j���õ�pªX��Ȭ���q����2����L�v�k.?�`k��m��W�∡�B��4���L?Q8���ܾr:�tu�޷*��Ju�Ը�x=�7-�%����������~Ə�V���{���w]k��1"hLoJwK��$��m�X@k�z�9�FpL�8�7g���o�����O+T��a�ң@s�Z�麏���X��(���t��sA���#�M�IO���[��dO�فƄ�����0$R��\g��y���DQ�
"V�����tN�������Ђ�"]�%���$�6�����3��_��6�-{N�m��ug{����>�4��J��t���0F���`:?�.�=�`�}����Vi$xt��-8#�n^�-y�����?F�����%I�����	L(�D�=�
;��m��J�j-����;�И�H �M3{[���I��Mkg����~�@�&��'Ꝋˍ��i������������&��Th�~,� ������;�!~4�h�F2����d:�i�#'9���Y���h6�l�d��p/�_t�8�F�7.��ځh����rGz�-���bE%�*	�)�{�ߘ9`�d���0�X��D�!�(�vp�
��k)eN5����?Q-�Dy�ڼ�w]O<c�C����Hc�M�%ϢȣB,r(����b&�$(�~�F�=��&�ԃ;� �j��wm�T�-G�'
��8}A HbH�H騭�>W�Xٺ�x���fK����MZlJ6X�'CZ������uň�F�����"@BeZL�w=y��/��ǈh��Nr�Ū��
4��N7X�(��뺭mc�`�
lNa&��x�S��kAB�T��P2)A
]o4߆���%3��8h����r3rlx6�G�	��#��@�;q�鍧��g,�BE+�=�?t�&jʅ��׉GȚ�1=|�\�b��3T��̷%�v�q˿�S��k�
��5�4;H����T���\`��°Z1��L1mu��Ѯ8n���3�@��̹����l_Ϙsy��ŐXM�q�L�eܩ����tR���@���˔GG�d[��'����zX!��
	G�ӴP�=L�V�΁Ǧ_w$������-ōv%I*3�Yڙkϰ�,ͯ�D��&���~��\@)=�����^H�R�()��S��$L��ŀL᷏��9�!{/��o�q�q� ��V$��N����J�� j�o��Z���P5:�Mx^A��=�Jt��	e�V`������';�m�������k{�/�����d���T���t�v�v���4�      s   )  x�-UK�![ۇy��|�2�?�K��iK�DL�5�Xc}6���a�����wG�k��w1�_��_1�k�.�̃�e#��.��/�qy�~�@X9�K
G�I�N�0�&b�R��"�b��fc�a�c�T�`9�d nS�S��m@D��@��l*�VS�H����QMes�e#|7�]�B.g2�\�b28��dp6���A�i���<��|��|���82���Ľ��^�݃{X��%\g2�(���w�^\ѥ�]7��8��1��u�H~�A4G��h��%���p
r����:�hm}�G��o�y�}�q%�@�lq�A�#��A$��\�&Z��N��ωpo��Za�0�UG�t���	u7�T���?渳�Q���\�NAD���֫ˌvˤ��:b�P���RlK�.�XK|��&��Y�-Z����dl����"�����5|jDL�[���%�p�}6�ßO�J�w�ڠ3����bmQ�إ�C�Yu���e�C�R�����&��1b	�r���,���0#e�]x�ƌ%4�6��`���-����0T�~	u�`1��wk��n�[�I���n�@��w�50�r��A)),�[0^RV0�9����|7�y���_X�b��ʹ��\ʓM���L��|��!�Z�<�[S��i�_���|C��xSx�Xs�
K�4��4�*L�Ҡ���3H�${�Щ� �P��p�Ij�'9(���dN����꼿gZs�.��m�� ]���N���w(c�#�������e�4����u(����������      _   8  x���ˎ1Eםi;O��`��i�^��C�����[%��9�-�I�G�W�+�˗������~�HD��k�pHiF>ݾ�݆�Mϳ�������1��#P4��$�iaC:F�!���\r|Gde�L3�!�3!�$�S�!Cʌ��O���HF��1�Ǐ��_�#�;�W�+Gj(��n��d���f}�i4"�C�!��23Q�� ��j��
n�Q�"�F�^��L�Nh�F�J0$؈�d�]ϣ�f�__��0��N�A���?���$��"a����(����FK's@��������^׺������Vh���3l'􃉷4:�I	��j�$��!"�E
FȐ��9�a�!c����\#��4.$��C���k��CЭ9$�ZC
Э5�����6닾HA:F�!���83�Ɔ 3��0;�`*Ó��8�� c}�R�(_��g���Oƌ-T�1��Љ7��1����c�g�:Ȩzv�����1� Ư�Q�Ơ�'��O!��ˋD�Lw&cF�)��A\g�yg7��� Hr@vAͯB e;�[      a   7   x�3���sw��t�tTpqU�q�u�2B�p�qu��	���tv����� �N       o   8   x�3��)�K-�2��M,*2�9}3�,J��rL8�JSˀSΰ��"��=... Ԍr      c   �  x�mUY��:��O��ƶ�}�-QC�M�ʥr�\�5LIq�އ��@��� w�M��id���:8v�ϸv��S��Oηlu$�7�V������	�\�����to����5~d�D��r����G���B���x���\�NdF�Rճ���5NSb�u&p�ͥ���hd+�$�%9�5�=8�W�#��*�t@]���v%ݴ�Z5��)�!k�v���>��:m��:�lQ(����4g����7�;0~8���2��8��K��`�wAq���iw�ֻ�-?lѝ�Ú�.pz5�Kz��^�ӂ�قy�2��4i��p*�x��c�AR�o�0��D��`k�?4X!^�t�<E̟⡐� �z^p^I�P&*��x��t�q,��?H�*��kK�@J�:;�H������	���aig��FCf_}=�Y໹r4�Eӡ�7��1ԥ��3,Ƥ�E��t���oGHz�~x0�����A`8��Ces�G��0���|H�]"�/��
�Y ��b0	��y�~AK\�#�e&�*��[_�>�8����o��-�F����\	��O�O	���9��R���&����M7�9�YV	أR	Q%CM���r�������X��^�E�z�p"���2M����A�QK�3�)l"(�7L���%�3�L����d��mYnEp�W��
&�7�}Һ%��@�A6Q���{��'��{ޞ��fq�,���jY���%�:���"�lY��\��l"E#[��G��J���BpG
:��oWF�iOXX�Eb �"�~}zU��1's��J��� �I�QI��^<�#�� d8�q��pXs\�$|z�:��v�=��������X/#������Z���P�Ug��ڗ�9����ďo�Ա��;���4l���eKlI�dj0<p�{�Q�˲��{��~ı����NS�X����󿶛��?D�      u      x������ � �      e      x�}ZKr�H]W��P
�����eyD[#�1�)� c�l� s�^΢}]l^fI��rtD�Β��y��e&/����gR�?���b����]e�I�A��Ն��yѯ.���b1�<o����ǟ.�Gx��ʔ]!��?��.�r9[�Leq,�h���K8��Δ�Vſĥ��eU�◮x����*�J��-�~��Ot����*^o{13բm�?��(�J�]�����h�#>��{SV�w1k;S�xW�]	/2���⹶Oǎb\��Qr��<]��ܙ��s���03�q+�����}�Ŵ1��Tfk:��:|�E���X�ޮ���豛�,�Ţk�6u�?fE�ӥh�DI�UG��[IǷ��e����w�C�nW��	�V�.���l��08��P��a(��c���UQ��O����9�[0�@�}h{��`:���l[S�quO����ya~
ۑ���4��j�]�7
q�*R�%��O�?nH��3~��१�q-"�t�%8P�V�#ІZ\m�R u�q�~����/zk��:�Տ�to{3/*q��op=_p�q��H�T���o~�ܐ�{e6�B���r0�CY�tfZeb��/� � ���^|6�O�Vx�4Q2MS�&�)`���}_6�=����,�3��b��N�i�� |7�Y�e�,��g�6M)T$Z�r�p	c+�0C�s� gE�h�DUii�c����+��̟�T����Q���#��8a�1��1o۵�vu��%��+p^�@�3)zS�6�ʊ�|�G��U!�>�]�uW��xm�0�`@��ƫ'�=F�"T0y�����w����\�h/�[x����o���:�V��.�n���=�DJ�5߭�ljlE�~4ͺ4�v�/:���T�������C[���n��@��)Y��`7���OR��P>��YM^��,��a�������c�F�^�V���������u��F�C�B����4�@�Ü�ƈ?���Ŝ2��o���̻[t�掝�2Ҁ��׷9���?ƾY�����D�śFa�!�P���#"�[��N���f�>��P�h� g���D��%"���e�V����i�n���=���T�w'��o|�C rľ~����.�l|x\��0K3Q�,,�߄�h[������[K�XaC �5W��G�}�MɊ��l��.>e2�����ӹ�!���%Ҝu�߾i�-g�$�$
E^��7G�c?���6{�e�t�(��Xo4FxD��i�HؒA�)
�8����ғ�1�SUn��_ 2M׵����PG�
E��/-�؎-�Y']"����8�,
C����uL�����%������	I�'�ʇ��L��q����q�=�b��Z�E���YC9���l�PI�8J D�������	�VM�CI��c$N!d ��ؕڇԘ�z��gD�φČ��$T���l��bt�0zo������V:D$�V5[�sǄ����>�g�6�hQ14T�y���,I������fq�(z'ڇ#�=�H�J�����Y8��d�b����Z�v���pD�3�ﴊTZ*Ba���a�m��7��񦩬��ڗ�=��4n�ء\�5{� �T���K��E�#�@ܠD�v�BeI�|��c�9`�tI�jZ�7�����IՆ��s���-$G>�w(cM�ט��ͮ�R*H54QU���H3��qYҡ�@V[Q�e$5��"w��1B崂�h�N���� 8��b��>��fK(�y[xDGI�ƈxyە�QM����MI���q���P��%�� �ҽB�27W&D(@�(r��é�J��\ܐ�D�GУ联'y�@�����WjX5�� q���BB
���������~�CC��e�}z����R⹷�/�k,�#q�n�S�d��4�ќ�>�j��kQ�^���>�'�0�"�B��BcZ�j�W��X�uy���V���R��&�~lͳx(V�IP��-��Fi"���}��؝"s�dՎ�4I�4���-n|�>%�^��q�H�]a3K=/E��X�DKk��6u	�D3|��QJ*�B
�zKgc���[��>5�(=��!ȥ0N˵?��k���S��AɖB%Đ	e����X)�Y������ Jp�x�]�a=�aU&�sB`��v���~$�QXk�vqR���H;G[WZ�H�B�.c�:C������M��}���-�<� �@��F*���� ��=5��]ij�0b�%&
;MYI���b)q�5t2�Y�6�H��6j�a#k@��'�R'���O�n�|/hpoQ 5Ԕ���$=T����'���f�֑��t��|vK>vImW���� �5����,T�a&�͖�>�I��.&��8�,``$��	�)c�'�R.�YvO>�������D�C�?!^UJ-����vۤ�MD�l���1�^�e ��)�wK>��Xő���D����e������R�>�%o]�q��-���
\u�D5n�ne�]�1P�-#�ɗ2Gd��Q[�_�@���rm����]E9�Lth��Rq��H��YE�[�=#�SE8�2�e`�;�v2��b��O�e��]�9gt_5k�LKx���d��W�dc�7�VOm�S�	�;��G�)"�����0#�����ۄ�;�*+
�rC�(
�,��~m�����Y}M>{z4C^,��4Juy<���!��)f�aeH�$7tR�2Cr|�������I�L.���Ԕ ��S��!�t$����/�J�"�6DYЖ _40
��ԧ��Ƞd ^�Ӓ�$�ɣ��h�5q�Z>^���T�hz�z�$DLN�a����e+�K��xAe.
�F�%�[J'��.)��W# �QZ("6�w�Kε��^�Gz���A1�)
܀��كiəֶ;,�Q�)�Cޑf�L$Z�LuKί�G1���)�������E��pF!�V����]�¥(�n��_��\�P� ����b`�v�ȭ���b6�{e2�~�b^[�Ē@̕��Gwk�� �����vQ�}���<Y��v�qʝvya�	�k��~(ܚ��%�VQ�O.��B\��p�YQ�� O�D�:����<]E)�{h�ӽ����B�m�>��*�5��G�>L��ƨ���DՓ�C�RZAR!
::�?�hJ�S��Au
y��ܥG�H����������Ui�4�BtS�&�4�+��b�rL��f>����}Dx����u�ei=�B2��������}i9�O���}��<l}���1�N�U._����T2DF�*���>���̜������e�E�xx��X�`��byL�#)"Cn��X�+���Y��QP�)������1�ykC9qX��M�?k�P�%�t�M�V|<���ݽ�}(IX�ޤQB<����@�HCk^���ǲ�8��2�Ǽ��!���٩ �ȳ���W|���,= ���ۿʺ��@���vK>���]e���H�m��e.c-SKf��;N��$�gj���~�`�h�Y����W9�\uC_����|*J+ D��$��������UW_���M�rQ�̊�5��^�D�;��<c��g&��5�֮��Vѓ��ȗl����Z)�v_������IZǢ���C'X]iq��嚷���O�<�!Z��
u(�.�Щ�V����F7	���@I!o	Q�b��<[},+z:��N�ZY1�})��,U���|��!�'�C�.0�Ne��v��y���<b���
�U� L�L���
ЖO$K���rʏ���HPV�6��0�P��%�����)@!�Ә��9�3<@�ۘܢ��n@���*8�J�PCV�F��������L���y�l�d6,�i_�9������u��<ip#�����Dd&#�����'-�������}���wMᐢ6�����|����p��b�`��T�%5[O�7�E���q�)x���O�/4��|��Q(��x��K���B�'�   q��FĨ�ǩ���:��Wj2ޏ��XXޛ5
�ҡ��(�232+�,�~�#`G�{���{\��<�;���7�� �m�v���j��s�/�i�r��>�*�0骊ُ9D��� �n��љ����-�NE����Ǵ!u�ؾ�H)�MIh0�Z*̆�Ǥ!u�p����C����2��J� �
�@�c�@:/��X�R���t@ l����(IU&�'��v鼸/�9�o�oD5�� ��'�!��BJN_�G����vcH�~-����#I_��]���> +�+⏗�X���_@t��[�����\��|������qX�*�!�S>��Ci�)<x:|��T�Q�<��,��i�I<>Δ��2�I�R(Ϫ������q	�(p�"_]�k�)>x:|���:��S�+�ypm=%O���DXG��������rq� �w�>}����|�0�x{�Iз��ų�~�֫�y�}}w}���������A��%
�n���D6�Ϸ?�2�(n�����~��LaO/<a�����~���6�.�      q      x�3�4,�2�4*�2�4.������ %�^      f   c   x�3���I�K�W�,�ML�QN�K�H�R���+I�)����Sp����4�443�2��*M�S��/NU�M,*,��KT�O)�L/M�B�6�6����� 0�      h      x��˒$9�];.~�E�~�pN9�qO�rr��9
����xddD�euVvoutex���
խ[4�ߜq�o���������_�m�������������?�����o���v1�Br�[��7�E>�m,c���x�L�ɥ����c�5�y��&ٔS�{�uv)��߳�w�L��~�i��^��Խ�"L�RM68�+�����/��#�s>�꽟�ϸ��pzR�y���q�g�"��j�iSxi�_~���hד��9w�̽��Bk���=��M<��/z�h�����|�4����p���̬�tBJ\����}�~���_�}-ψGJ��o�3�Y?�u��ǫx�D#c�i�QK�|��.԰��]�;�x�F��귓�!j���s������Q=�{���oi��P+��_�ߟ>%>S��d���{����M꧴	��I�O�(H i��׽oҨd}�D�?V�H�����_��mZ�*,��y���w�����Ky��T�E��TZ@c�yK濩��>i���s�w������
����/F������M�5�W�cto�,K�����w}����T|��;˞��+�P$<?��7�u�iǅ�V�wР܋�*��߃��:DrZ�ݽ9�g���'�z}��xܓ�W8
*�wPѼ�!{���%Vm~�?>��������=p_��*���걜�� }w�)�\m�����ؽ.�ı��7���c6:�S���6�
W�����c�T��z�՞�}�Jc�s4͹�b<堘���[�h��{N����O���}RV=��~������^�����SK�W8�~�q_���v�W�������}����w��X3ߜ�T��28��#F�{���8����q���#��x���#���k�B��-�8
���o{�5����G������w��Aw}�gt�u�ϟu~��B���sHQ��m��Q��E�x��=��X���@w��gG����B���@���ώF�k�^����H:��(>l�>���]��/�??�|��	�b�=���G��1B�P'�(I����#~�ρ�O�@����G����B��@�3N~4�#�
���h��f�?ǟ��xeI|���&s���%���\O5���؟�P�V��37�s��y?W#��������YY8�|�.<�w>/�s�D����=w�<���m����vh�B�Y)�+�^˝}�o��t5��$CzW�K�X�_b�|"-��<�=wS�9i]��e�� �~�VZ���(�6�	%R�D���*2q�^/�c��'�����%�����{�GhR�d�~�<��6On��d���?I�?�k�������`�_���%�l �?�~ c|o������16�3��_mL�&�{��}�̏�jT�x�����o%���*>�{gå�1������)�{��w}ĕ�=��f�S�*/.�y��˿yOw*o�ӽ����,����}�nq�Ń?�[ϻ�ͻ�=�����׼��~�G��۾]w�_�ﺳ}��k,�r��FտH���}���_#�<��q%��F�����!�^��,ĉUO.�kikA�����c�暃3g�0��W��x���������?����^�8ܛ2a�[��S���}<�+�����q���}�����.P�z<����g�@�X�$�Μ�d�9�w�{ܕ��Ԅ��\R��;�ɛ딹�.��ug�����������[�i�8߸.?Y�'ם�	7������~~?���]}r�?�ǟ_���;�K��|z]�5��>ͪ��>�N��n\w��o\��_]w�-c��)xF
�LnB����.���kv�t��7���w�p�@�v�y' d�8�y�|VD���m�UFPH��u�@d|o����^����#��I�ٸ�S �~�o�Zc���o��w��ͤ�����Kz��h㛽��c��������4����_o����4��~��.��2����Y}P%�:w����jH_9a���,ٟ�j�ӻ�
���nQ�<��Ӳ˙=�������j�;.�l\��d>o��Oj��!z;U?��^���\���w/S�G)_���T&N^}�t��_m:}5B_o9}��A�����=���ZF
LD*a �:C&��kc٫;���]�������/��K��%a}CW/���6��?m�}"t�Nwd�UmW����2�?���Oke�y���'��>�3Y�:���t�Io�]^�̫�<��XC��"z�	�$�q�����{�Y���l_,b��Rǈ��^��������{���h%�1��s�]�讖Z݊1����U~2��\������|�ŵ��{�dg�������Z�PO��\յ�Q�1���v�}��M�݇��cq�-w�;�a*>�kSn4�o��Zz�e��Gu~fh3ڼ�˗9��{�k2�R�w�8�Ⓓ�ڈ�o���� �u�/��:����4��Q� {�jG�Am\���}D��ʞ����L�i]�]��yw}/�a/[h�Z� �[*c��V�����Z�	n���ZZwe��C@��e���7�^*=oq�5�����K��V�{Yuǉ۳�����mu�I�4V�u9��T�J
3��簩Q+ܘ㎦{Ko�y���B5y��C*՜��ϙ{c��F��X�u�f�VיjV\��*�7Wl+�{�Ƹ�.a�s�#�@�+B��ZjCh��~���Q��m�� ��~�����m-ϵJ�� �m���3�D������a&%�Z��H­�����k3ڮ������+W
�ќm��6������f�Y�jͦ8wO%����̡�U2a;���@Wݾg��54u��4�u�d�`��R�J7��- k���
vVω���Tcl�� >"1�N%�+gU���0�\;�-}�"�r��{��-췶����Y�� �F���hd�6��fWC���2u$�S���]���1#����1��֢�%g�`j�F��68;1ȉ���Pc��5!�6SP�;�i�`q�GJݸ��`8;8	*ocE�\trIw�A3|u�$4�c!��m�4zk˜��V��
�c���D��SSG�4�#�h3�\@n:�k���Q0�f�u.�'�z�g�kxD��E=�M�Mc�J�8��� Z��P_��;���F)����,,v.Q*b}:�svg0Gh� �@[:2)�[�i}����e��j�˖�Z� co;�rG��pޮ��A�%�}�c�/�l�
��}Y2��`�`5'�/y[�����,�ܜ������ �ƄL�m�8�e�n ˚��U��W_n�j��nz�f�$��6��]t'dҌ�@E0JN�����/�\g��飌2��ҊR/v��	I�5`��o���z]�Uc, ��TXD^.̶ؚmj�	�4�2��+�Si�,�0B�mfXxk�#�q�UP���\>0P�꽠]����B�F��N#�V���0S�
���������G���������y������ɺ�'�����xd�3C��J�|��&�5"L�A Ws�h���c|Y\0��_l��xj�.�hF�w�0Nĉ M	 .�a��gH�x.:�E-�z|�:�#X��PS�=���E�2��d0t�0��u�a	`�	����Y�*E�?��K�ص�A @k�v�;�i��t�Շ��.By1eZW^��jŴ�0`f��9�0y/����/iH�M��'�
Y�X�	��+�)�	��1ĻXS�G�	kS8�EZ�k!��ܘ��]�=� �M5�y�]*���(���v���>k�)׆*�g��#6� ��w+ȇ`�(Oh��d(����� �$(ֈw��P@�����u���s�C'�W% �J�k�8��x@(�G����
ؠ�����X����"`I�R�`"�J\�'��I�|xgT��&}�/�:�K����5�"�Z��|l)�a��A�G1����):�����q�\W���(@D9��5�/�GtE��R/�(`�.�M�{Him�O��V �G��yiX��J�@x��ފw@E�IE'�	��6�    ��x�I���|��0��%F�A�Utj ��^&��DF��GK�1�%�*�
����$xN�&E��`�	�6Î|;pc��퀈���jy�^u0�=W~����0��d� ��Mī����	�a�`�r�_N~�t����Vǃp��d����q?�$�$�U0>h�pg�<����¿�|��a`����&H�΋�򚏆i�qo8TV��5�� � ��k�N�[`�a���P%�+�\b�K�UD�@=b�ڠO���#m�9��Ee���+F�h�j`�#�7Р|��f��&�AI�?����QZ<��|1��Z<Ѥ]�/��q&c�ܹQ�ȕ��)���"\_򢂰�t� t"Kb������!��
eŽBˉX��&rڍx� �}����=BV�塐 1:��ӈg�)��q�h�-�k������"�4����Z�_U��Ϛf�̥��;~t�̓n
ЮP�"x(�"�>d�U�' 6`p�g�L��	w݅̂������Z�x&�97%0(���x�p��u�/�c�2=�0�7�^A�hM�<
�=DJx4�X�����tV��y������EW�]ǣb��p����H.��4D��@E1Ӛ��1Rp!��F� �@���_����Ȃ�`�ɕ��'� �-)Hk�P<6��Y�� �����|�N1('zߡ,��V�5X
9��"g	�`)XZ�9�fFKH0D���y�3DhY��A��╸qʚp0#�`�X�W��8W�<5)
����yM\��� Q\ 潁+����D�i�G������b����!�H"�M�\ �	���].��˂'l!B�@������$/�7Q
h(cD�ρ1(kr(��Q�0pP���UW�;$1_1���N^��P�>�".�a��!�7KUHb2*�� �ț��ꠌ��[�+Z�f@�a:C�E���4����fW�Ȱ���V(��}�5a�!j�J:�`+�{ <����)��� �"��f@0x\�*7������t�R�
:s7DG7Đq�xzb	�#N6J�+�sB�����N��Q�[ �����:fu� �3���j�\Nx��z�| b�ilu?	D�́#q�D(Y�-7��:H�x`|X���Ƌ.�hB�V���A�h�X6>I\�Ӏ{Ba	s��bC���@"�ځ���+3 �S��(�a�QbK��� (5^�-��dI�QaႣ�~A��D��3a�!��i�s�[�ݭ:�k1��g�=��I@Y�Pl�	�l�p��ȉ��k�G�L%;�Q*�n6�B�L�i��zO@��F �>d��U�����Bn wQ^8�K�zՏ��bu��1���*k��(Ah�	z=*��R����`�.y|�H�`4Ř(?�o��9а~TT��=�BG8
X/K���;m���$گi�AY��z8�e�JZ�ZH��;����$�����q����F��f�"����ji�/���EC�;V���_;��D���YK��D�>�CՌ~�Y������'|`l����^����X5[?[OyN{y��sf����ڥ�\������W�`\�}I�$�R��I��$�륍g]A{R �Y~c�/�q>NA�0�)�L�W�Wɼ�l�,ݕ�m~��Y��$wV5����W����Y��R�iV��>��]����=O�_[��ϵ�iN��K;�T�xQ�i�gI�+e�>�-��8%=��O_�3�%r%	}���x�5��x6G��"�'ʾ��J��e���(����׵�,�W�7�\̟��W���H����=c�7�F	i�GO*?�I�o?��a��À`Ob8m����U��wZ�y�{����?�⿒�?c��@���|`����[w��u'�u��o�;|h�׳_�uY���}z�M�~�	���?:��~�9�+e|��o���s9����o�t%t�&��5��܈�f��9�ry���o��OУ�NX9��=� !!Qռq˛`������V$��pp��=6�N�P�o��KI���$t�Ԋk��蔖O�̹lT��(���Ji���y���hW�J4p�#!�^�h"���u����]un��Z9��x������ʛ;U�y�<� �7:�=�u�ȇ�Xkr����^cS��[9i���J�A� A�x���i�5��V�$�>�>�$`Z�N���(څ�!܄2�A�#Q֘ƭ��L)��)�2+�M<1�#/��?���]ʋ%*i���Ĉ����sޚ��k��0X31� {M@�����[q�#��!��F�2����<�d�M�V��Q�b��!�Rò2W*n�</�G��B<rs�+OѺs��2�D� 7�R����U��%bcٱ��)rqV�%-��Q G����NI�Ekq`D<��;7	]�<�����@XJ�	f%?����0Z!��E���0���5�0�Usb-U�aNK}u:%�`B^N��o�D�L����
�J�1Q��z5D\ ��ō��!�p���.��M��J:�����|���UQ9{lJ���Sz�D�-)ǶNƨV}k��)vt�hF��^�5ٲ��,𡴅g5��5�п���Z375;��5�S�A��Yi�#�m�mk.��t�Fmr#���ɟ��n����{���	K������@d�\a�Lyn�#"� �4.3�&��
QyED�q)�'�O���j��MAq-w!�%u)��q+7�`�Z&��:����.[h!5�H%eh-��`i�b7�S�������9KO˗���s�1x�{	��(BG^�ޜx�h�gD�h��cY��잻���RB��UD�c��;�f�0��f0� ڦ!�n�F��=t;�´�T�axb��� �6�BK�d#�2X��Z� ��=�Ө�(W�֊�noWCI�lU��kz�*B	��ķP��#�5�����%��4��l�aX�K�V�lag5��t����'���[�&%�:��4g��i�x�¥�i�f�5����x-�j;O�*�0:�D��ɪe��hc�i^�5dے�V�fh�(-xn͕զ�k��u�����ς�8�`��S[��θ��es��vêM�AI�]��-�Z�"���N��M�:Xh�A�T���09kJ7�*]ů@�x���:�F��Q�~`�����ME`�A.�ژߟɯ����TJcyS�2A� 5�@�83�r��*�)���#:��u���B$��KS��w���@r�:%w�Z���Dm��Z�ތJ��s@��
\B�M�u a(�����tf�h�Jɠ�(楹e�Z�v00i]�P�ݵ�ߵ�ԃIJ�I�x��1��a��x�-�r��h��� t7	�� ����Yk�K�e�iu�~��G{M��w�+q�1{��
�40F����$taĄ�9#L*S�c����u-�X֎�oʛ)Z}(���K��ë����j}�V�(��/h�;�J�]����Y\��
9�C��8�ɋ|I�ʗ��Ԉ�<m#T�Q�+V�k#����84S��1�B�F�6�SWJeZjc��B[�00"epP��A�b�\�H�)=�Y���Y�'��|�^���؋�5�-F����P��p��q`�|�X&�NZ�c}��	/��xǊ,�@b�Mұ0��/�Z�pNOW����>�"�̠,,+�%�B��!�u�����g\x�s�d��V��%< {R�tl:��u� ���X�0 ��Pqzһ��9ôy"�+�'7kz�"^�� �N��^^��2�+20��ŢD�[�Q�hTG����`�x8%�4�2�}� �5�]yQ%�B��ǁg���Ժג�X�e�ƫ@Ϙ< ����j�g�Z!]�J%b�����x�S)i EC �Z�AX+`IL�S������,�M��('�H��d�Ji|�X=��F�L�.��R�����D �i��Z��&��J�@㵤,���"�T�F��i�k�ߪ��21���;A54#E=/g���A�3˱���Lh.tj���Ϳ=z�%δ�ėʙ    9*�|���ٳ-�?�=v����x�Ft@E���Y;m���o�N��u�X�A���u]��CGL�5cc��O�rk�+5e�-j�l���fc��T�����͡X�?�-sc_�����k7̙w{��<3x���1�PN�o�1(�OsUs�.�ˡ$:\=v|-��T���5J�\�{k��L���d6��Z:���4EO�8�H�ǈ��wB0@�	x�TU �T��P�I�bB#����AS��R���4��*ɾ���d�Q.w:�g�
�����[_����C�`�C�� (Ă˒�	���ɺ�W�"	�)+p�ɦ�ڋE���"�á�R�f�k���<��ӅYek*�BK��c`�+]��
�a���c�V���0C�� ���
��1
����Ǫb���1�4��E�M��*f���04�P?���gP\m*�N!�M֌�qJ��@] �$6�?L5��>t	���K��Y�Z+��v`-��$��� �-f4����O�YJ�',Q��e��?�d�*��m�����{�H�� �;�y���7�3N`*�Y�|FMV�7�#��9i[�&0g�s��cD�PXm^�]I�8��BM��gp��*VG\�"�`����P���נ%����a�&���u~)'���2E	s�փ����8�r�Cj���L��\�t��������?�R��G�\�����P%�kpEX\�k�H�p��ş��eLC"�o�R�ja���u�����!;�b[(��"���Y�B�sy��Ck���J@���:<8b<|
7hK�X�*�HRq���%�;�����P~VM7�-&�d����]��%����v{?��n)�I�� "1¦M��ke%����pÆ.+��3p��WSuڃ`��R�܈��j�R&��x��,D��X��^���&�2䵂���b��s|�744��C��W��IgD'�v �J� �`�4��3�u��[k�n��WP%���Dlc�J|&�Mke��p��,�I��@��d`�x���	Dt2�X���`oP0h(&���pMTU��MP���-��b]\@ˁ[�&c��M $�$��A)�J8!V�������=W��$��g�c"6Z=`�{i&&�Y����и�q����t"bQ8�v�  xAt�1X�g*�ض�e&�ѿ�O,��4�L#��:q��92}����һ�r�y7v�[[���k+���C�״Y��O��4ۨ�i�H��(Ś��C*����HL@VD�x|@&�	��Ҡ>?HS�}Dr���XQ=#Yi#	��]�o4HK:���^\�O󸭜�Jt�{���,0	/	�18��b
¸���G���x2�&��4�������s_*����X����R��`V��_�[�0�b��B�?�gJ_qD��P=�d���dA�+/o2��mYSS�؅�re-��RF=.9h��DM�b��H'�:a�s�AW ���>7�j���.dM�G�S��A���M��s�U��k�J�J� �����b������L�Z���in��T�F����S�~E�E�^�F���6P�����fj�{eܲ�ƕF+]��hj��h�i�M�2�Pk@��=2���D�"M{�B�:�DS  ��i?y���jB2,P��M6������)F��FV��fe<�o��p���	z�I!�A9H�ON��S�+1�b���8R��&�gRn=�<�6���v��(0~\`�QiT��V{%R�38�_����	��ݙQ����4/�C�9�pd�t���|�y�Ԍvױ΅�1��N�	+���=[㔺�&uZ�5���_ƌ2��Y�h�X�ղ���$ծ���I[vg'��՞�!�Y4ЪN#T�B���VІH����9?�k�Y4N�_���3۬g�Mlڜ
�h��a�-��g߃�k'-'5;��魒�,&��)ژ�W�CT5E�p�}�Y1�%���I���Z�>�74ך�v�A�|�7�7 �&�l�Oh��©� a
�9�[9��'�&z��wUV~S���R��t��Zqx�j��O��@��h��(7��B�7P�c��:'yi����Y�*{���,����a�ծ8dȩ���m��mXP�ܷ�}�yg�^+��k
T�Z��x"��[tx�N�w�w4�P����e� ��,�-���`����%���AU)�ďI���r�ڀL K�X5��)�;u��;�8�G�Z�:*ҟ܄ǫ��QE.]�K^�@W�{e(��O��(���A��R�iO��E��'}���ß�~��埦{��������I?�I��ܺ?�I����'Yo~����ymȳ~&阮��Jz���%�t<�OyV�������}�c��D�t�������|��rO�����:���>O�����=�o���_�N.�Kv�����A�~��o��ȤW�?�~�ky�����{o���^O�|z���o�g޴�m����,>������������?��V>o����E6_��z����}�W�w�-�]�}�ƕ�0�k�#�!�}�X����������g~�ǣ��Wk��_G�~����,"ke�{�Z�5L!y:{;�V��eJ3���u �����Q(�*cA��U-,m��I:i.:v��l�B�[�J��8���P��>��O%������է/w�NW}㔱T��S���uD�5!%ߢ����I�gzZA!߸���n�{��9��S
�^��r���������7u}�e��K�8��s�b]G��M������{��^$�8S�����s����-2��YsW����O���4�ؔ�����J�i���9�~��?V6I�v=����/����WG.��<� �$d_$t����G{��I��������A~�ky\W�~��nW�{�ϕ�e[ߥkڗe�4�t��S�2�%��[��;5��������s9=e�ԫ�^'�k�4�����S_�����-��Þ��=�%��o���Nh��[�8�T�v���&uB�'������]��bʬ׬����yu��#�(�,�U�A��Nʢ�A(/���sߴ���K��ݑ?�m�>���k��o���'���_=��~��ɯ��WO~���z����Փ_�篞�z?������'����M=�b���a?f ��E�����u���|��מ��a�E8����h��,�N=�%�T��5�>����sE@5��������YUъ�Y�N�y]��{���y)��_�B�>�p�a����l��}]Z���5w������x���{��i�3}kǘ�Ӈ���ڢ�fVm�P�m�IڗT�*48�Wё,1Z%���o�\�#.G(U�K*oz�eZv{m�m��(��V�G�$����{n��!�������k����,�tR��JR��hwȬ�[�V)�t�q9Y��B�����EUP|w�t�O�1�ʮEqt"�·����}�Y�Mm�6��i������r2�6�=g�7���͌e�0����!������5���)A�<!�^칎�����RQSm�k�^��9[��ǝ��mHr�����:a^j_�)���Rѝ&�ʙ$=�$^bR�vj_��k찡�=�]Q�rg�N�(���GStl2��sT-��Y-�-�����C�)�yι�m		�Ȑ9m8����Vm�Ӗ�5�v�����k�RӉ��Z�k����B���d�E�茊ݠh*f�#O�0��}D:}Vg����0�����K�E4�Q6�}��m�s��T���t�N+��;v�>����"�r�����E!������;�٧�O�s眷ϯ��|]h���)�����)�hn\�c��*���u�)K����ׅ%��.����
F�sݻ2߹.=Ι��u�`��r�F8�ԗ�zu�r�z뺫�������������٥�!�r>�\����ws<����7��ߐs9�wp�<r��<��x����oڇ�!g�7��S�(���s���7�#ܴ�ps<���7�#��pk<�S���n�G�9��xě�oȹ���o]��7��xě    xo�U�!�sr�->t2Ro>��x����n�G��?�{��?�߽�H���}���o�Yg?2�?�o�9��x���o�G�9�����s?�K�9�}���Qn�G�!����F�G�9�}���Qoȹ���{<���zs<�M��7��ސ��7�'֛�Qo����u�;�����9���uw��=��3��~w�C�ݱ]wg<tݽ�7������w?���9��i����ތ�������;~�ތ�����ތ�����ފ����[|�>���y���ۛ�wW������ǝ8���}܋������O�ᚿ9w���{�q/>���n��go�ս��ތ�����ތ����\�M7��^|n���\�ݳ���e��������ٖ��K����U�ͧvt]�n��n\;P��浾��Zj�󯚾^��R=��c�g�Ey�糯V{���$�8w5�l�9���?N:}�i��:������o�Zc���o����w��_�o<>��ڿ��ۿ��?�뿭�����_����X�����?~������?����F�������K���8���>E���N��Em��l�]y9����3��a|=�/�%�\�O
�H�x��<_�F���Ӽ�
z
)! �����J�l��Jm���Wϥ�>>��39���) �_
&mU3���I�xQj�4]���Y����*���kz���R���5�CV~OJ�;S��<Fy��CW�Rnh�J{ƽJnu����۹ʮatw�]Q՝Z�I�:���c�ޭl�:ᮌ��s�i��yn3T1����r5����8��kSe��Q�j;[�Uȹ�:��)��3�-w�:����-צ�hv�Z�����{��Ζ���]u�q�c�lKر�!c.e�v�#.�'��ڈ�1hE�{l��ʋ����C��6�Sѣ�4��Q�W���#�|���3V�י�*O�����L�i]U�q�|��ݴk<��l�%jqg��n��5G[e6�n�k�:�̬<�½�~�*_���T	�y��_*=o:�m�iU�B�T�}/K'�� u��PV\Ba�ա�S��W�:�N��U�{cf;�
�tUn��ςqGӽ�7v��x�Pͥ��T�9c��3�<T�7��6�
�, Ѩ4��*�`V\��*�7���/�����N��0�y�\ݯ�:WTY"e�l��T�_i�4¡z� ��~�����m-O�/���:�w�:.�0S�;W�㑭���R��*J��Dz;����4�{�4�4v��\�FSg�u�d���>5��Wk*!�{*q���f�r�0a뜁����}�:@wo��<T5�e�2Y>t�U`���th�Wʐ����*�խ�)�*g >"1]�kJFWN�W�;�c��C�-*��E�g�SŽ
�/Fg��yV��3:^t���HՒ�9�[�U��2:�r�Nm���;fTY.5X�-[k�͒3O0�o#�@����)�:3K��	��h���yN����;�܍�V%=�NN��ۨ
.:���;Ġ�:b�Js��jO�m��(B[�t�����n:�U�:�#[��C.��PY{�
J:� ���]:��`T�E��T[���y���a���ɩå� #�y���gU�wb���S�=�&k���(�W�;l�]�y����N��F���X�aZA��@�hp��3#��ۙ�LA��v�7�N�����^�mK��v5��GU{��-+\4���|��H�V	�s��Q�Tʥ����Yʫ�����0�m� _\�� jL�4��Y[�7���Q�9��j���ܚ�$~�|��t"�ķ �*����	A�ތQ�AUNXCh����LƇ�A��r4�<�P�ZCҩ�F_��I���k�6UX���u�Wͪ<���H#��\^g��lS�N����>]�Z'�u���P�r�I�����F02G]��~O���M�i������b��^�h�zU���1�XOM�� �"ytU|o��o�I��z¼��r`�:j]@di/���[�sA ��uk3ew*#�V��DQ%�?������N��
�7|Y\Q�Z�W��ik�.�q�gv�0Nĉ M	 .�a��gH�x.:�u8�Z��xT��U�á�j���٧z#����:G�]VU�J��w:��>\������b��	�P-�iC�����9S9!���U��O*y�tb�ND�Q��6l�l#��5gS	�T�\W_}��"�*��ųJ*^�LP�o�k��FG�f��n
��� ����k���Ubͽt2�2Mr��&����]*���(�N
Q%�x��6�\��!����`w=���Ԇ&�q�+Oh��d(����� �$��tx5tL��0� ��Ie=i=7:g[xU��Q��Rɉ�uu ���7<>3�\ԹժF��G����"`IU��,:�:�~�*ǡXUF@U�m�'�2`Yi�lA?�����!�S�0U�[�nch�⡣t����@tܢcxD�C`�b�2̭D"����}a�=�+�l�iSU���Q��ĸ'����\m���d]q�*'�(��"d�D�aͽ�*W	'!�' ��R	t�,���N�'V5Α�1u��(1
N'��.݂�����d{
eZ�Ɏ�KU��*)�����Q�]C\Qej0����!�|;p��p�:u�=\-����GEU0t�
�>��:�ThN�1��1(����*���:N� 󗓇_�\zb���:��'5]�����`�w��
Ƨc���7E,(y��o8�U��/:�0�a�QG����iy,T]�̀�PY�BT\���� C�T������g���C�@�S?�(�1�.�2T����h3U�Š	+�Ec�����Ee���+F�ԡ���Tt��T�K�:�TEP�?����QZ<��|1��Z<Ѥ]�/���j�ι���}���Y��t�y���A^T6���sd�� 5x���C3ʊ{���(AM��*�����/�J��tV�C!Abt
8��1:	R0	>�P�*[��P�~
�u��9b�ֲ{m����W-�3$�4͈=�K��w��6���]�zD�P E��}Ȍ�ֿT%.T�6	�L��	w�u��	=�N��P��Lf!rnJ`Pk�j�U���h^4إ
F������{��@k��Qړ R£Ģ3Ȋ΅��%�U�R�*USU�y�@��Q1B|�� Ӂ�Xu������=[D��D̴fY�1Rp!��F� �@�U]�h/
�ڑȂ��2d�+_3pϭ��Na"�fY(���,�w���}O����p��ʢ�('����`R ,KK�2g��h5_�:��F�=�����&���*�ɍSք��(��2��G�A�B�e�IQ�J)��ƙ��+�A�����i����IQGҨ^�1b�[G�CS�<�
��:u��,6�rPF�Gp��w� "ܮ�=�-Dh��;�V�9�4��'�d�m�#��-���P8U�S9�7>���UW�;��N����v���2X����H&�X!p��R����92*�˛��ꠌ��[�+Z�f��2.�R��0M�����$2�N[��h0�'3���骇@_�3�EKW���vn
�10��yTo���9�jO�!y*p���Ą�I��ᰴ-RI'�-�	�#N6J�+�sڐC�����N��&�@r�E)��u����f��u�}'ǣ�tBQPU�7�[�O4As�D5JVb��uX]P�ʚ�����@T�hB㯊g�_yJO���H�z�Z@"��m`4 ��t����$ 橀�
��d0�@�1T0��-���A���/:�\�/����`�S�$8�"�L��D��i�s�v�,�E���S�^b�u�&eiC����Z�&O�qg׼	���R]�
�t�Id�O[���D	oR�CfT���Kn�(���<!7�GG��ʛZ���O�D�:B����
��*�T)��(,M�B��䪏��d�<>��J:aI�b��L6|�̠���TUߊ�ق��_��v�N�Uz}��^�Y񜿈E����'v&�,\IP)?z����;B9⃄t��w�Zt�:`$�k    ,�_0K������\4ļc5̩�_:U��I�|�x��;A4��O�P5�p�F0��l*e=�'|`l����^��?ݞ?]�z���sL�c�յ:�m^��A��j����#������ޞ509 U�S��u�kM�:�����(����O���(3�4/kZ�U�EUњ�����U�7�_<_O���U2�>[%�`���r}��/�>K���Ϊ�?��>V,A�pV%����W�������T�X�y�>��;�j��'�9	9���;�HJ0ս4�,)w6���iݲ|�;kOᥗ|����$ ��/����Fc�G���rV�tgL�^�н�~ћx��?��lE{No�7�\�t��׫���p
}��(�1��X����z���O������=��N�� {�Ok��m���w�=|j����q������ց��u��;�4���;|ú��?̺��_Yw�к�g����k������aٌ������E�̯�a�1^ڏr`~g�fd�V�AW�@�n��T�͍�qjf�0�s)��j�m ��&��=�脕SY �b���DU��-o�y�w���}��J�pp��;ll:�WK�ķ�օ��83	��k�k���ԫ!s.�%>�kRZ>|#F��f'Z�U�*qL
��y�d4������NL\�۶�]+���S��Xys��5�G$�F'�g�N�؄�t�Hr����^cS����C�D��B�r:@��"�"�!b�y���	����:	�ְ�� iy$�v!n�jM6�~$�*��t�)�38Sf%Z��g"&Ր��GLW�ٵ�Ky�D%t�QP�v�[S�!z��y�2�q`ϡ	h�����o�t�4�#�S�H]���v&�}��nj���(���R��	�}Kug�f�U80�m!�HV�cX�֝k/��'��U�vh���j��DLb,;��<E@.�j���:��:��BWt��)	}�h-�����~+�k�G�A������A	U|U�#��k�2��]oa��l��F���jN��j>�i��N�dL��I��������R"��G2�r&꜐^�*iq#nc�
7��A�]U��5M4l:+�4F����M�Dm]��r�ت����0�T��[R�m�lb�0��h��Q4�CR�6A`���]K��g6��`�EU���կa��մ�N���(�N,��dM]�B�ڬ4���6���5E�^:F��6�����ϭ:�E_�y��=��Є�łQ���m 2k�0j�<#���X0и���_K�f7����U�8�)ؖ�B�V��!(��.���.�6� ���rJ�k�\|*�ï}��e-�J+������&'�؍�C���fǀ�`|��gi��q[<vn8�q/A�C��ۛ���-�J"b�DSD�"0��g��5]��"t�"���Ii��w��j��,�hU��J������va�c*��0<1�HC� U_���X�*���2X���S�7C�'8`5��J9"�Z����j(���
-�ް�PB/0�A�J���{C�e�dt��Y6��0��%�:��Y��)����z�保�靊�+�e�Ҝ�+EH�`#��iFY���H��"���$���&��I@���Zv��6�њ�U]C�-�L��7�����Uu]ǶTZ}��V�������&N4���VAd�3�dT�w��vêM�AI�ݭ��ĵ�E�Z�Cn'e��&h,�ʠw*��Z��5����U��_���Uu�&������������\f�1#6�?�_uś�i��e�,�����r���n�Z�6e6b,���i� }��9�Ҕ����0��䦅W�tkqW���N�{�ͨ�=<��e �ݴZ���m�.MgFX�{+�ż4�Z+�� &�K� �s�O]�O=����Ԋ��6Q�>U�!W��R4ky�Gn`F�a��[��U�ZC]J,��N�[Y��U?<7�����JW��+b�J��
�40F�\�{UEy�aH��<��&�)�1u{AsѺ�c,k��7���>IF�J��U��Go��X+^��Å4�g%E�.�Hw�,.]urPw9��@ъ#��ȗ$Q�|�mnJ�(k��TP�cl����0�Z���3�ԩl��T�]�6�SWJeZjc��B[�00"epP��A�b�\�H�)=�Y���Y�jl{��0�J<��@tܗ��Ũ=������N3;�LX��$�Ik�`�/�2�e��X�eH��Ipn����U�P�tU�`��0.�O��JrI�%w�)�\�IX-}ƅ?WL�hmU�
^��'�AǦ��Y�r�����':eס'�+��3L�'�R|q��w*����T��:��J�0�r ��+��;���Wq%��g-%,(N�6M���r�aHn`W^Tɰ���q��`�#��ĵ$=VrY��N��1Vr�\��Z�Q+�R�dB�xSR��q*%m�hD�U+2k,�i��ajp;��"��iq�	�A�Y)��O�G��H�iԅWP��B���� 4MbU^:�	��)�x-)˦���,U���b��;�j�\>E����Ќl�x��QRb�,�R���3��Щ]����m?_řVEVR93G�rA�Γ/�ܸ��t��d�p�4ޠ;<������a����#�*_��p�����k�Ƅ��tJ�<������?�j�������l��g�&?�vJ��s�x[R���ǻen�+:�<6I���Ӷ�Ws���4Y~�C�4ڷ��ȧ9���9E�*�$:\=v|-��T���5J�\�{k��L���d6��Z:���4EO�8�H�ǈ��wB0@�	x�TAB��P�I�bB#����AS��R���4��*u��6r,��q�F�p���
�)*�o�CP��P���2]��H�P�('H 
��daBF,UY�J�T$�<e��.� ٴP{���a�PD�r8tW��,�d���'_�a�!��cMUh���1J,VY%�HX�0n1<h�=]s8�j#����yq���$�㱪��7p9��k��sAꨊ�>(M�:��-e�W�J�SH:C�5ck��D`$P�8�F-�SMm�]l� �F`c��
��XK�(I"�$@`K��r�2���A��	KT@4qp�"F��fm\:�'B-:�_���<ESώ�'0��l>�&+ߛ�����-@�3�9�Ա"y(,�C���G�z�&^�38�}�#.D��0l}`o(O\�kЂ�a��e��0k�VA�:�����I����F��U��E��g��_���L����g�����u��Uj1��Ñ�598�D{�K�Kx-��N���^C���iHD��VJ�A-�Q>:hA`��Ɛ�R�-]_�PҬv!�����������ɕ.��_;������3xP�A[����W�F��ۄ��,�ܹ�����:���D#Dt���i��%���y�s�>��n���^�-�;�>C�D$Fش	�v���"��=�;n��e�]vn�j�N{�ZJ<��SmU�D���=�����˕߫���]��Vx�T�@�Vz�/@��&����`x�zc���=����^il��a���|F�.��`�b��͔�
��Dv�{���a�S���~�)c�,"n\`�:�9h5�lO׷<��NFkPv�
�t�\U�keF *e�"��@W �r��	�X�q�	1	/}P
�N�'�� �>jϕ�2	�!��Ø��V؀�^��It��b94na��$g4��X΅��$ ^�<l���c�r��pG�v�>����3q� V��YX������
K�
�-���i#�崟k+���C�״Y��O��4ۨ�i���
5P�5m�"Thǫ�2����&���L�|�Ֆkt���A���#���@����JIF��@|�qX@Zҁ\V���:|��m�V�#�s��g�IxYH���aD��P�uh���=����& ��)�8������;�2���6ցi~ﳔ4E�"�գ��G!����♆��A�j!T'Y(�(Y��˛�k[��=v!    ¿\YK跔Q�K��)Q��X%<��	��ßs_x��ᴳ���گ��YS�����Dy���vӦ�m�;�ڢ�����7�.%a��)�p��b��)ӻ֥}f��(4���т �9�Լ_�nѶ�Qs>�Tna�gF���^�,�q���D�v=ځZA���h6FS��L&�P}}U���Q�i���h��Ғ��H ~�O^U��5��ph��oa{�B���´�hi��C��[�-��b��$�G���3�$���[>%��+�'��\�#��1hrѮ9q&�VA�#�Sl�)��i��� ���H�F�Nn�W"�:�3�J�U��P�XѝU�Y
N�B�TR�����!1�+�����c�-c�t� V���{��)uM�v�������0f�و��@�����^F�kC���ewv��\홡��eA��4B)T�i�=hC$�tt���[
�5��,���xܯ���mV����&6mNA4���0ڈ����͵���������VI~V�%�:m̊ګ�!��"X8�鬘ڒ`��$�j�^-A��k�X;� m���� aDPm6�'��Z�T`�0�t����V��lZY�M���nH9lxS�x ���v�v�2���$֙	�ZMQn2M�`o����@�����U���fl=([�v�y�$CN��x��5n%�hÂ��]��[�;C�Z��]S�r�2���I�XT=4��i��J3ڸl��E���r�[���d�<<�*��1i�4Wn�B�	d	�&��"E}��2T����(Q��@C=���+�LeV�9��)�|�����E���>���O
?�I�ù�����~���Oӽ��t/�7�ßT><i�G?�~�[�<�RE?�I֛�&?�q^�򬟅I�������K��Pܟ��u���+���:�������ћ/�6��rs�z���u�u���}�>{}ߧ{����׿�/<��yd�^G>�~y�B��8������/}-O�����x��w����O�?}���̛6���{}|��G?��#�=�~�~~��G�������~�����_��_���������k޳�׸��|u�r�?Ĳ���������>��������x�0��jM��S4�5�wI��C�$�9�Li��=�w� P��M����2t_Z���VlM����r����B����4�!��t��G�!�v��|�i��]��U��ޗ��9�,/���R�o�t}������|��VV��kw�L��������9�u~�\O����M�_ن�����wg�>�*�ɛ?�U/ߴ׼����"1w���:��n�s4�$�h�yH�͚�2�����u���ĦL�|�^�T
%������u����ce�U���4gW�xE]ǿ*5(�����}�й_K_�c�}�'�Ӿ~G;{�����q]�E���]-|��?W��m}��i_�yHҼҵ�N��ܖ��oq��ԸO�����Sf�_OY)'��Yoc8^;�������������/Ϝ��o���1�|���}���F'����f�{���p~�I�P�(r<�����z�l.)�d7�Ï���䳷��C��%���i[={��9)X�#V��}�W��q���-��'������'���_=��~��ɯ��WO~���z����Փ_�篞�z?�7��Y�3����j]�3��4g��5�]{��9������^�(:����S�^�<��ޟ���T��B\�ܩ���˳��(n��/������ST�;�|�>tm ���&0�j��*h�NҾ�jU������d��*�xD�~��zq9B�:\Ry�c/�B��kco��F��:<Z'a����s�Έ9�]�W��]�F�f����V��.F�Cf�߲�Jy���������rlݗ�(���s�k���Uv-���u>�wm���:.hj{��}L�-w�疓	�io�9뷸��gnf,ˆ�t�FAg�g�g�9��mM	*�����ڐ`�u���/F��UU�v���N��~���a*�i�[ц$�]Ok���U��:*�i0��I�SK��%&�h�������Zأ�u*Gpv�d��j8[��p4E�&#��=GUђ�������9�<�R��kږ��>��ӆ�a}�o�j�V;m)^3lg�����6+5��K�Q��1F��h�,U%K,"GgT�ES1y��	=�#��:�T�]���0u�^�m-�y��Q택�l���,t���Fp��tZ�t߱��������כ�{e��S��7�:^W�[�ݣ\�g�E���o^�O���"�W�Ϯ+����S���r��̟^n5<�Q��:�����u�q�䷯K�?��5��ʱ�+7��Ww��W��^�is�ܴ�Yn��,7m�w��g�w�H����r��f�is�ܴy�����)K}]����ɟ��C�f�is�ܴydR޹�}�)#���+_mn��67�M�G6����ǽr��f�is����y��_wg<�S���q�ܴ���M�{�q��t�!�r�N�x�����{�o�U��W醜��շ���H���{�n�G�i��PA�{� ��t{<��G�i���uv�#������o�G�i��}��oȹ>?�s����Qn�G�i��x�r�/�0n���x���Qn�G�i���������7ǣ޴�z�>�9+z�7yb�9��x��Y���c���x��n^w�>�CO?���w�>t���uw�C��{s<�-��|�s�؛�qo��ތ�����ފ��������ތ�����ތ�����*��Ň�c������{���[qwUoo�{���x܉����ǽ��ފ��������q'����g��s{+��I�&^݋�����ތ������c�L��X�k=�V��,�f(�\�p�ٛ�ʨ7���w"�j T�� ���&��Ho�Gx����s�o���������u�=�����[����[������u�C}9����Ў��������uŝO^���稜�]��;�����_�������r�E�����W�=���}W�z����e�������}(�|�N������Zc�'��/�����~���O����O����������~���ߟ�����[o�O�����9�7�)�|ݷ?�\ϼ$��s��:/�|��Y��:�1�9m�9k�]y����̵s_���ԃaɥ�4��Z��Oſ�ye�':�든��H� Q�����*�s��bڊϼW��y����HN��r��_���vOO�ŋN���Z}�M��w�?�bk��ؚ^����������c�o��qg���]�G�=tіrC�W�3�Ur���X�Mo�*�����M��ȝZP�p�������w�~mY��hq��{O���s�!�ܮ&zk�jpz^��̪�M�.#�j;'���\D�<{J.�%��NQ��L��rmʍ�`���QKϻ����Ϋ���N�^�e�!֖�c-C�\�"|�G\j'��؈�1iE�=�����"r�e�P���zԃA �5J�"����η/�X�^-/�N���7c��3�*�q��>��th<��la$qg��n��5G[e6�n�k�jlfVk]P�RU�T[_"�n^�K�͛��?�*D%�e��,5�#>���PQ\Ba�U��)*���߉=\��c(_3����E�蛟㎦{���=T���B5���Ts�?g�y��75cK</�hČ�̊���[���7�ۯz�;�%��y�s�x����sE�a��fs?즊~��f�Ct�L �����o�Z�j/���j��ꖿ���x�����xd뫨^��]��k���%�m�?ep�����+�r�M����6��H;�|j�ů�� �{*q#Vc3t�x=L�j36��n߳���C�	.����+�"�)�؂zf{U�3^P�WI�n�OY�����颯)]9�j;�s����1�U���(�l�T܋}1;ͳZ1Ψ��pk����Q�ѭ�*fu�������=Vcǌb�Ҁ�n�bX��,9�S�6rh����jb���X������8s4��sZ5E��8�n\�b�;0	*o�\���*��f��9��-Z�Ȟ�/�FQ'B[��    jEq�S�njy�*O5|��ȖAz�mƐ�a��މ@I�}1�pTߥN��#"1[�Z��xA��<�M�Mc�ar��t����0���j?+�"i��M�� ��)bA*`��;l�]�<A��Ѩ���n���[�:X��e�����d�m�xC��TPCu1w{U�-Y���KU��8w����Y���ꐎ�Ds���m���~�8nv��u�7<b>��:$�D5&d�Zr�B��Fñ�i�/�ƫ�՗[����_⁯z�� Hb�Z�����;!�����8!`���j3�&Q��	��(C������F}/5�$q�5�6U�+�c���W͊FzM��M^.��5�Ըn�pK����Nm1�Y�a ��r�IMG�"Z������g��trS���r�����bQ�q�&��A�".Qt�)`�����Ն�+�G�{S�8d�]�Ա��y�����i]��2^�[�[�sAY�k3ew����V��DQv���.W��N<]<��XWQk������R�Gpf�D� Д �B4Jx	碳Y�q5b�ǫO5Vt�CL��)s�y#n?61�ivYE"1T��c��4#=X�������b�R�V��X��v�;sZ*']c�a�*&�$�s���j8�n�Z1m"���@֜MT�nշ���$�E�ŵ�u�("q4T��F0�Qgެ�覐��0֦�]���ۋbͽ�u��x�fc����K�9�xq�(���EI�51��k[�񏈚���3h�x1mh�t�_y�6(<��8��p)I��x4����x	�`�����@xs�6��W% ��J,1N����p������ W�նZdT�>��u�� K"eB���u2��*'�X#�*ď6y'�2β2(,�������#Bn'�0��[�nch��N�Ro	Sp : nQ�����s+Q�S׀����i�X�DA"BL�M�{�D ���V+R's��;��X��8�ȉ�Ú{+^$W� �'N��%�t�,���'�&�H�1u��,1N~EK�@z4:�2��L�ã=��~)�
�Z�D7�;,u��"qE������lJ=��t"-��C�p���{V˫w4D쨨
��BA�g�zC�x�č1����N��'�&�� A� �P[zr�,au<�0���tU�Z{;���I�*�� ;�3a�XP��"�|VQA��P����FuP/��%hy��*3�TV_!* .�������WI�Z`Ƴ��@%��O �g�K�TD��z��o3E�bЄ���1R��VCeAY"7���;4T� ���8'���4Oq\�A��@������%���3��}�H4��Η^ļ��s�*y�y0���I=�#X�X��EA��hA8�M�Q�o�t�a&�Y	��r2� ���v#�H�O�"����L�iX-	�)�bct�d�L@E�l^����Z�s� �e��|B��Z�dHji�z0������l\S8�
�[xP�Oڇ̸ja�K$q��I�(d�nN����&�<;Qw�j���B�ܔ$��0�zQ�U�M�w�#N��E]�/B�G��>�c�&m�#	%<�XԂ��-<�|.y/>KU�RUݼ�׉�!������������='Dt�Dȴfu��)~!��F����\��(
~�#��1dS(_3pϭ�i��H�YJ���v�;�ሾ��y:�x8��d=ʩ���s ��Η�����2g��h�\�:��F�=����Yk��oqwr㔵�`F"�h�L��q���fpjR$&�m��+а�$J�OQ���:҈������h�bg \��]Mכ�B�(���At��D��E�C�B��qQ���p�!��	(���s�;;ܖB]r(���D"'v��4#��F�*�;5P'}�DF�w��2����QK�B�!�o����dT�)�/?,�Pd4�ݘ�ṵ���X�1p�.�`�i���ͮ$�iu�kW��<��ՂM��-]�o��ܔ���p�E�Gt���H{�z��P����I�|ఌ-��-�3$��e�(	����y�=��^@wFhŚD��{@.Ja,�cV� 0��V��T��KP�� R�7�[�O4Ak�D5�JVr��ի.���&��� ��LAvxT�ބ�_�g��Xy�'�نb$y����������;/H�����$���xvP2��Q��� L,�9�  u���"x�wP�ILF�Q9�'���g��E)�5`�O̩o�)V��k1�:��<��&diC���U�`��̉��k݄@�L�|��'�:h��3���X�<	Q"�)�3b�%~�����)��'��&�1� vS������$Q������]Z�*�D���	K˪�&"��p�.٥�O�#F',) S��d#����'�H}+�f�ľ��!�НڽUz}��^uV�_�"��@��;�X��������{���AB�:�H�]F�p �յ
�/�%�W[}ጊB4��c5 �)�/5�$R&�-���NMF��"T���E����-���'q���m�=38p�˺���sㇻ^�=�7��>��^]��m���� ���F{�G8}��Hqo������#i��ړ��՝��tgG!կ�t��:���Ҽ�i�W��"ў��N��]�/~~�w��.�W�wɼ�h���_���1���Y��$wv5������c��ή�u�Z�47�y���?�f^��D͝Z�k�̜�9����]$՗�^Z�x��;�W���oY>��;{O��-���{�S�.��?�1g��>��u����gL�^�н�~�6�|~�s��������㇧Ϳ�����yzQ�.��ا}�m�{=	|��'����;� ����vgl��ۧ=��m���o�{��ޟ���,�+9�=֭��]�6�Xw>U�o[w��u'��u{￲��u_�~y�˺���6ߴ�wY3~��A���ʙ����}i߫����e��[5]�I�+�f�Y��ʰa2�R-Oդ�@��M2�i��(��VNU0��'$%�Z7ny�̓���������^�;llj߫�V�[`�B�i�����k�k���ԋ���9����w�F)#��#�Ar���\U7�R�H��W2ZH�db��NN\�Ʒm��v�'_'��-����NU{�#�"��/�=�u�b�R��*���Ʀ��7������J�A� @�|���i�%2Tm��TG�u�0�a'�A��H�B� nQM6�~$��\l�	ɔ���)�#��3�($���E1��w)/�(QE�E$Fօ�Z;筥��v뼨�g$�sh�m�}��͕��Fw�t���P��`2���v#Q�d�(Gg0K��U
J��hg�V����t$��z�KѾs��2�d�8n1����Z�.�ˎ��N���Z/i�������dvJB�-ZK #�a$�o%at��h3�2�W�iu0(��W%?����0�!S�E��(b���5�0���Z��Ü���t*6����$��Z52o�T� �Hf�D�D�	�Րq�Y%-n�mLo3�:h���
\�Dæ���`����m�w k��U�'�5j�W���SE �oiH9�u�����[c�ꁣlX=R�6����+��D�g6��`��H���կa��ֲ��ܨ5J�K/j̣�Kt@^�6+�p��M�|�Z�"E/�QG��e�e��q��b^vzO6?�`i�`22s��V�R������X0и�Z�_KL���~`�b"NG
���P�n�/��.���.�65�A{s9���&�������G�]�ЂHZQeUh-�O���b7�S}����������m�ع��-n�#/loΦ.2j-�J"b<���:�Eb>��k�Z;%d��E4;&����bc���6�Y	Њ��Jc�����va�c���0=1��@p"_���X'Q�{j_����]�����0�^�r�`����v5�T�V�LoXE(���3Qq�@y����uI2:��,}EV��    �N�vVcjJg��bD={��Noz'�z�lW�W�J����o$;�(k�7��%j�V�y��bo���" ��NVm�Ef�hM몮!ۖĒ��ߍCCDi�E:��c[bV����f����D�IF�9�U<��w2b�]%�ݰjS@P���C)#q-j���0���)�{�C�����x�TT��19kV���]�J\��# ��-�Gm��Cp~H��T�P�2k`������j�+�,N�7��d�N��*���m��h�۔�ȱ0���u��$��KK��w�^R�M����殦':uN"z�Q�{D ����v�n�4��yå��*P����>�D!/�-�Ulr�'�K�pԧ�O]�O=����Ԋ��4Q�>�� K�\h)���%"7|FT�0��-m�*f��.�MD�ݭ,flч���)��]y����1{U�k��40F�\ѽ�P�0$Q=|Έ�ᘺ�\sѾ�c.k'�7���>IF�*��J���j�V�(�.h�;�J� ]����e	��A��sËV��|I�ʗ��҈�8M|���dT�:����|͝yh�NUc�%�vm��hM]%�-h��Y&m�a��) )C��/[��+<i:��4�T1�ŶW�S����Aݾ��mF����T��`��	����b��wҞ&>��W\��2FMt��2$��$0��Z|0�EpB(D��`�c��g\d�j
�*rI��%w ��Z.�$��w&�?WL�hoU�
Q��`O)��M�kd]p^��~�X�  ��@aޤw��!r�i�D~��Dެ坊x��3E~rR@G��0�,@�{�/A�b��\���VB�q�R���Tl��x,�Fɭ��UU1,�l�8�d�#��µ$=VqY`�LN��1Vr\�)����T1!f�{SQ�#p�$m�@��D�V`Ԋ�$�Y���mx�۩�, �L���&�L���wɀ��:�	c���3���
*}^�3�>	��I���C���N���ז�lZ���RU	!����S}�N���ml%�fd���匊3^�r,yk;����w��{9��U�iű��Y9*�]'O>�qѩ��d��ޠ;<���oB����_T����������1��'�'�Fx�M���.���k��g�&?�vk��{|�(�ǽ���en�+:�y���a��S߯�.�uf���kE�h�ZcP!��H:���]��[Et�z�����}U�kTҹ����Y���]�|�+k�<�@lg(z�$�D�`"F$�΄��'"L §�!UQ~t��,&4!�	 �4o��d1e�L��y�lA*�R�/�Q`a�U�L@6�� �N�QLQ�x������H>��"�""�:!@5Ar� .K$d�RUu�$ME�SV
8�2	��u�tD$-Cw��""���<���YUk*^������b�*1F�2��p�i��V���0�S�U񨪊*��|(M��w"V������}-ZxnHU1��a�]�9�R%�Aqu�8��30Y+�ƩHDt�'���m�a����A�K�� ^�l̂�Z�����]T$�	x`K��j�2$�œ���	JTB4	`�"F��fm\����t�/���c������L�*vV5�ѐU�����}N:�̙�B�X�<�C���G�z�&^�3�}�#/D�� l}`o(O\�kІ�a��e��4��VI�:��&�'U����Wmwa:�uڿ"2��T-��w��^��G�WgW��b쑀��ikr`*T��B����D!!�$e񧼆|AӀ��:��`�ZX�zt� �9,*Cv*Ŷ@t��p��fu
	�MN��-V�p�N�t�HO�ڡ��1<C���},|$��MP�˝K��@��S^-[��l���P1MT�_ʮ�*0�����	��+��r'�g�����1�{�]+��H�}�� 6tYe������Z���k-�(���[U�d� ��qz8�Ff,W}�R�vt�Z����b��sb�7����C��W��)gD'�N �A`�viF;�gD��	�*��LI_uTȎ��x��0���gr?�)s�*2n\@�8�5`5�h�Hַ<��NFkPu���S����kUF� *U�"���8\���o��`�7q�8ARL�KT©�r�I~0H���:s��L�o@p��aL�F�l@u/��$8KPr��0�R�3ZND,J�B�IQ�PJ6�R�m��L���;H�\T�i��F<V��YX������
J�J�-���i#��t�k����C�ײY�>O��2ۨ�iL�:сTb�/��C�*�ՈH� LBV�x|@&�b�Չkt���A���#����(+�g$+$!a������a�Ғ�qY������<n�&�����<�D��Fx!P�b
¼���GC��V��Nii�3������o�p�O��i~ﳕ4�">�G�/�-�BT1�c!��3���<��B�N�PNQ� �U�7��cYSK�؅ �re-y���zBr�rM�Z�*��xl�������"��@��}n(U�y-]�ZʏxOh*�ǻ\�n:T���
g^GvT�`V��KEءk� �\�v�T�]��93�M�Jr�l֜~jݯ�h�xA¨5��*���s �1L�q��[�ظ�hg���@���
m4M�)��J&����"��:Q�e���h��Ғ��Ƒ �t�����5t�/��&N�oA{�Bʑ�t���H��*�Iַ�[8-�F�I��"jP΄'٧&��S"*1�r��ޓ�	��#:L.:5'̤�* zy
m:�?:�xaP `⸜1RD�Q�S[�UH��!�g���l�N�G��Ί��,�u�q�d82�w�������_�:Z�$�:I&�p�n��S�2��Ev�������a�(���58-����eԯ^���IGvg'��՞�!�Yo�]�F� ��jf߃DMG'����@X��8�qZ�'�Z��f��{b��T<�֞�F�"8|�=��vQ	�
�Q�ܞ�U���V��YQg�:@UK� �7/+��$�5;Nk���^-I�Zk�X;� m>@�$��&:l����
kS��S��)�ت<a5�[~�M�*��V[�qR����-�Z	x�긍O$:�@�h���6���7����<��)|����7��"�zP�8�Z���x�S9�����քm�t���vA�o9��kE�wM�����v�O$�byh��3�)�V0tp�. "B;�f ��$P�=i�pypPU	8�cҡi��� �Ȓ$V-(me��L]e����{�Q����z���pfbYu�w�S5Е�^
����e���ީ��O
?�I�ݵ����w�Ѿ���ӽ��t/�W7�ݟT����T߫����S��~����Ͼ_���<�G�$��#�=�G�%����<+�@��q�ʾ�N}�{���/z����^n��S�_�{]uv����^�����_���?�/<��<�[���O�_~~y�������_޵<i��g��g_~��{==���O���s�1�^o��,���i������/����{�~)�/����l>�������:�����X޺�-�|�W��1_]��w}�WX����U����>>��e����x�0��jO��Ù�ޞ�<���9�!.�uz���X���� ����Q(��bA�eT-,��I:e.�_�X:���P��~���w��o�ϟ�>�x��N����Rk��fd�~�>g���I�����<B6�q������b��N�˴n~��o�#�1�{���T��\���������Y������﵋u��|��_�׼=���"1w���jrrF�OM/�=FdR�b�]�ު�?���G�rbS�B>r@/ԕB*������f1}����l�ʿ1���/����[L�B+O'.	�	����Y=���'}�{��?����N}�ky\W~���|�k�o=����ߥk:�e�4�t��S���%��[��wj�w{�y�2ů���S    �R�a��N��hh/�)����S_����q�-����̷���b��{tB���Ԍs�v�	�g�T�
OF��7��;V����\RTd7���D�����-{��d���/�V�٥p:�t�ۛϽ7��h��Ǉ����7��&?��_o�����&?ߟ_o�����&?ߟ_o�����&?ߟ_o������M>[%<k؏��V���7V��>��lr�V�י��n�E8���h��*���1����5�ѻ���?�'�W<\����Uю���}p[�ӳs�Mg����Ɖ1�]@��E�fV�s��$�K�VN�*j��U���~��z���T5�T���˴��:��z�Qj9��G�F�m�=�xF��tvq����ȍ<�2K��v��.F�Cf�ﲶ�<|S;x�r�v��[�e3�XP|w�t�OR�^Uע8�ȯ��޵=t�3�]���h���&9F�|�-'j����뷸��gnf,ˆ��r#�������kN|[S��<�!�^칎��ŨIj���ŵԭW�i�Q���q�#nE��w=���:�K���quT)��"`�I�SKR��r�S����oc�-������]��QZ�(����m2��sT���ܬ6�wgrO��sJq�>׌-!�.2eNΆ��ｫUG�t�xͰ��~�3CgmVj�����@c�:>�.Y�(K,"GgDv����F-O�0��sD�>�ަ�v&vt��}�Rm^t���1�F�;��v=�,�Pu� 8�]�V>��8��?��������=�a�Te�V��t�]�=�j?�.����u�p�}|?qX^,�]Wn������1[�?�����gՏ��O�\�}&�}]:��c�\3|������^ݹ��=�is�m��d�67٦ͣ���u����t9����kn�M��l��a_w�����c9�S?q���l��&۴yTR޹�}�a����c�67٦�M�i��s�=���6mn�M��l�/�x?���|��
���۴��ئuݽ���6oȹs�-�<*��<��|ě�*��W醜O��[x�T��|��H7�#ݴ�t+~�O�>H7�#ݞ�{��o�G�!g�.~T�����|��o�G�i��|�r����X.��|���Qn�G�9农��)��{o>���(7��ܴ�zC�����É��|ԛ�Qo�G�i�������8�ޜ�zk>���[�ݱ]wg>N����ݱ��ӏ��ݱ]w�>tݝ��u���ޜ{+~���X.��|�[��7�s{3?����zV8��{3?�7�s{3?�7�s{+��*n�!�8o~����^~no���V�]�����wo>����u���^~no������_�7��N]w�>����VޭN������ۛ�����ۛ������}�Mu/?��^~��������ܲ����z��ޖ��K��9U�͇vt]�~n�x7�(�|��_�|/������Vo�z�>v�.��.�����1��$��՛�EN/;�N��4�CY�w�>������>�O���/����O6~��o��?�����������o����z��}��_�G���ٽyN������z�%�o����yI�sΪ/��y�i3�Y���KO��xg����z�_��K.����J<~*���+#�8�i^�=�D��j���5W)�3��V|�zf�{���Grz%����_�����{z�.^t�<���o�5����[����Z/&���5�+KE�;+���<b졋��ھҞq��[��"nz;W�5��No�E�Ԃ��mu��}�[�k�jpWF�K��{�dg���v5�[+W���gVum�u�xW]P�9i-�"r��SrQ-�-w�j�gj��kSn�o��Zz�e��Gu^��tvzW�2.s���k2�R�k�8�R;���FL�I+���4��3-���mX�У���Q�AOU�6_t�}��j�jy)v�\p}�1�����U������C�9�e#ш;�vKe�9�*��pv�^kWc3��X�����r���v�j�_*o�ԍm�iEP!�(�/��e���QMՆ��
[�zFNQ�����N��b�C��N/�.�F��,w4�[��������poH��3��9s�C�H���X�yY�D#f,���`V\��*�7����~�;��/a�s�#���W�l�+"�C4��a7U��+-5#��fy��whh�^~���T{�݌W߅�P��%^���,\�#[_E�R���$_�o�.��m��)��� M$�]��k�l�5_�8��lE�!�S�,~�&��S�#������a�V���q]u���?wo�}"MpY�L�_^�0N���3۫bH��
�Jju�|ʊ���HL}M���!U��n�C���!&�"LE�g���^<�ٙhh�ՊqF�E�[���ڌnV1�˨��TN����;f+��v��Z�fə'�ڷ��@���Tk�L�R��ׄ�ř��w�Ӫ)�}�!w����ɀIPyE��"N'�T	�4�WG�QUn���D��~�6�:�2�\W+j8�S��tS�KTy��+G��#�h3�\�C��NJj�	���z�.ub&6���J�ZU��5��nZ�m��S���FV�y5�V�YNL�n���dM�R{E�a���	�0?��FU�Pt,p�0�\�����2]-#���L]� co;�rG�����۫�m��C߮�X���ǹ�e��"|��oU�t�`� �+�EmS����q���W��̸�a����֡ �%�1!�Ԓ���7�eM#~95^����ܚ�$<�|���A[p�b�����	ADoƈwP�	k�-V���09�RVN�ƐG��5$5�5�{��'��q���_A�ׅ�jV�0�k�l�ryx� �٦Ɲp��[��t%vj���͂!��cLj:�m��u�?�=ՠ��⧽�kn�-����{5�zq�z�cL+ĭ�&�6�\�<�ߛb�!��j���'�� ƭN�rD��b�j޺�r��Z�X�)����ܷjO'�b���8��p��u�9��oĲ���Z�U̴5p��<�3�f� ��� ڠQ�3�H8��ꍫc=^}����;�`�O��}�q��@���H#��*��jL�N�����*�dT��5c����҆ȷߙ�R9!���U1�'1�;5�W�AtՊia��mb��lb�Ju��u��'Q,2�.�u�cFY������� 8�0��:�f5E7�<]��6e��om��^�k�ƨ�4��6C4U��]*�	ǋF��(D,J�x��1�\�R�D��ם�A���iC� �[���A�	0�	}���KI��ģ�w5pL�K�D ��$VO�ٖ�*��Tb�qb`]����mx|f�4���"��Q�-� X)"�EM���U9ŊU!~��;��q��Aa��G<�r;��x�Rv�CuҕzK���p�����<��e�[�r�(g���}���H���&
bb��hB��$� �L��Z�:�W�!��W�AFN4��[�"�J���8q�,�G�{e�D~8yo0��8G����Gf�Ypj�+Z����I����dZ�)��KU�ժ&���a��ua�+"��g���`S�Χi7"�E�T�{�Z^��!bGEU0t�
�>��:��3'n���e�p�}��8Y�6Q�4 2y���ғ��g	��A�a�f����������N�@T����i�	�@Ă�g�ೊ
���7X7��zQg}0/Aˋ�P�P�	%8���
Qp�0�0�/'�J�7�3�E%@X*�=}Y>s�]"e�"Z��#�/x�)
�&�$��N�*���W�ܡ�����9�o�y�㒠"*���m@�(-�G>�q�苷D�ɸ�v��"�Ռ�sgU�����Y�FO�a�b�b</*OG��Xn2��t�3�Jx���(AM�����@B}���E�ebN�jy( H�N	g�s� %��g*Ze�h�_^�ҟ#G h-���=�բ%CRKӌЃ���x��f��B��iW���#x �2�>d�U�_"�U�MBD!�ts��w��5��ى�U+ �d"�$    ��֋���n�Cqڅ/�R|2=�0^o�9k`4i�(I(��8ĢdEm�1G�s�{�Y��R����- �ND��5�&��U�W�v��9!�c&B�5�c��H��7r �\�FGQ��,@��!�B���{n�N;�D�ͲP"6ﷳ��G�=��)��	�w ��QNO�84t���x�,-��9�fF������6:�	�M$�Z&~�����3YF�ez����t�4ˀS�� 1)�m�,\���� QB@}��rD�ՑFt5��ou\�G�;�
��j��l�F�pPFgG���w� 2�.��2����O���si�O@�Dm��#����C�D6'9����7�W�ߩ�:�+&2:���G���e���Z��q}�T�$&�rN��x�a1�: �9��ԭc�-�0Ĳ���u�8#L��h�ov%�L�_� ��5��L�l��xW�Lܴh��|c�h禜4��-�<�[���E��#O��b�$'�Nj�; �edh���>�hy�!�t$(�FIx������a���3B+�$b ��rQ
cA�:E ��~o����D�X����
~���	ZG ¨�T��[�^uA̕5���d
�ãz���&�"<c����<!�6#�뽨�D�m@48�yA����v |��kų����p��P`b�-�������˼�BNb2��ʉ<	L��=�.�H�8�~bN}3N��X�\�9��%�Y��0	 K�M��j� <eN�]�&P?`J��S�8��A�(4�	<m�r�I��O���/���'NI�<!7<7��q��Z}�O�$�Bu�_��p�"@�JWQ ��NXZV6�E���u�.E|�1:aI�b�H&�Mf��>1E�[Q5[P� �u�a�����3m������"!D�d�ؙĲ%- -���&߃�H�����F��2��� ���U�H|�,���Z�gT���`N���$��2�n���w�h2
-��jF?�,ʍ@�l��d=��'}`n����^��?<�?��z쉼�%����Z�o�ק�1�v0��=���E�#x{�� D��I�מ�կ�t����h8;
�~������L���eO˽�W)���u����}����ty��K��G�d�x�Z�o�����%���A��oU;�x�pv%���z������c����7���$j�Ԫ]��`�$ϑս��"��T��2ĳ��9�r�}���o��{
/o�o_�3��u���Y��8{4�y���-g�H�8c���J��e����W���{��h��-��7�?<m��n�� ��Ӌ�t1w���>��l��I�o?�.�����|@���;c����>�q�n�??��Ç�����g�_���n���Z�yǺ�b|ۺ�7�;��ݬ�{��u�w��z��{]�}�x����u�˚���/��U��L��K�^����,�,ߪ1�*��M_15����V��9�jy�&��o�O�G��r�
�Q<!)Qպq˛d��]T_��Ed���acS�^m���[rN�$t^_;h][dd�^t�̹lT��(���6J���y���W媺1m(��GR佒�B�'��ur�6�m�ݵs�=�:9uma��7w���y��x	�Yx�S�P�Z�$W���56��m��}���\�URR z_�[d8dL3/��j��d��8����i;I��G�`�p�j��#Y��b�MH�T���L����ɘD!9���.�ٵ�Ky�E�*�."1�.\��9o-���[�Ee>� ��C�nk�C�o�t�4�#�S�H]�BU�����Z%�F9��8�YbO�ZPPڷD;���,����-�8�#Y4�K]X���k/��'��q��vh��w�*w���Xvl�u��\��zIKu�lu�$���$�S�n�Z#}+	�k�G�A����H��A	Ž*����5�����.ʷ0G�5�����!_5'�R���W�S�	&�$I��Z���y��B�G2�$r&�MH����*iq#nc�x���A�]UT�Z&6��t#��lS�Y[׮��=	��Q�����*�~KCʱ�SL�F��We��B��F��^ٵ$�>c����PD2]L�~3������F�Q��XzQc-]���Yi�#�m����Z9(z阍:��F(k/�o�h��>��{���K�����۸Ȭ�¨��l�̸�ǂ��e��B�Zb����#q:�S�-Մ�p�xqmw!�%u)��ڛ�a��6�6�����>j���DҊ*�Bka}���ќr�à����̏�,m_6nK�΍��5�%hq�`ya{s6u�QkT�I�DԱ,�Yxv�]���)!C�.��11��T{'����2H�V,���UC������S����F���/��:��2�S�8�r&��RT�՞���ڔ+� kEG�����*�* �`z�*B	������G �k�5��K��i}g��+°*�8t���SS:s�#��S�vz�;qԫ�e�Ҝ��U"��|#��iEY��1<-Q����S<{�̎�t�j�-2��GkZWuٶ$�TU�n"J,�Yt���l�4{��':M�h0�ͩ�⑵ϸ�#�*��U��� �v�J�kQ����!��N����u��U�{��:����Y����U�
 ��PU��h�?j����@j�"0�� �Yc̈����WC]�fqڰ��E� up��U�6�o�MF�ܦ�F��Q54��/ 1�^Zrv�[��HnZpu�L�6w5=ѩs�[?�*�#r ������v�pp�����.-gFP�z�����'
yimo�b;�>i]چ�>-�|��~��$��V<ܘO젉��!]xXB�BKѬ�-��3�Z�!^ni{?P1ku��l":�ne1c�>n�Mq��ʫ�=���٫�_;@��1*��U����!a��y�sF,�0P����嚋��sY;���n�h��H2Z/U�_U�}�V���E�o\pA�qVR袏�./KHMꮀ�^�H&_�K�(U��67�F�5�i��%�b�1L|�x�k��C3u�c/ѵk�\�Fk�*�lA[m�2Yh�ĀOH���x�b�]�Hө<�Y���Y�(���}�z _���刼%h3jO��/���u��Nh�',��$���4�1̾���1j�cE�q 1�&�����h�Q-�B!�Us�e�8�"�T0PXV�K�,���r!&a��3!<��b2F{��T�{J�pl:^3 ������ba�2��&����3M�'�s��$�f-�Tī��)�:���	�d9 z�+	;t����숳���b��P�c��0rHnܮ���a�e��q�$�u�%鱊��gr�< ����jMQ=G�.@��	1{ܛ��x�S%i�� $Z���V�%9�rLm���N�gn`Z\E5id��l�K����O�G��H�i�ETP��B����H �LbE/�tZ�h���e��UD���H1|��[ub.hc+I50#e=�(gT���g�c��[ۙ�\��.����˩���L+��T��Qy�-�:y�9Ǎ+�N��&sGpf���	��:,x� ��ʠ���u]�~�����̍	_?�0�<��0��o�OO-u9�/�ݞXk\>�4�q��X����KF�?���?-s�\������=��~�v�3��o^c(ZF���
���@�Q�Ơ�R�*�#�c���hM���\���u��v��R����S^YK�xb;Cѓ&A$�1"�w&���=a>U����k��$e1���M Y�yӌF� �)�dR�̓�gP	�j|����d�Q-w:��`�
�ƛ�T-5T�G�L	?�	�	�XpY� !#���p%i*�P��R��I�lF��X��[ "i9���he��)o�.@Ȫ��XS�*�T'��U�1��)�[L����➮�9���ڈGUUT�8�Ci�����7`��k��s@ꨊ�> C�j��*���C%�)$���Z�5NE" ��8	Fm�SMm�]l� �F`c��
��    8n-��"�L��[�hT; �!�/�l��0OP��I� +��0:�4�h�R?P���~�w<�L='n�g��T�������zo�G��sұ -`��R�2�䁰xr]= �5�!p �Py!�n `�{Cy�R]�6�S�.#D�Y���J2H��G5I�8�R�4�h?�j������i`�i̤jAuxm�{&���D>�:�Z�c��N[�S�J����4���&
��$)�?�5���D$��i���գ�� �aQ��S)�"���W�3T4�SH`nr"�n�:���t
�Gz��4x����"(ؠ-U�c�� I%l�z�X�\���w���j�ʗd#dt���i����Pv�<P��`��nO��^�-�;	>�D$G،	܃�ZY�E�{�tذ��*��L�$��R�� ^k��DaDP���R&�x���ñ�5z0c��{�¶���ˀ׊� �<���п���55��ؽ*|O9#:�t��t�K�0�AP=#Z��N�U�v�fJ�
��Bv���#���O>���M�kU���p��,�I�� ��d@�D���	dt2�X���@o@0`(&��"`MTU_�2�� Q�Zņw���~��c,ฉ��	�b�^��N��+N�A�]}ԙ+-e�~�3�c"7Z=`�{i&&�Y�������q����r"bQ:�N��@�����P�y�r�m+\f���A�䢪O#�$0�Z'�²�F�ϐTTPzWRnɅ�N�.��\[ռ��������yR]��FMc"�ix�h�k~1t�T���FD�`�"�@��2��+�N\��O������E�XQ=#Y� 	��]�o4��ԏ��^���q[5����m�Y�$�, ���0"��
�P�u��� <���:%pJKK�q�L=/-?w~˄3:X�O�{���)��Y=j}!naҠ�a�y� �i(}��R�p��r������ɸ}˚Z��.��+k��-U����kJԢ(V	��c�]W���tr8��sC���k��B�R~�{�@S�<���tӡ�mU8�:������7p]*�]K1�劵��J�Z�Ιim�0T�f����S�~E�E�^�F���6P�����aj�{e޲�ƕF;]��j�Vh�iژM�MU2��8����f։-�4�E����@6����U�@��3�x�6�pzx�SR�������F�=T�L��u��i)6�Lx�EyP�r&<�>5y�-�Q�ٕ�'��\O ��1`rѩ9a&�V�#�Shө����� �匑"*����j�BJ��<��We{DpR=rEwVT�f)8��C� Ñ��c�0��7�7M�h��:ֹ�2&� �I2A�[u��h�J�Ѥ.�c-�.��cF��`����h�X��e7~�(�~�:P�ON:�;;�v���P�ϲx��4R)TU3�t �h::q��-�D����B<��h��6+�&�����A��L�0:�����͵�J�V�Z��������%�:̊:���Z"X�yY!�%���q�X�=�jI����Zk���i�B� ��8f5�a#\�VX+�
 ��tN��V��	�	��lZU�M��:n��r��Ml��J��U�m|"��p �Xg%@{5E����qu��X��t�L���]��Q�փ������T��Þbȩ�O��&l��mX@�ܷZ}�yg�^+Z�kJT�^���x"���C�,����hH������v��4[ xm'��u�I[�˃��J���Ms�F/t �D�$�jAi+S�g�*C���8�{����5ԓ�>�3˪;�+�������P�w�x/���N��wR�aO��E}�'�S��ݟ�~����{��������n������^m���������7?L~����?�Y?�'٧�?�Y?�/٧��?�Y��Ə�W���u��S���ћϾ7��rs՞z���������}�~���O��^�����ቭ�Q�zu,|� ������G����?����Iӟ?S?��3_���O?����3_����z��d���O�OvO�~��������K�|y��_d���_�կ�����w���5o��k����Z�H��˾�
_����w?����/{~}ƣ��W{��Ό��������qI�ӣLe�:=��D5 ���&�BIU�/�ja�(�H�)s��(�����}��*��;�����}�~�|���]t�U��ޗZ�6#��K��9��O�~������|��V[�u:�X�u�ӯ~���x�y݃}��Z����_>��Β��wg�~�]�S7䫷�b���񞧭����T��3�}�hzI�1"��{��V����=���*�z��*P9�����5�����}e�U���4�T�x�E]��bZy:ApIȾH�ܯ���1��>��Ӿ��N� �w�;^���3���]#|��?V��m�.]ӹ,�y�kם��-Q���S�>�ۛϋO�)~=U��
�����p2�v@C{�O�W�巟���/Ϝ��o�0�~�g�}��>[�ߣ:���f�{��O8?ۤ:Tx2�O�i�߱j@���撢: �y�>&zΧ��l��=��%���~1�z�.��)X�#���|�G�X?>��~�ɯ7����z���ϯ7����z���ϯ7����z���ϯ7����z�����Oo��*�Y�~� |���������f����δ�wk,���5�DS�VQ������F�9�޽�����8����:}�ή�v,���꟞��o:3���7N��8}�: �-�&0�ꈅ�tX'�\R�bhp�WQK����GT�[׫��������^��`����֛�R�i�<Z�0ros��3�&���{���u@n�i�Y��h���v1:2+��E��������/�غ/+�QĂ�s��|������QG~������s�Y킦�G���4�1r�{n9�P�Ά�^��M�<s3cY6̦�9���L�^s��ۚD�����ڐ`�u���/FMR�H�u(��n�:Os�2LՏ;q+:���i���a^j_u(���Jѝ��L��Z�������:��;lha�fWTW���Rg��j8G��pEm�������d�f����;�{���S����fl		�w�)s:p6�|�]�:j�#�k����C�:k�RSG_�Zc����v!�REYb9:#�Md6jy��	=�#R�Y�6��0�����j�E�Y6�>�yζ��e���[���R���~�Iޯ��������*�o�:^W�[����V��u�?|�7��������bQ��r���������Y?��m5<��~t�������3���������{l��ئ����u����M��l��&۴��6m�w��g�wX�����_s�m��d�6����;���u˹���;~��d�67٦ͣ���u�������{���6mn�M�G5�����=�is�m��d�~����uw�<U@8�ئ���6�����]��xC��x�;l��Q!v���#��W�J7�|:W��C�"��s��G�i�}�[�C|���A�9��|ܳ�|�>�9�w������7�#ߜ�|�>�M��7�#ߐs}~��r)7�ܴ�r�>���(7�\_Na�x�{�Qn�G�i�}�r�g��N�7�ޜ�z�>�M��7����ĉ��|�[�a�gݺ�}�;�q�Wݼ�}���~$?��}�;����̇��7��|�[��?���r�7���:����ۛ����w׳�q'.؛�����ۛ������[ywUVq��y�;Ͻ7��s{3?������u�{�q'����g��s{+������9w���{�q/?���nu��7�ս���������������\�n��{�����s]w�>������?���>���u]�P_Ωbo>�����s�Żq�@q�����{�����Χ��x�׻8��;pv�\t���p~��n���%�G�ը�d/rz�yt:}�i�:�����?���֘���~���������O6~��o����m��ۧ���������_��?�N��s�$_w�?�/�~�Ԥ�NK2��0V=X�s�kF�qNZdW    ^:�~�:s���s��6��Wr�?���R��S��|^��yN���a'R5@T��쮙J霰�x��3��3o���m?��+�����Ee���Ss���i�V�}�������� ���z�315��!�uX�[�a�Yw�f�c]��������{���h%1�۹ʮatw:Ӯ(j��&\M�+o���ݪ[[V{�2Z\����&;��f�.����Z�<���8��kS��ƈ�����9k�8Q3Ϟ��j�n�ST�>S��\�rc �}km���.��=��j,��ӻ��q�c��%�Xː1��^����Io>6bjLZQo�-������i=T'h�:t�`f���y�������KV�W�Kq��덁��X��fg�O_7�a/[�Fܙ �[*c��V�����Z�ښ���Z�ԯT+�֗h��W��Ry�^l�O+z
�C�}}/K�戎j�6T�P�b�1r��}Ŭ�w�/����vz��t�6��g������6vսx�Pͥv{C*՜��ϙ{�E�M������%�b�.���j��V1���L������N~	+`���^�"d�\�D*�����b�_i���7��n�CCC��۶���K�f�Z�.��z�/�25^g��7��*��bv#�|�f���h[�O\�i"i�J�\�fS���ǩd+��f�5���J����].V���������{���e�˺e��b�ʥ�~q�'����^�B�T�UR�[�SVgx|Db��kJFW����v��kh�E�0A�`�'J=[��bA_��DC�V|3�-:��h��d�dt���Y]F]-��o�<m���1�8�4`5[���5K�<�Ծ�\���� �ZX�a:�b'�&�.����VM�;���<�NL���(�q:��J8Ġ��:b��q�'�'�˶QԇЖ9�ZQ�A����^��S�^y8�e��G�1�w�w�ORc_L '��w�3����E�V"֪�]P�!v�:l�����,��0��˫e��ϊ��pb���pS|?�&k�VF�
�+��v9OP��Dn4����c�[�i��Vǥ���ja�mg�2{�1ސ;:�N]��^umK��v5��G{=��-+�h�C�|���c��\�+j���t�� �����j_g��؆�ŵ	.G�	������E��p,k�˩�����֬&��X��v �؂����,�N�y3F���MXCh�oq�L��A��r4�<�q@�!��Q�K=�E��MU�
�X�.�U�↑^�fd���ëy�654�Rg�+�S�D�nt��cR�Ѱ��hFFਫ�������?��\�p{m9�X�}ܫ��XЫhK�c
X!n=51�����E��#oWul=a�~ 90n�Y�#���V���\��G�j��L�]e�Uy:�G�ǡ�����AK}#��E�ڽ�b�������5�' 4% ����E¹�lVg\����RM���PS�t���C݈ۏ� B/G�]VQH�b�w:��E�V)&��$���Ԟ�%�6D��Μ��	A�X}��>��ܩ]���ۨVL��o�l#À5g�T�[խ��>�b��t1�c3��B�������hԗ7�%�)d�����)_Wwk����Xs/�E]@�)��������RqN8^�0
�6!�P�{M�!�ږ:�#�&����$�@<Z8��W�x�
O��0N��m\J�'M���c�]�$X~&qz2�ܨɶ�U	7G�K|��8<\(�Go��33��A5����bo�h1��(��,jq�L?��	(V��
�M�	����
K�x?ⱘ���ۉ.L�s�����x����[���[ԃG�8�,F(��J�CD9��5�/�GtE�-�6���G�G�8$Q�gr�Պ����%'���"2r���ފ�U"HE 'Ɖ'`�=�+��'���{��E�9�|L�=2K̂S{_��-�� �N�L��%���hOi�_���V�M����3Y�ܸ����)�l�p,�wK+�D���6feF��X�Y?~���!�
�̌( x�$+�����{���7s���B\bZjhVq��wǷ���ȴpL:q�{�jm��FESAG�}���K�Gl�e��1��{��.*̌,�m"�Ҁ����A�7����czn�a���h��À͍�e~�$`TA��Ȏ��a&bB#o!\�0���p~�C=:�h`�F��>l^Z��
��E�bp@��o(*��_�a0P0�]��*��Z@��L$�a�Գ$O���:D�D)�TD�����OP��	XZBnhE���8���2MY�ܰ�Ps%	Ոn��w`�	���<1�%uX�̀��Gˁ���F�ň�#��B�;��Pˀ�h�s��|���2c�}��0f�3z��#l1��P^4AX�Mi��WnZ5��!r0�8l1��d��
�]4�=��ك%4L�a7'�+c�4�Z�F-::�����Dg����&��0��-o�ğ�� C+�9����'�Z���z0K;�x�^fƍ�)�vS/C<L z�p�Pf8+��g��Q�� ��Mlg����5a���������d9.
'���X뙠���������K��"������F|�P���q+	4Jpkb�d��£;ҟk�g6K��dBU��M:��ct�P��_<0S���!dB˴k�_��N
]�h��� ����UA���0����P���k��9�d%�����7��|`;����[28O�>(��� ���QJ�>�0�F�%	B���5�oe�,����dq���h��!
�)�9#��;q�儃x!�虞�#��
�,;���<
̵Q&�`әA�b�<�ir�.)r?&�1�V����a�G���0\�e�r��-�i4.�!9�AtƠ�A�p���m�D�m+�sx���O@#cb�:�;;���ơ�1�S�1�q�����U�w�>�+��8@;1�a�� �0��iI��!���)utIL�&���0�.&��&�)˥vh�|�XF�t1m:a3�+��:��V�l-�+a@Cs�dT-'l&C����13-Zin��|vn�H��Ax������'p�<f7d�N���'݀���x2�"�s������@�NGʰF��R�ix{��	��;��2g� (����Fa,���s`���37���cD�)p{���<��Qt9�	�Z��Q �Q��|�y�Nu�y+�z�< �"�PvPT�btP<���O���䝠�6r��_��� }X4����%���ց��1{-�접�9��c�����9`����I=0�c�E��x9*#�c�$�D�g���$�4�8��'��0�9�Ǣ��B�]B=s�?t	�,�H�d�T��m�£��s�	X�0��|b�r�t?��D��2����q��5��s1f���l�ƍ�Qbn���Pntx��ܦ��e��$Ҫ3Ph�"���8ӕ�0M��>X�V�ل��ɱ ����#>��sBO
0S�a��c����S�vhj6���^G�Ca��q��=��OCGR�l��A�V����Œ1���?�+�þ�+��A�n�p�Dt-��I81��[����!F�C4�����_�R�=��bdM� '�O0Bu-�l�F��{ؖ=�XOg�����ٟ�p����/�����nM����5��r��i�wA%K;l��k���sdJ��e� S��G�:ǲ&��VW��e��PV��������1c�K��^dWdJ�)��g)�vǗݝ��S���*�w�V������z�?}*Ѫ�+����[u�K(_(��W��
���>V"�wk3/��Qs%RmY����P9Z��WV�]�kq⩤\�W���n�^}���Sx~K|��Dp�����GY��O��p-e��{q�f�2tϫ_x��Ľ?�W�Оb[�6�]�Ț������DY�0w0"w�gs-|ԝ`�}�Ng��� p�4 ز�;��F����8�������.���{~\�?*���nr�l�6g    zw[bO�������a��{Ի��޽�����޽�x���n�>�3C�7�/��"g�ap^/���7�if�Lߋ100�܄��<Ͷ��5N�6��)3��c�� 'Û���6P�4p+'F�)F(!\����};Ù���D_ÐsdC���;w��s�^.�¿�ٚQ��Xf�>W�.��;�L?��M3�.��6�s�B)�|�=|�q�s37x��v��\�y΍�D��'��wa���n�r�=�u��]��W��=�c�$�/�k&��q��27i\��ۡ�=������C����r\�0Ї<���L���~8���0u�<�	�A��H�����&{�^�Ȍ�=/g���Δ�����@r�?b&�ͳwM��K�\D���T�mgN���Z��|�#�i�������o.(�qpp�7��@�X2����Z��#1g0���;N(���L:;s�YC;��H�$ԙ{�$�;wC��zx�n�9ӎw�,w��c���9OP.�r��o��A�#Ѡ;�I�Nj��-Z-0x<x&o���z�[�^f�� �:4Bf^e��ݟ�4��q��-tG�����0R��	���|��R_79��y�p�rΐ���[e"0w$j����$d�<.(+K�eLb�f�u�rW�D��&mSV��0l�L*�3�^��UQ�p��u��q
��P \o�Qʱ�%��+��������0wH��	F��sn]�0y�1�'d�Cb��db��hF���R���;��'n�éK��F�[�7|�'�|?s.
>(ڥCmtc?�Bh�C��יI���l'��͏�����h�57C"[�FΔ�(���1���lƑ�93���~D'f⦴���ňP�n�!T��](���l��_�z�T��s��|��Ν�}��e���hʌ���}L�	�؍��]�'B5t`?�~��d._��,F����Y�)pr#�#(/��i깇7�A�DCI8E4�g�1��=����R���f�n�n|g{�nX��9P1<�����0��ft�qb �A��h#�ԫ>�I�c
QT��eh9*֖̥h�fd�	`<��(�R)�V����ܣ�2�*�Bf��+B
CJ�"�`P�soh���,��8��m�
�2\�쟓��:c��)uègK�[ٙ�1C=�Xf�z�L����ñ�2'�!cPZ�Zp��T����O�N���Mv\v��m�缪�Q�}�����!h(�&C��rm}�yէ~@�4���L��A4��t}E�:����ͩ����$XP,�����x�G.�w]i!�%d�4��Y+j�B���8���S�r󡑫t�p8Mաj8�������tq0
̡�\�.�[�?5>�h���dC��K��h�u����MxZ�6i��c�S�hi�/�i�3���,w�Qr��]�Mg.�z��I�y02p#0h���s�7�6�3�3#����Z�4��疡���� M�Kk�P��|3p�i�a�N�'�/��>q�5����\��a1Tf�R���-F���A����PLŖk���e���[-�b3y8�ܠ6�)}��*q��(f��~� Y�:#�\&{e:yh���`���3Ƅ.S&ю�fOiN\�r��n���3n&q�!�d8_ʀ��a���r}��0�b|À�����,K�.�#^/�!�Ir��9 �=T��@2�v)I4�v�m�Ј�G�i�&s��ـU�8�	Zˬ�];�z�M�Ƙ3��s�����R�.��������C�`��9T6.Wx�H�cxNoaZ2��2��g����0_`:p�/��7.F͓��]Q4�6�4`h�&d�L,�@���	�A�s\�`��1:v(�8��P7lnù�k O�18�P0�u�!lK��'�On+�e�K3&x��i9aLB��;c~ʱ1�k��T0Jxl	�B���^3�����Pt,����'�a��u�&��p29�i�q�!>�fN�t(^��LL}R\@�Q���1`�ˁAy��h&;��@�gf%���R
(F8���p[\g4$�G�.GQ��xN3t�g`@�\k؎\��8N�Z�e����=G��f�&D���1�
���ɐ��C��,�AX�K�4�a��2<ĭ�~&�3̴�c��	bȆ��0VR?@��Y=�}�������ў����I,Só��	h��@��2�4�*���F�!��}��[�˵%���j�����1�%�P�2ˑ���L��0��t�r��ϑ�i�a�Ie�(����'�3ܸ����z��3ޠ����/6h�4�{��Ƞ)/��C1��nL8�S���2�',�M|�Q�/{�g�m��Ƶe���]��y�5�I�����2\Q�dGH�!�=��b��-�dz�C�4�����98��]2�7��0ԣ/��]�0�2:�0�3ۛ+e*3م���Z�ꀱ��;MD"�`��w��� �'�0#|�AE�п��4�e1��#dg n�d������L2�y��gZ@����^Ά*�q��c)`�N�O��M��1>FK��������O��C� �Q@aX���2�Ru�n*J�q�tG�2�l<!Y,��na"�-�=0�hJLc�26�c�K��e􁱦���I�ϡX̜JxF�et�a�[t�XP+\�a�\��ʨ��š>�&A��X-mo`cp�|�8���@�T��&u�֜.3Ϡ�*�9��na&s��8��"��1nhF.Ï�3]���.l�/��1k�O��8d���$ZP`3�����<�=K�'�D:D��
�P$�!��lFk��w�i1�����;�ݓfj!nP�&;3��������mC,��S���:z<y��P��zĀ �:��x��`��q�Ѫ�_���������3���dPEh�(DT3!��t2���$�p�HQ�������m:ܫl���@�lƩa� �w�!�����ȇq���Z��?b���i����BS��E�i�%<Q�������Kx�FLÈh|�6͐`�fa�ѡv0P��ac(;�b[�h��W�ȠYRH���y�K<b�8�fiٻvd@���{#(l�>3b=<'�$�MX=,�s��hl��De�ܰ���G�.�`���~�P$`N�bog���m��N4�a�� "|���ڕ[�x�G��{�e�]��	�/��� �Vf�	��b���R����B� ,�=lƴ��҅�c��㵃ϰT��j��1������S��������[��&2	�F=�fN�p��hu��X���an6���@v��E�{t���������kF�������s�s00������H[�����	b]�&�Pt�([M��32N��Ѣ(��C]!�-݂o�Θ`�M|� \L��>0��'�'�#\��G2W�ʄ�#��С3�7�C@`�KobCs�����q�3��N'�X�΅@��Q�l�<��,S��os�l����,}���O�������г8G�����`�t�-|�qnfhv�fF�F����Y�|�.�l#�4T���C���H
�B_F5�H-`8d�f<P&����5�����-���	�v�(+��aY$�3��_��oX��p7.�ky�:�i�nfL`��s��M�(#���Љ`�`����h �ב�ވ��`��e-� Qʜ�#���������Q�i~��R�D�/B�����8�F�ԡc�!&��#�����G�]��J�P�D�<]���˚8E�~A�?��3�/3�Cr�tM��E��	�� ����#h��H����*y-�-��#ԓ�@�@y����Pym���Q�#�[�o@��NĀ��R�U=Fzw]&gƹ��G�s�ڂ����O��K�E�9ü���9�ԏhr�� =�u<t���ņ3W&�zx4+����g��6���dB�����Si�$J8-ғE=���s
d����    #O�1'L���'T��5�Pv:��G!�H��BZz��##����-�b#�$aq�
j�8(�\b� [�i0*�v)��'����mfr"5G���U0�#,OZ��Ꮞ�
0�q�1JMM��V{R�e0���e�Fp�z�]�Qe3k���X�(�㰛�P�#�
}��&ӵh�u�ΌV�JN0��d�*��[�8�.�%Lủ܌�5��آ1��S�&�*�:�Q���(�&7Dv��v��2C1��d5�NW���V�C ��t0��ifBo�Md1p���D<�_��v�Z����`O��p*�s�=A�;|��**i⑳�<ޖA~��%��fE�zUNd�Ì����Y�y �(`��xȫ�Ӈ덜km��a43��!o��=C@P#h&�� ��
�l*h 5�S�=fƀ��C�i���iF����&n�r�3�7抇�v�掸�o�d�a����e&�k5���xT�3�C�X�� ��8|���4�h��E����a�v�T��`ȉs9�lk�h�ZC�	���}k۹���'���tT�Z��x�$rLL�Li��ρ������6�@D��E���I��	=q�0{�AC��?6��q�vA �,�ĎJ3=E~��idN��9w.������x�O�A̘cՕ�+��@��D(��w�8���Ng��>�N�nw�g�>�Ng��>�N���^{��מ���;��;m|���s�u7�ӹ<E}'����Ϟ�k�ɽ�Iv�C���u/]��q�r�pǶq��ʞ�J|�����/z���f7_n��S�_�����뾿������_��tϺ�꿰�U��n]�+������||Q����k|���}K�N�;���������{������;����������o����|����l^YW��t����<˩sN�ϗ�rJc��e��Y-;�vZ�.�g�w��:�;��Ha
�њ��%cƹ5œY$�ya;�I2�=�fLz�G"7 `��5��Bj:F,�x�>d�؜ iJ�˒�ҏ�Y,��ߛ����W/��r��_�?�]���*$]���̭}J.#��g���<�wZ>���#�����ܖ\n��b�s0�q޼�V?��;bQ�i���mW��m��������pĒ��wg��s��͗��[<�9���n����B�L��<�\���,���]���3қq�%~��h8��3R�-�v�])�R2���������c�g�5i
�1>�"����g��ʞ XJ�>�P�^߼��(�wߞ�����=(�3�/�c9�U�ק�-Ox���-ϥo]���e�]I�mm�R�:�%��3m�+[܅���_�G����J)(w��6�����h��S����黾���=��֔��s����!�c���6A���e�k�K6���Or�
���e���nǌ]v?6K)r�c7-;c��������O%���<[WإPv
&y�g;yߺ���Y�?.��~���d�?z����M���7Yߏ�d}?z����M���7Y��#�ɫY�2���8�E����e��s6m���_Ŵų1����B4u�,
w=Ó�]�^�<:{��s�3Re�*�N�U�X��]f����z3�KF��c>N>@����	���`��:���2C�czn��e����-����R��%7=���!�����F6��r�h���4���<#��t�{�O�@@nl'�M�N��+I͜鐩��S������޸��6��>�`��,(~p�䓸M/�k�p�#?�����Gr�-���G�v'�8<��C۷�	]O6�����D��M-z�S�-7��w~���41�ۚ����o(С�Q�Cۍ)4�'�MRS*�9s�^�4e�?%Iλ����r�y6��PΎEw�l�Τ�]S��KL�F;��s#�o�hC汷9rW��l����BA����Q�m2�b�5ǎIK���\�˸:*�lxڶi�T��Ƴ5(~Qe���h}�߽�:�vD��fg��3��Mnz���G�茑|��օ�LS�X9��ݠ�1��<ɣ	C��q�Y�m��.��چ�����h�l��`n������7T�	��t3w+��$�Qv���o���O]�a����NN�嬦*���媽t^�;��y�d�|=f�\r�^:/U��%W��\�̟_ε�r�^:��#</�������yM�����p].��\��vUs^].��\Ӧ2״��5m*sM�]a�yu��&�t*����5���Me�i���ϫ�I��w��S����!S�k�T�6�Hʚ���GMi�o]�jS�k�T�6�hΚ���G]�iS�k�T�~ޏ��y5�����.״�u��y^]}�暎圊���7������G�ԫX�WME9������Zyߺ�h*�GS�?������샦�>�����me�h+ʙ{�"�/�o[Yme}������me}���=��r����H��#U��TY����g
��}��#U�G����t�ܕ��:;������>����U�������J;������>�r���j�ϫ���U�y5��������j�ϫ�<��>x^]}����U��ٻ���V�G�<����m�n����pԌ��?�������m�n���^E�=dw�y�}���?������;�m�}����G���W�?��s[�ww��:]��Q��/����:��V�����V�U�n+�s[��J��V��|ߦR���s���s�W�?j�sS�۝�~�}����:���^
U���~��O߷]�n,�+�\�W_�������\��R���*�ݭ�U ]�}�P>;Z�1������7�s9=���v:}��.�u[�N����?��Ƅ��'��ÿ���������ɥO�|��O��߾}��[�������ס��~��?�7�/�޴`l�,���13@�58~B`�� �{�i����|v�ȽH�3S�����{��ٝ�iwH*�y�O��)�8�{��	��T*��f���)Wz2
�d��x�,ʮ�����p���f�t��?�㶓Oi����<b�l��5g�u��<;������;7*��:��e@m���-��~��N����Tx>c�12���.0:��}G=jF{E�,~�?��&��n�����P�!��_�����=��-h�V��ww����SS���w�іEv�eˀ���e������bi,��˷g���pw?����#�Εw��9�yEoH�</�t�,�{�[��˒���.e�B�eH��ȭ��qW��ѓ�����廣�K�5����T��jW��̫vxӰk�̠bK��}Đt���K�J����]����L�ݝQ@��t��o�������ř,��o��i7Ŷ�17(�82J��)��#���+睯��t@�*7'TѼhCvy�]+�|�����������珥�7�����M�9],���im=��Đw-�� �XX�K[J��w�NM׽�uż�.�Ϸ�g⊲��]��'"L�ƺ�W֦Y���y**f^���vw�M_�w�-Cy�����i�.��lO�����L^��糞0�O.��]�^�����#���kqGu�O��kK�^�jK�^�vmI׫ܕ5A����,v�Ɨw[��>���Q��z��r][O���j�ٿ�vWc�5����j��W��~��,+W��k�~D����5�W�>���}������j���v�Q���پ꼡�^��;�:ﳁ�U���z�oU�X���/x;�����BW�DQ!������Fo��j�?�b��������@�ekէ�t��>W�@Q���m�k�g���z�:�6в���������]m��R޾
]YE��Jl�k�i�j�z�F��i&�L=�c���}9�:��wbIZ_jn���ɈË0���>E��ӱ�t���{�I���r�����X�<q;cB�eP��r�����k��y�M�m'�$k�e��`��h�����}�cf�b,�+X�.��|�Vϼys�7w#s������A{�2�����r�M�D�mk�`�tP"�h���1n���C�{c�p���cJ`{���c/o�6Y'"]�-n�U6�|�+(�L���?����ߘ*|����������    �r#%����`I|��{�fh��{Ɔ然�>�]>��L���s��;?��1jI��Kb�6�ؒ����ئ��$ǃO�����߻�_���O���B�{�/�⚃c%^������Z���f?K��h[�ڃ�ə���h�^1�g��6k���2/r�^v�w�n˕���-W�/�q�˒.���V|.���3���]~�	u�����Z/�}�q�2;�J�$�اv��BI*�̍��m�9�������+3���N��*[�/�Ġ�T�s	L�����2��>v�+�D��&~��n��-=�[�͔��K��X��)�'�h�\�S91��������3®_}�orp#7�1�wt^�c���3�����|'��q��h+���Ė;'�+dB�y]�}��op�<�Cw/�wr��q����b��U������㬺;F6O��G�/�W��+΋�y�����g�x�2v� ��e�/���cG�1��J�-qt��@�5΄e^�-+"�g�/,#�.�N8�"���u��3�v�2��칙�!����3��|����x�L��b�2�e�(�Q,�XF��b�2�e�UI�e|�6��bO}�2�]u�2�F}�2�E��2nE��2�e|4H,��UG,��G,�ZTH,�V�H,�X�5Fd�e�(�Q,�XF��b�2�e�(�Q,�XF����b�2�e<�XF��b0��}��mx�2�������?��O������?�����x{�����`D4���F��yy���{	�u��r�aD[����D�.WmK���T�NBY���Om�L�*��X�}�@[��+=!=��tW21V�����PJ>��ky�X���j�^M&��}�N�_�.����w�J&�݈�-}y�����:�x��X�p���}����Z�{#���V7�I�׮�z��v]�V�`�dw5vo6q�:to:�V�鷭����J��.2�^w��g���N:��܋N\���8>�V�깷m�Л�ĕ�A���u=z7���v�5|�u�ބb��\C�m]�H(�P;��پP<o�	$&HL�� 1Ab��}x9�	$&HL�� 1Ab����� �ù2��z�&h�m-���;g��:��c��%���|�˫ax�؜�����|�}KLq�y��a��e��y�����5eE��y��>�GS���R#5�R��ͅ�H\\.�BL����� �+�T���Ԏ/���Kxԕw��u��3���w9�-L�G\�"T(4s�ş�k&���6&8��߿�߾�Rv3�@�n��f�n��f�e���L��~����n��zw�Vv�[����=ڮ��n�}~H�͔�lk���f�Qe7[�
)��V�H�Ͷ�)����mMu���V��fkQ!e7ۊ)��H�5�c�d�(�Q$�HF��"E2�d�(�Q$�HF����"��L��Ο��f�n��f��n~
/I��Ɇ϶yy�/�������=�x{�ѕ;9��$����"빯+9�}���N�(��QH�R+z�w2��{e*�5ch��0���#I[���w�Q�ǔaU�]ť5��/���e�~�w��%:���N�]��9*���eG���%��=S�;��+ch���F�C���֪�5Y��no���M��.խ�s���5��=t�-�eu��^�������k3��W�~D���yM��mk�[	�:��63G��\�n[s�K�֜{хk֞����g^��l��v�p��5tᖵ��l�Y-R\���W��z��+�^q�����rP\���W��z��+�^q����#�ջ2��w���_� ����Ι2�"�J�c��AT���]���7��I�y%�⼶�7�[�0k��m%o�H��Ϸ��^q^���P�k�/U����M���ހ��'�w�A��j\�8w�9V*\,y.ǚ27����9/<c�mh�q�q�q���;�� �>���϶=�����L
��}X=��1
��zڡ����V�N���{5/����>0Ծ����x����r�v������-�򷤐��o��r�*L{	ʰ�W���]�.���Ή}b�;n?�~	<i�P��F�W�'󵽲6MѺ��Ŗ��'%[\�{���U��1����Ͱ���]����mag5o�ư�%��fag��uM��=��-�g�
����]�������Џ���׆�oW�z_�?׆����5��[םw�ߟѝ{�߯U~l�}M�6�~�:������A��o[�����v�5�}֭C�N�S�?�$�ٺ��1�����K�u�yg���v���?B����#�G�χ����?B����#�G����lM	]����>�3e�Q��[��t^�c�P�'�C4�+Q��c2��LM��PJ�.5HWu��פ�O���QM
�'|��y��>�H�����5)D�^Y/�������5�S��1��%�`wp����\�@S)�a������M��N�����r1�F��L��?�t��������oʪ!�G����?�~|ȗ��?������ݰ3�?[	?�#���G���uG�ϭ�G��ZtH��V�H���ǳ����_w���Yc���?�����#�G����?������?.�G�����	��#�g�O���_�}��K����?b�������������#�G�؟�Ɯ���J���?��?b֮;bn�?b֢Cb��Gb��<�$�g��#�G��#�����#�G���?b�����#�G�؟�q�?b���?O���?k`�9L����}�#�G���?b~t����?b������ݘ3�?[�=�#���G���uG�ϭ�G��ZtH��V�H�؟ǳ����_w����Yc���?b�����#�G���?b������?.�G�؟����#�g�ϫ��?��������Y�c��x��퍆w�?��e����PX�2%�#>���tU|�n��>����	���OǶW��_.���М�0�ǲ�n#��
��+z�wbB!���"]�ܸ�k�����o��W������l���b�)u��}���T�hY���m�����1N ��7��R�JϹ9Yݗnw&ZSZ�/��.������a�+gu���o�em�r�b�b��o�nwg����[��t�M��u���
�=|�V�걔����ak�*�F|h�3o6[�\��C�P�������;�]��Z�
��U�z8e���Fx�R}���W�k࡭��;�3�s/xh����СZ�GR��BoF�Vb]�m[�ލ}�t:�f�78T�>׀)[W�7�C?��ں���KIl}(���z(���/���Е5QT(�������Fo��jϫ�0Fa���1
c�(�Q㇗�0Fa���1
c�(�Q�c\����r�G��ߎ1�])���	싑��+sL�1�����8k|���ԜWȄ�����z�u|�W���8�s�5��Ta��#���X��/?g�k�͢tXd���W���#����	�m�q&,��mY�|�߹��-�"i��"���G]�"���M��1�c�(�Q�0Fa���1
c�(�Q�JZ㣅�	c��x�#�q��#��6�#�q-*$�q+j$�Q��@�ׯ:�o�>�עB���F��1�1[�0Fa���1
c�(�Q�0Fa���1
c��(�Q���1
cƸ
��c<��(�Q�0Fa���1
c�(�Q�0�[��0�G_�(����G��UG�m�G�ZTH�V�H�0�G���1�_u�1�J}�1�E��1nE��1
c\c0�0Fa���1
c�(�Q�0Fa���1
cƸ?.�Q�0���	c�(�qc�x�#�Q�0Fa���1
c�(�Q�0Fa��*ia���&�Q�㩏0Ƶ��0�ۨ�0Ƶ��0ƭ��0Fa��f	c\��c���c\�
	c܊	cƸ�`la���1
c�(�Q�0Fa���1
c�(�q\�0Fa����(�Q�*0�(���G�0Fa���1
c�(�Q�0Fa��oU��-|M�0��Sa�kWa��Qa�kQ!a�[Q#a���Ƹ~ �  ��x+�ƸƸ5�(�q�����1
c�(�Q�0Fa���1
c�(�Q���0Fa��ϟ'�Q�0�U`��0ƣa���1
c�(�Q�0Fa���1
c�UIc|��5a��O}�1�]u�1�F}�1�E��1nE��1
c|4H��UG��G�ZTH�V�H�0�5cc�(�Q�0Fa���1
c�(�Q�0Fa�����1
c<�0Fa��W�1���~�1
c�(�Q�0Fa���1
c�(��V%-����ׄ1
c|<�Ƹv��x�ƸƸ5�(���l a��Wa��Ra�kQ!a�[Q#a����-�Q�0Fa���1
c�(�Q�0Fa���1�c�(���y��1
c\Ƙ�1�c�(�Q�0Fa���1
c�(�Q�JZ㣅�	c��x�#�q��#��6�#�q-*$�q+j$�Q��@�ׯ:�o�>�עB���F��1�1[�0Fa���1
c�(�Q�0Fa���1
c��(�Q���1
cƸ
���x�#�Q�0Fa���1
c�(�Q�0Fa��*ia���&�Q�㩏0Ƶ��0�ۨ�0Ƶ��0ƭ��0Fa��f	c\��c���c\�
	c܊	cƸ�`la���1
c�(�Q�0Fa���1
c�(�q\�0Fa����(�Q�0Fo�1�c�(�Q�0Fa���1
c�(�Q�JZ㣅�	c��x�#�q��#��6�#�q-*$�q+j$�Q��@�ׯ:�o�>�עB���F��1�1[�0Fa���1
c�(�Q�0Fa���1
c��(�Q���1
cƸ
�ѿ<��__~������ �V�n����g^������߿�߾�~�~���۷/_�|�����+����?Sշ�������K���Y,�X�﬏���)�S,�XN������b9�r�h�J,�mKZ,�������x�#�s��#��6�#�s-*$�s+j$�S,��@b9ׯ:b9o�>b9עBb9��Fb9�r�1"],�XN��b9�r���)�S,�XN��b9�r����)�S,����r���y_�ӆ���5�����a9�2
e�(�Q(�PF��B�2
e�(�Q(�mJZ(㣅�	e��x�#�q��#��6�#�q-*$�q+j$�Q(��@Bׯ:Bo�>BעBB��FB�2�1 [(�PF��B�2
e�(�Q(�PF��B�2
e��(�Q(���2
eʸ���Ki2
d<�-��2
d�(��6u!�Q �@��	d�mId|� 6��O}2�]u2�F}2�E�2nE�2
d|4H ��UG ��G �ZTH �V�H �@�5�cd�(�Q �@F��2
d�(�Q �@F����2
d<�@F��<�?��d�%�������7���3
f�(�Q0�`F���3
f�x����hAl�3>��f\��f���f\�
	f܊	f��h6�`����`�[��`Ƶ��`ƭ��`F��k��(�Q0�`F���3
f�(�Q0�`F�����3
f�x�<���3�fl_�K��/�~��(�Q$�HF��"E2�d�(�Q$�HF���*i����&�Q$�㩏HƵ��H�ۨ�HƵ��Hƭ��HF���f�d\��d����d\�
�d܊�dɸ�xl��"E2�d�(�Q$�HF��"E2�d�(�q\$�HF�����(�Q$�H�`�2����?�@F��2
d�(�Q �@F��2
d�MId|� 6��O}2�]u2�F}2�E�2nE�2
d|4H ��UG ��G �ZTH �V�H �@�5�cd�(�Q �@F��2
d�(�Q �@F����2
d<�@F���2:���O�|j>��1v�c�%�����ߔ�Q,�XF��b�2�e�(�Q,�XF��boU�b-�M,�X��S��kW���Q��kQ!��[Q#��b�˸~��x+�˸˸5�(�q��b�2�e�(�Q,�XF��b�2�e�(�Q,���XF��bϟ'�Q,�X����ƼfM�?�t�������*�Q �@F��2
d�(�Q �@F��oS�-�M �@��S��kW���Q��kQ!��[Q#���ȸ~��x+�ȸȸ5�(�q���2
d�(�Q �@F��2
d�(�Q ���@F��ϟ'�Q �@�;'e�O��X�E�|���������q�b      j   Z   x��;� �}�1�����P�"����p��e�J����F'�p��&���E0�U}Աh�(We*>6[�&�)J�(0=9���v >QC      m   �  x�}�ݎ�H���]�r�_��@+Vb��}����s��-#.���N��c@��v��ߐ����O__���t;���r�ϟ/?��|��o�>�j�o����?^�ey����~��7}�us�W ���n���Ӗ��r���y��n� {/[Yv�̮[]v�o[[v�L�[_v�L�Xv�L��\v���}ۗ�zE�C�0QD:D
#E�C�0��t��L�e
3ML�)�41]�0��t��L�e
3M��d��4Ez�i2��I��LS�'�&3�L�i2��t�&3�L�i2��t�&3�L�i2��t�&3͑�e��4Gz�i6��Y��Ls�g�f3-L�i6��t�f3-L�i6��t�f3-L�i6��t�f3-�^dZ̴Dz�i1��E��LK��3�L�i1��t�3�L�i1��t�3�L�i1��t�3��^eZʹFz�i5��U��Lk�W�V3mL�i5��t�V3mL�i5��t�V3mL�i5��t�V3m��d�̴Ez�i3��M��L[�7�63�L�i3��t�63�L�i3��t�63�L�i3��t�63��e�ʹGz�i7��]��L{�w�v3L�i7��t�v3L�i7��t�v3L�i7��t�v3�>d:�tD�����H2f:"}�t��d�L��N��t��d�L��N��t��d�L��N��t���)�i�3ҧL���H�2����S�����x�N�ߙ/��O�;������u�s��	;�������L𸳠����'hoS���8A\x�zD�	��Ҩ�	��k���ťS�P�RN@]\Z8uq�U��ťWE���.�*�ԬpiVQ��j�K��nu+x�B���r��	���
�H��'���+$N ]/XH�@�ް�X����XPǂw,DɂJ�d!ZԲ�-�H�k2'���,dN ]/ZȜ@�޴�9�t�j!s�z�B�-�l���mAm޶u�[��[P߂�-N ]/\(�@�޸P8�t�r�p�z�B���҅�	��Q����]���.x�B/�x���yA�޼P9�t�z�r�z�B�����	����H��*'���/D�
����nڻ�A�^��ί)���r�N������/%�A����ǲn�w-���|U���x�jZt|>_u-<�h,�WC����jj���;\�V�9��XV�9'?�Ug�ُeՙs�cYu��XV�9��XV�9��XV��=X�,~i�n�������z�hP{��WD���<�Σ����}��տ/҈�dxOF��?]Ry���ǿ���������`     