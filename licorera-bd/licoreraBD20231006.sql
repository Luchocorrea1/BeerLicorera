PGDMP                  	    {            Licorera    16.0    16.0 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397    Licorera    DATABASE     �   CREATE DATABASE "Licorera" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Licorera";
                postgres    false            �            1259    16398    admin_permissions    TABLE     g  CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 %   DROP TABLE public.admin_permissions;
       public         heap    postgres    false            �            1259    16403    admin_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.admin_permissions_id_seq;
       public          postgres    false    215            �           0    0    admin_permissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;
          public          postgres    false    216            �            1259    16404    admin_permissions_role_links    TABLE     �   CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);
 0   DROP TABLE public.admin_permissions_role_links;
       public         heap    postgres    false            �            1259    16407 #   admin_permissions_role_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.admin_permissions_role_links_id_seq;
       public          postgres    false    217            �           0    0 #   admin_permissions_role_links_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;
          public          postgres    false    218            �            1259    16408    admin_roles    TABLE     ;  CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.admin_roles;
       public         heap    postgres    false            �            1259    16413    admin_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_roles_id_seq;
       public          postgres    false    219            �           0    0    admin_roles_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;
          public          postgres    false    220            �            1259    16414    admin_users    TABLE     B  CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.admin_users;
       public         heap    postgres    false            �            1259    16419    admin_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_users_id_seq;
       public          postgres    false    221            �           0    0    admin_users_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;
          public          postgres    false    222            �            1259    16420    admin_users_roles_links    TABLE     �   CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);
 +   DROP TABLE public.admin_users_roles_links;
       public         heap    postgres    false            �            1259    16423    admin_users_roles_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.admin_users_roles_links_id_seq;
       public          postgres    false    223            �           0    0    admin_users_roles_links_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;
          public          postgres    false    224                       1259    17042    clientes    TABLE     �  CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    correo character varying(255),
    telefono integer,
    direccion character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.clientes;
       public         heap    postgres    false                       1259    17041    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    280            �           0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    279            �            1259    16424    files    TABLE     �  CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.files;
       public         heap    postgres    false            �            1259    16429    files_folder_links    TABLE     �   CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);
 &   DROP TABLE public.files_folder_links;
       public         heap    postgres    false            �            1259    16432    files_folder_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.files_folder_links_id_seq;
       public          postgres    false    226            �           0    0    files_folder_links_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;
          public          postgres    false    227            �            1259    16433    files_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public          postgres    false    225            �           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public          postgres    false    228            �            1259    16434    files_related_morphs    TABLE     �   CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);
 (   DROP TABLE public.files_related_morphs;
       public         heap    postgres    false            �            1259    16439    files_related_morphs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.files_related_morphs_id_seq;
       public          postgres    false    229            �           0    0    files_related_morphs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;
          public          postgres    false    230            �            1259    16440    i18n_locale    TABLE       CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.i18n_locale;
       public         heap    postgres    false            �            1259    16445    i18n_locale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.i18n_locale_id_seq;
       public          postgres    false    231            �           0    0    i18n_locale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;
          public          postgres    false    232            �            1259    16446    menus    TABLE     m  CREATE TABLE public.menus (
    id integer NOT NULL,
    descripcion character varying(255),
    url character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    orden integer,
    padre_id integer
);
    DROP TABLE public.menus;
       public         heap    postgres    false            �            1259    16451    menus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.menus_id_seq;
       public          postgres    false    233            �           0    0    menus_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;
          public          postgres    false    234                       1259    17017 
   personales    TABLE       CREATE TABLE public.personales (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    cargo character varying(255),
    nombre character varying(255),
    apellido character varying(255),
    activo boolean
);
    DROP TABLE public.personales;
       public         heap    postgres    false                       1259    17016    personales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.personales_id_seq;
       public          postgres    false    278            �           0    0    personales_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.personales_id_seq OWNED BY public.personales.id;
          public          postgres    false    277            �            1259    16452 	   productos    TABLE     `  CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(255),
    fecha_creacion timestamp(6) without time zone,
    usuario_creacion character varying(255),
    maquina_creacion character varying(255),
    fecha_actualizacion timestamp(6) without time zone,
    usuario_actualizacion character varying(255),
    maquina_actualizacion character varying(255),
    activo boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    16457    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public          postgres    false    235            �           0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public          postgres    false    236                       1259    16959    productos_producto_links    TABLE     �   CREATE TABLE public.productos_producto_links (
    id integer NOT NULL,
    producto_id integer,
    venta_id integer,
    producto_order double precision
);
 ,   DROP TABLE public.productos_producto_links;
       public         heap    postgres    false                       1259    16958    productos_producto_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_producto_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.productos_producto_links_id_seq;
       public          postgres    false    274            �           0    0    productos_producto_links_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.productos_producto_links_id_seq OWNED BY public.productos_producto_links.id;
          public          postgres    false    273                       1259    17065    promocionproductos    TABLE     �  CREATE TABLE public.promocionproductos (
    id integer NOT NULL,
    nombre_productos character varying(255),
    descripcion character varying(255),
    descuento character varying(255),
    activo boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 &   DROP TABLE public.promocionproductos;
       public         heap    postgres    false                       1259    17064    promocionproductos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promocionproductos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.promocionproductos_id_seq;
       public          postgres    false    282            �           0    0    promocionproductos_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.promocionproductos_id_seq OWNED BY public.promocionproductos.id;
          public          postgres    false    281            �            1259    16458    strapi_api_token_permissions    TABLE       CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 0   DROP TABLE public.strapi_api_token_permissions;
       public         heap    postgres    false            �            1259    16461 #   strapi_api_token_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.strapi_api_token_permissions_id_seq;
       public          postgres    false    237            �           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;
          public          postgres    false    238            �            1259    16462 (   strapi_api_token_permissions_token_links    TABLE     �   CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);
 <   DROP TABLE public.strapi_api_token_permissions_token_links;
       public         heap    postgres    false            �            1259    16465 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.strapi_api_token_permissions_token_links_id_seq;
       public          postgres    false    239            �           0    0 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;
          public          postgres    false    240            �            1259    16466    strapi_api_tokens    TABLE     �  CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 %   DROP TABLE public.strapi_api_tokens;
       public         heap    postgres    false            �            1259    16471    strapi_api_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_api_tokens_id_seq;
       public          postgres    false    241            �           0    0    strapi_api_tokens_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;
          public          postgres    false    242            �            1259    16472    strapi_core_store_settings    TABLE     �   CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);
 .   DROP TABLE public.strapi_core_store_settings;
       public         heap    postgres    false            �            1259    16477 !   strapi_core_store_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_core_store_settings_id_seq;
       public          postgres    false    243            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;
          public          postgres    false    244            �            1259    16478    strapi_database_schema    TABLE     �   CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);
 *   DROP TABLE public.strapi_database_schema;
       public         heap    postgres    false            �            1259    16483    strapi_database_schema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_database_schema_id_seq;
       public          postgres    false    245            �           0    0    strapi_database_schema_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;
          public          postgres    false    246            �            1259    16484    strapi_migrations    TABLE     �   CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 %   DROP TABLE public.strapi_migrations;
       public         heap    postgres    false            �            1259    16487    strapi_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_migrations_id_seq;
       public          postgres    false    247            �           0    0    strapi_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;
          public          postgres    false    248            �            1259    16488 !   strapi_transfer_token_permissions    TABLE     
  CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 5   DROP TABLE public.strapi_transfer_token_permissions;
       public         heap    postgres    false            �            1259    16491 (   strapi_transfer_token_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.strapi_transfer_token_permissions_id_seq;
       public          postgres    false    249            �           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;
          public          postgres    false    250            �            1259    16492 -   strapi_transfer_token_permissions_token_links    TABLE     �   CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);
 A   DROP TABLE public.strapi_transfer_token_permissions_token_links;
       public         heap    postgres    false            �            1259    16495 4   strapi_transfer_token_permissions_token_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq;
       public          postgres    false    251            �           0    0 4   strapi_transfer_token_permissions_token_links_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;
          public          postgres    false    252            �            1259    16496    strapi_transfer_tokens    TABLE     �  CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 *   DROP TABLE public.strapi_transfer_tokens;
       public         heap    postgres    false            �            1259    16501    strapi_transfer_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_transfer_tokens_id_seq;
       public          postgres    false    253            �           0    0    strapi_transfer_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;
          public          postgres    false    254            �            1259    16502    strapi_webhooks    TABLE     �   CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);
 #   DROP TABLE public.strapi_webhooks;
       public         heap    postgres    false                        1259    16507    strapi_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_webhooks_id_seq;
       public          postgres    false    255            �           0    0    strapi_webhooks_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;
          public          postgres    false    256                       1259    16993    tipoproductos    TABLE     ;  CREATE TABLE public.tipoproductos (
    id integer NOT NULL,
    nombre character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    activo boolean
);
 !   DROP TABLE public.tipoproductos;
       public         heap    postgres    false                       1259    16992    tipoproductos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipoproductos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tipoproductos_id_seq;
       public          postgres    false    276            �           0    0    tipoproductos_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tipoproductos_id_seq OWNED BY public.tipoproductos.id;
          public          postgres    false    275                       1259    16508    up_permissions    TABLE     �   CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.up_permissions;
       public         heap    postgres    false                       1259    16511    up_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.up_permissions_id_seq;
       public          postgres    false    257            �           0    0    up_permissions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;
          public          postgres    false    258                       1259    16512    up_permissions_role_links    TABLE     �   CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);
 -   DROP TABLE public.up_permissions_role_links;
       public         heap    postgres    false                       1259    16515     up_permissions_role_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.up_permissions_role_links_id_seq;
       public          postgres    false    259            �           0    0     up_permissions_role_links_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;
          public          postgres    false    260                       1259    16516    up_roles    TABLE     8  CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.up_roles;
       public         heap    postgres    false                       1259    16521    up_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_roles_id_seq;
       public          postgres    false    261            �           0    0    up_roles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;
          public          postgres    false    262                       1259    16522    up_users    TABLE     �  CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.up_users;
       public         heap    postgres    false                       1259    16527    up_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_users_id_seq;
       public          postgres    false    263            �           0    0    up_users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;
          public          postgres    false    264            	           1259    16528    up_users_role_links    TABLE     �   CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);
 '   DROP TABLE public.up_users_role_links;
       public         heap    postgres    false            
           1259    16531    up_users_role_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.up_users_role_links_id_seq;
       public          postgres    false    265            �           0    0    up_users_role_links_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;
          public          postgres    false    266                       1259    16532    upload_folders    TABLE     +  CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.upload_folders;
       public         heap    postgres    false                       1259    16537    upload_folders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.upload_folders_id_seq;
       public          postgres    false    267            �           0    0    upload_folders_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;
          public          postgres    false    268                       1259    16538    upload_folders_parent_links    TABLE     �   CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);
 /   DROP TABLE public.upload_folders_parent_links;
       public         heap    postgres    false                       1259    16541 "   upload_folders_parent_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.upload_folders_parent_links_id_seq;
       public          postgres    false    269            �           0    0 "   upload_folders_parent_links_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;
          public          postgres    false    270                       1259    17088    venta_en_mesas    TABLE     �  CREATE TABLE public.venta_en_mesas (
    id integer NOT NULL,
    producto character varying(255),
    numero_mesa bigint,
    persona_aatendio character varying(255),
    precio_producto character varying(255),
    cantidad bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.venta_en_mesas;
       public         heap    postgres    false                       1259    17087    venta_en_mesas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.venta_en_mesas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.venta_en_mesas_id_seq;
       public          postgres    false    284            �           0    0    venta_en_mesas_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.venta_en_mesas_id_seq OWNED BY public.venta_en_mesas.id;
          public          postgres    false    283                       1259    16950    ventas    TABLE     ?  CREATE TABLE public.ventas (
    id integer NOT NULL,
    descripcion character varying(255),
    precio numeric(10,2),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.ventas;
       public         heap    postgres    false                       1259    16949    ventas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ventas_id_seq;
       public          postgres    false    272            �           0    0    ventas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;
          public          postgres    false    271            �           2604    16542    admin_permissions id    DEFAULT     |   ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);
 C   ALTER TABLE public.admin_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16543    admin_permissions_role_links id    DEFAULT     �   ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);
 N   ALTER TABLE public.admin_permissions_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16544    admin_roles id    DEFAULT     p   ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);
 =   ALTER TABLE public.admin_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    16545    admin_users id    DEFAULT     p   ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);
 =   ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    16546    admin_users_roles_links id    DEFAULT     �   ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);
 I   ALTER TABLE public.admin_users_roles_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    17045    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    279    280    280            �           2604    16547    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    225            �           2604    16548    files_folder_links id    DEFAULT     ~   ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);
 D   ALTER TABLE public.files_folder_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            �           2604    16549    files_related_morphs id    DEFAULT     �   ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);
 F   ALTER TABLE public.files_related_morphs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    16550    i18n_locale id    DEFAULT     p   ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);
 =   ALTER TABLE public.i18n_locale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231            �           2604    16551    menus id    DEFAULT     d   ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);
 7   ALTER TABLE public.menus ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233            �           2604    17020    personales id    DEFAULT     n   ALTER TABLE ONLY public.personales ALTER COLUMN id SET DEFAULT nextval('public.personales_id_seq'::regclass);
 <   ALTER TABLE public.personales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    277    278            �           2604    16552    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235            �           2604    16962    productos_producto_links id    DEFAULT     �   ALTER TABLE ONLY public.productos_producto_links ALTER COLUMN id SET DEFAULT nextval('public.productos_producto_links_id_seq'::regclass);
 J   ALTER TABLE public.productos_producto_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    274    274            �           2604    17068    promocionproductos id    DEFAULT     ~   ALTER TABLE ONLY public.promocionproductos ALTER COLUMN id SET DEFAULT nextval('public.promocionproductos_id_seq'::regclass);
 D   ALTER TABLE public.promocionproductos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    281    282    282            �           2604    16553    strapi_api_token_permissions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);
 N   ALTER TABLE public.strapi_api_token_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237            �           2604    16554 +   strapi_api_token_permissions_token_links id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);
 Z   ALTER TABLE public.strapi_api_token_permissions_token_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239            �           2604    16555    strapi_api_tokens id    DEFAULT     |   ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);
 C   ALTER TABLE public.strapi_api_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241            �           2604    16556    strapi_core_store_settings id    DEFAULT     �   ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);
 L   ALTER TABLE public.strapi_core_store_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243            �           2604    16557    strapi_database_schema id    DEFAULT     �   ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);
 H   ALTER TABLE public.strapi_database_schema ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245            �           2604    16558    strapi_migrations id    DEFAULT     |   ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);
 C   ALTER TABLE public.strapi_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247            �           2604    16559 $   strapi_transfer_token_permissions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);
 S   ALTER TABLE public.strapi_transfer_token_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249            �           2604    16560 0   strapi_transfer_token_permissions_token_links id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);
 _   ALTER TABLE public.strapi_transfer_token_permissions_token_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251            �           2604    16561    strapi_transfer_tokens id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);
 H   ALTER TABLE public.strapi_transfer_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253            �           2604    16562    strapi_webhooks id    DEFAULT     x   ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);
 A   ALTER TABLE public.strapi_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255            �           2604    16996    tipoproductos id    DEFAULT     t   ALTER TABLE ONLY public.tipoproductos ALTER COLUMN id SET DEFAULT nextval('public.tipoproductos_id_seq'::regclass);
 ?   ALTER TABLE public.tipoproductos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    275    276            �           2604    16563    up_permissions id    DEFAULT     v   ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);
 @   ALTER TABLE public.up_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257            �           2604    16564    up_permissions_role_links id    DEFAULT     �   ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);
 K   ALTER TABLE public.up_permissions_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259            �           2604    16565    up_roles id    DEFAULT     j   ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);
 :   ALTER TABLE public.up_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261            �           2604    16566    up_users id    DEFAULT     j   ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);
 :   ALTER TABLE public.up_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263            �           2604    16567    up_users_role_links id    DEFAULT     �   ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);
 E   ALTER TABLE public.up_users_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    266    265            �           2604    16568    upload_folders id    DEFAULT     v   ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);
 @   ALTER TABLE public.upload_folders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267            �           2604    16569    upload_folders_parent_links id    DEFAULT     �   ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);
 M   ALTER TABLE public.upload_folders_parent_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    270    269            �           2604    17091    venta_en_mesas id    DEFAULT     v   ALTER TABLE ONLY public.venta_en_mesas ALTER COLUMN id SET DEFAULT nextval('public.venta_en_mesas_id_seq'::regclass);
 @   ALTER TABLE public.venta_en_mesas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    283    284    284            �           2604    16953 	   ventas id    DEFAULT     f   ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);
 8   ALTER TABLE public.ventas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    272    272            ^          0    16398    admin_permissions 
   TABLE DATA           �   COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    215   �$      `          0    16404    admin_permissions_role_links 
   TABLE DATA           d   COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
    public          postgres    false    217   �,      b          0    16408    admin_roles 
   TABLE DATA           x   COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    219   */      d          0    16414    admin_users 
   TABLE DATA           �   COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    221   	0      f          0    16420    admin_users_roles_links 
   TABLE DATA           _   COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
    public          postgres    false    223   �0      �          0    17042    clientes 
   TABLE DATA           �   COPY public.clientes (id, nombre, apellido, correo, telefono, direccion, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    280   �0      h          0    16424    files 
   TABLE DATA           �   COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    225   �0      i          0    16429    files_folder_links 
   TABLE DATA           P   COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
    public          postgres    false    226   1      l          0    16434    files_related_morphs 
   TABLE DATA           e   COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
    public          postgres    false    229    1      n          0    16440    i18n_locale 
   TABLE DATA           k   COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    231   =1      p          0    16446    menus 
   TABLE DATA           �   COPY public.menus (id, descripcion, url, created_at, updated_at, published_at, created_by_id, updated_by_id, orden, padre_id) FROM stdin;
    public          postgres    false    233   �1      �          0    17017 
   personales 
   TABLE DATA           �   COPY public.personales (id, created_at, updated_at, published_at, created_by_id, updated_by_id, cargo, nombre, apellido, activo) FROM stdin;
    public          postgres    false    278   G2      r          0    16452 	   productos 
   TABLE DATA           �   COPY public.productos (id, nombre, fecha_creacion, usuario_creacion, maquina_creacion, fecha_actualizacion, usuario_actualizacion, maquina_actualizacion, activo, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    235   d2      �          0    16959    productos_producto_links 
   TABLE DATA           ]   COPY public.productos_producto_links (id, producto_id, venta_id, producto_order) FROM stdin;
    public          postgres    false    274   �2      �          0    17065    promocionproductos 
   TABLE DATA           �   COPY public.promocionproductos (id, nombre_productos, descripcion, descuento, activo, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    282   �2      t          0    16458    strapi_api_token_permissions 
   TABLE DATA           x   COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    237   3      v          0    16462 (   strapi_api_token_permissions_token_links 
   TABLE DATA           �   COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
    public          postgres    false    239   %3      x          0    16466    strapi_api_tokens 
   TABLE DATA           �   COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    241   B3      z          0    16472    strapi_core_store_settings 
   TABLE DATA           \   COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
    public          postgres    false    243   _3      |          0    16478    strapi_database_schema 
   TABLE DATA           J   COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
    public          postgres    false    245   %O      ~          0    16484    strapi_migrations 
   TABLE DATA           =   COPY public.strapi_migrations (id, name, "time") FROM stdin;
    public          postgres    false    247   'Y      �          0    16488 !   strapi_transfer_token_permissions 
   TABLE DATA           }   COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    249   DY      �          0    16492 -   strapi_transfer_token_permissions_token_links 
   TABLE DATA           �   COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
    public          postgres    false    251   aY      �          0    16496    strapi_transfer_tokens 
   TABLE DATA           �   COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    253   ~Y      �          0    16502    strapi_webhooks 
   TABLE DATA           R   COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
    public          postgres    false    255   �Y      �          0    16993    tipoproductos 
   TABLE DATA              COPY public.tipoproductos (id, nombre, created_at, updated_at, published_at, created_by_id, updated_by_id, activo) FROM stdin;
    public          postgres    false    276   �Y      �          0    16508    up_permissions 
   TABLE DATA           j   COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    257   +Z      �          0    16512    up_permissions_role_links 
   TABLE DATA           a   COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
    public          postgres    false    259   W[      �          0    16516    up_roles 
   TABLE DATA           u   COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    261   �[      �          0    16522    up_users 
   TABLE DATA           �   COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    263   J\      �          0    16528    up_users_role_links 
   TABLE DATA           O   COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
    public          postgres    false    265   �\      �          0    16532    upload_folders 
   TABLE DATA           w   COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    267   ]      �          0    16538    upload_folders_parent_links 
   TABLE DATA           a   COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
    public          postgres    false    269   5]      �          0    17088    venta_en_mesas 
   TABLE DATA           �   COPY public.venta_en_mesas (id, producto, numero_mesa, persona_aatendio, precio_producto, cantidad, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    284   R]      �          0    16950    ventas 
   TABLE DATA           }   COPY public.ventas (id, descripcion, precio, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    272   o]      �           0    0    admin_permissions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.admin_permissions_id_seq', 147, true);
          public          postgres    false    216            �           0    0 #   admin_permissions_role_links_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 147, true);
          public          postgres    false    218            �           0    0    admin_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);
          public          postgres    false    220            �           0    0    admin_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);
          public          postgres    false    222            �           0    0    admin_users_roles_links_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);
          public          postgres    false    224            �           0    0    clientes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);
          public          postgres    false    279            �           0    0    files_folder_links_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);
          public          postgres    false    227            �           0    0    files_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.files_id_seq', 1, false);
          public          postgres    false    228            �           0    0    files_related_morphs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 1, false);
          public          postgres    false    230            �           0    0    i18n_locale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);
          public          postgres    false    232            �           0    0    menus_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.menus_id_seq', 4, true);
          public          postgres    false    234            �           0    0    personales_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.personales_id_seq', 1, false);
          public          postgres    false    277            �           0    0    productos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.productos_id_seq', 1, true);
          public          postgres    false    236            �           0    0    productos_producto_links_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.productos_producto_links_id_seq', 1, true);
          public          postgres    false    273            �           0    0    promocionproductos_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.promocionproductos_id_seq', 1, false);
          public          postgres    false    281            �           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);
          public          postgres    false    238            �           0    0 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);
          public          postgres    false    240            �           0    0    strapi_api_tokens_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, true);
          public          postgres    false    242            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 32, true);
          public          postgres    false    244            �           0    0    strapi_database_schema_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 21, true);
          public          postgres    false    246            �           0    0    strapi_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);
          public          postgres    false    248            �           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);
          public          postgres    false    250            �           0    0 4   strapi_transfer_token_permissions_token_links_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);
          public          postgres    false    252            �           0    0    strapi_transfer_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);
          public          postgres    false    254            �           0    0    strapi_webhooks_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);
          public          postgres    false    256            �           0    0    tipoproductos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tipoproductos_id_seq', 2, true);
          public          postgres    false    275            �           0    0    up_permissions_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.up_permissions_id_seq', 15, true);
          public          postgres    false    258            �           0    0     up_permissions_role_links_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 15, true);
          public          postgres    false    260            �           0    0    up_roles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);
          public          postgres    false    262            �           0    0    up_users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.up_users_id_seq', 1, true);
          public          postgres    false    264            �           0    0    up_users_role_links_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 2, true);
          public          postgres    false    266            �           0    0    upload_folders_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);
          public          postgres    false    268            �           0    0 "   upload_folders_parent_links_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);
          public          postgres    false    270            �           0    0    venta_en_mesas_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.venta_en_mesas_id_seq', 1, false);
          public          postgres    false    283            �           0    0    ventas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.ventas_id_seq', 1, true);
          public          postgres    false    271            �           2606    16573 (   admin_permissions admin_permissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_pkey;
       public            postgres    false    215            �           2606    16575 >   admin_permissions_role_links admin_permissions_role_links_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_pkey;
       public            postgres    false    217            �           2606    16577 @   admin_permissions_role_links admin_permissions_role_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);
 j   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_unique;
       public            postgres    false    217    217            �           2606    16579    admin_roles admin_roles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_pkey;
       public            postgres    false    219            �           2606    16581    admin_users admin_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
       public            postgres    false    221            �           2606    16583 4   admin_users_roles_links admin_users_roles_links_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_pkey;
       public            postgres    false    223                       2606    16585 6   admin_users_roles_links admin_users_roles_links_unique 
   CONSTRAINT     }   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);
 `   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_unique;
       public            postgres    false    223    223            �           2606    17049    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    280                       2606    16587 *   files_folder_links files_folder_links_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_pkey;
       public            postgres    false    226                       2606    16589 ,   files_folder_links files_folder_links_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);
 V   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_unique;
       public            postgres    false    226    226                       2606    16591    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    225                       2606    16593 .   files_related_morphs files_related_morphs_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.files_related_morphs DROP CONSTRAINT files_related_morphs_pkey;
       public            postgres    false    229                       2606    16595    i18n_locale i18n_locale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_pkey;
       public            postgres    false    231                       2606    16597    menus menus_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_pkey;
       public            postgres    false    233            �           2606    17022    personales personales_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.personales
    ADD CONSTRAINT personales_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.personales DROP CONSTRAINT personales_pkey;
       public            postgres    false    278            "           2606    16599    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    235            {           2606    16964 6   productos_producto_links productos_producto_links_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.productos_producto_links
    ADD CONSTRAINT productos_producto_links_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.productos_producto_links DROP CONSTRAINT productos_producto_links_pkey;
       public            postgres    false    274            }           2606    16968 8   productos_producto_links productos_producto_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.productos_producto_links
    ADD CONSTRAINT productos_producto_links_unique UNIQUE (producto_id, venta_id);
 b   ALTER TABLE ONLY public.productos_producto_links DROP CONSTRAINT productos_producto_links_unique;
       public            postgres    false    274    274            �           2606    17072 *   promocionproductos promocionproductos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.promocionproductos
    ADD CONSTRAINT promocionproductos_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.promocionproductos DROP CONSTRAINT promocionproductos_pkey;
       public            postgres    false    282            &           2606    16601 >   strapi_api_token_permissions strapi_api_token_permissions_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_pkey;
       public            postgres    false    237            ,           2606    16603 V   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_pkey;
       public            postgres    false    239            .           2606    16605 X   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);
 �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_unique;
       public            postgres    false    239    239            1           2606    16607 (   strapi_api_tokens strapi_api_tokens_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_pkey;
       public            postgres    false    241            4           2606    16609 :   strapi_core_store_settings strapi_core_store_settings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_core_store_settings DROP CONSTRAINT strapi_core_store_settings_pkey;
       public            postgres    false    243            6           2606    16611 2   strapi_database_schema strapi_database_schema_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_database_schema DROP CONSTRAINT strapi_database_schema_pkey;
       public            postgres    false    245            8           2606    16613 (   strapi_migrations strapi_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_migrations DROP CONSTRAINT strapi_migrations_pkey;
       public            postgres    false    247            ;           2606    16615 H   strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_pkey;
       public            postgres    false    249            A           2606    16617 `   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_pkey;
       public            postgres    false    251            C           2606    16619 b   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_unique;
       public            postgres    false    251    251            F           2606    16621 2   strapi_transfer_tokens strapi_transfer_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_pkey;
       public            postgres    false    253            I           2606    16623 $   strapi_webhooks strapi_webhooks_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_webhooks DROP CONSTRAINT strapi_webhooks_pkey;
       public            postgres    false    255            �           2606    16998     tipoproductos tipoproductos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tipoproductos
    ADD CONSTRAINT tipoproductos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tipoproductos DROP CONSTRAINT tipoproductos_pkey;
       public            postgres    false    276            L           2606    16625 "   up_permissions up_permissions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_pkey;
       public            postgres    false    257            R           2606    16627 8   up_permissions_role_links up_permissions_role_links_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_pkey;
       public            postgres    false    259            T           2606    16629 :   up_permissions_role_links up_permissions_role_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);
 d   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_unique;
       public            postgres    false    259    259            W           2606    16631    up_roles up_roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_pkey;
       public            postgres    false    261            [           2606    16633    up_users up_users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_pkey;
       public            postgres    false    263            a           2606    16635 ,   up_users_role_links up_users_role_links_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_pkey;
       public            postgres    false    265            c           2606    16637 .   up_users_role_links up_users_role_links_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);
 X   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_unique;
       public            postgres    false    265    265            p           2606    16639 <   upload_folders_parent_links upload_folders_parent_links_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_pkey;
       public            postgres    false    269            r           2606    16641 >   upload_folders_parent_links upload_folders_parent_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);
 h   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_unique;
       public            postgres    false    269    269            f           2606    16643 +   upload_folders upload_folders_path_id_index 
   CONSTRAINT     i   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);
 U   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_id_index;
       public            postgres    false    267            h           2606    16645 (   upload_folders upload_folders_path_index 
   CONSTRAINT     c   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);
 R   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_index;
       public            postgres    false    267            j           2606    16647 "   upload_folders upload_folders_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_pkey;
       public            postgres    false    267            �           2606    17095 "   venta_en_mesas venta_en_mesas_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.venta_en_mesas
    ADD CONSTRAINT venta_en_mesas_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.venta_en_mesas DROP CONSTRAINT venta_en_mesas_pkey;
       public            postgres    false    284            u           2606    16955    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    272            �           1259    16648 "   admin_permissions_created_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);
 6   DROP INDEX public.admin_permissions_created_by_id_fk;
       public            postgres    false    215            �           1259    16649    admin_permissions_role_links_fk    INDEX     q   CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);
 3   DROP INDEX public.admin_permissions_role_links_fk;
       public            postgres    false    217            �           1259    16650 #   admin_permissions_role_links_inv_fk    INDEX     o   CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);
 7   DROP INDEX public.admin_permissions_role_links_inv_fk;
       public            postgres    false    217            �           1259    16651 )   admin_permissions_role_links_order_inv_fk    INDEX     ~   CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);
 =   DROP INDEX public.admin_permissions_role_links_order_inv_fk;
       public            postgres    false    217            �           1259    16652 "   admin_permissions_updated_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);
 6   DROP INDEX public.admin_permissions_updated_by_id_fk;
       public            postgres    false    215            �           1259    16653    admin_roles_created_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);
 0   DROP INDEX public.admin_roles_created_by_id_fk;
       public            postgres    false    219            �           1259    16654    admin_roles_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);
 0   DROP INDEX public.admin_roles_updated_by_id_fk;
       public            postgres    false    219            �           1259    16655    admin_users_created_by_id_fk    INDEX     ]   CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);
 0   DROP INDEX public.admin_users_created_by_id_fk;
       public            postgres    false    221            �           1259    16656    admin_users_roles_links_fk    INDEX     a   CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);
 .   DROP INDEX public.admin_users_roles_links_fk;
       public            postgres    false    223            �           1259    16657    admin_users_roles_links_inv_fk    INDEX     e   CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);
 2   DROP INDEX public.admin_users_roles_links_inv_fk;
       public            postgres    false    223            �           1259    16658     admin_users_roles_links_order_fk    INDEX     j   CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);
 4   DROP INDEX public.admin_users_roles_links_order_fk;
       public            postgres    false    223            �           1259    16659 $   admin_users_roles_links_order_inv_fk    INDEX     n   CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);
 8   DROP INDEX public.admin_users_roles_links_order_inv_fk;
       public            postgres    false    223            �           1259    16660    admin_users_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);
 0   DROP INDEX public.admin_users_updated_by_id_fk;
       public            postgres    false    221            �           1259    17050    clientes_created_by_id_fk    INDEX     W   CREATE INDEX clientes_created_by_id_fk ON public.clientes USING btree (created_by_id);
 -   DROP INDEX public.clientes_created_by_id_fk;
       public            postgres    false    280            �           1259    17051    clientes_updated_by_id_fk    INDEX     W   CREATE INDEX clientes_updated_by_id_fk ON public.clientes USING btree (updated_by_id);
 -   DROP INDEX public.clientes_updated_by_id_fk;
       public            postgres    false    280                       1259    16661    files_created_by_id_fk    INDEX     Q   CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);
 *   DROP INDEX public.files_created_by_id_fk;
       public            postgres    false    225                       1259    16662    files_folder_links_fk    INDEX     W   CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);
 )   DROP INDEX public.files_folder_links_fk;
       public            postgres    false    226                       1259    16663    files_folder_links_inv_fk    INDEX     ]   CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);
 -   DROP INDEX public.files_folder_links_inv_fk;
       public            postgres    false    226                       1259    16664    files_folder_links_order_inv_fk    INDEX     d   CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);
 3   DROP INDEX public.files_folder_links_order_inv_fk;
       public            postgres    false    226                       1259    16665    files_related_morphs_fk    INDEX     [   CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);
 +   DROP INDEX public.files_related_morphs_fk;
       public            postgres    false    229                       1259    16666 $   files_related_morphs_id_column_index    INDEX     k   CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);
 8   DROP INDEX public.files_related_morphs_id_column_index;
       public            postgres    false    229                       1259    16667     files_related_morphs_order_index    INDEX     d   CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");
 4   DROP INDEX public.files_related_morphs_order_index;
       public            postgres    false    229                       1259    16668    files_updated_by_id_fk    INDEX     Q   CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);
 *   DROP INDEX public.files_updated_by_id_fk;
       public            postgres    false    225                       1259    16669    i18n_locale_created_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);
 0   DROP INDEX public.i18n_locale_created_by_id_fk;
       public            postgres    false    231                       1259    16670    i18n_locale_updated_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);
 0   DROP INDEX public.i18n_locale_updated_by_id_fk;
       public            postgres    false    231                       1259    16671    menus_created_by_id_fk    INDEX     Q   CREATE INDEX menus_created_by_id_fk ON public.menus USING btree (created_by_id);
 *   DROP INDEX public.menus_created_by_id_fk;
       public            postgres    false    233                       1259    16672    menus_updated_by_id_fk    INDEX     Q   CREATE INDEX menus_updated_by_id_fk ON public.menus USING btree (updated_by_id);
 *   DROP INDEX public.menus_updated_by_id_fk;
       public            postgres    false    233            �           1259    17023    personales_created_by_id_fk    INDEX     [   CREATE INDEX personales_created_by_id_fk ON public.personales USING btree (created_by_id);
 /   DROP INDEX public.personales_created_by_id_fk;
       public            postgres    false    278            �           1259    17024    personales_updated_by_id_fk    INDEX     [   CREATE INDEX personales_updated_by_id_fk ON public.personales USING btree (updated_by_id);
 /   DROP INDEX public.personales_updated_by_id_fk;
       public            postgres    false    278                        1259    16673    productos_created_by_id_fk    INDEX     Y   CREATE INDEX productos_created_by_id_fk ON public.productos USING btree (created_by_id);
 .   DROP INDEX public.productos_created_by_id_fk;
       public            postgres    false    235            w           1259    16965    productos_producto_links_fk    INDEX     g   CREATE INDEX productos_producto_links_fk ON public.productos_producto_links USING btree (producto_id);
 /   DROP INDEX public.productos_producto_links_fk;
       public            postgres    false    274            x           1259    16966    productos_producto_links_inv_fk    INDEX     h   CREATE INDEX productos_producto_links_inv_fk ON public.productos_producto_links USING btree (venta_id);
 3   DROP INDEX public.productos_producto_links_inv_fk;
       public            postgres    false    274            y           1259    16969 %   productos_producto_links_order_inv_fk    INDEX     t   CREATE INDEX productos_producto_links_order_inv_fk ON public.productos_producto_links USING btree (producto_order);
 9   DROP INDEX public.productos_producto_links_order_inv_fk;
       public            postgres    false    274            #           1259    16674    productos_updated_by_id_fk    INDEX     Y   CREATE INDEX productos_updated_by_id_fk ON public.productos USING btree (updated_by_id);
 .   DROP INDEX public.productos_updated_by_id_fk;
       public            postgres    false    235            �           1259    17073 #   promocionproductos_created_by_id_fk    INDEX     k   CREATE INDEX promocionproductos_created_by_id_fk ON public.promocionproductos USING btree (created_by_id);
 7   DROP INDEX public.promocionproductos_created_by_id_fk;
       public            postgres    false    282            �           1259    17074 #   promocionproductos_updated_by_id_fk    INDEX     k   CREATE INDEX promocionproductos_updated_by_id_fk ON public.promocionproductos USING btree (updated_by_id);
 7   DROP INDEX public.promocionproductos_updated_by_id_fk;
       public            postgres    false    282            $           1259    16675 -   strapi_api_token_permissions_created_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_created_by_id_fk;
       public            postgres    false    237            (           1259    16676 +   strapi_api_token_permissions_token_links_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);
 ?   DROP INDEX public.strapi_api_token_permissions_token_links_fk;
       public            postgres    false    239            )           1259    16677 /   strapi_api_token_permissions_token_links_inv_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);
 C   DROP INDEX public.strapi_api_token_permissions_token_links_inv_fk;
       public            postgres    false    239            *           1259    16678 5   strapi_api_token_permissions_token_links_order_inv_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);
 I   DROP INDEX public.strapi_api_token_permissions_token_links_order_inv_fk;
       public            postgres    false    239            '           1259    16679 -   strapi_api_token_permissions_updated_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_updated_by_id_fk;
       public            postgres    false    237            /           1259    16680 "   strapi_api_tokens_created_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);
 6   DROP INDEX public.strapi_api_tokens_created_by_id_fk;
       public            postgres    false    241            2           1259    16681 "   strapi_api_tokens_updated_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);
 6   DROP INDEX public.strapi_api_tokens_updated_by_id_fk;
       public            postgres    false    241            9           1259    16682 2   strapi_transfer_token_permissions_created_by_id_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_created_by_id_fk;
       public            postgres    false    249            =           1259    16683 0   strapi_transfer_token_permissions_token_links_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);
 D   DROP INDEX public.strapi_transfer_token_permissions_token_links_fk;
       public            postgres    false    251            >           1259    16684 4   strapi_transfer_token_permissions_token_links_inv_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);
 H   DROP INDEX public.strapi_transfer_token_permissions_token_links_inv_fk;
       public            postgres    false    251            ?           1259    16685 :   strapi_transfer_token_permissions_token_links_order_inv_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);
 N   DROP INDEX public.strapi_transfer_token_permissions_token_links_order_inv_fk;
       public            postgres    false    251            <           1259    16686 2   strapi_transfer_token_permissions_updated_by_id_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_updated_by_id_fk;
       public            postgres    false    249            D           1259    16687 '   strapi_transfer_tokens_created_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_created_by_id_fk;
       public            postgres    false    253            G           1259    16688 '   strapi_transfer_tokens_updated_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_updated_by_id_fk;
       public            postgres    false    253            ~           1259    16999    tipoproductos_created_by_id_fk    INDEX     a   CREATE INDEX tipoproductos_created_by_id_fk ON public.tipoproductos USING btree (created_by_id);
 2   DROP INDEX public.tipoproductos_created_by_id_fk;
       public            postgres    false    276            �           1259    17000    tipoproductos_updated_by_id_fk    INDEX     a   CREATE INDEX tipoproductos_updated_by_id_fk ON public.tipoproductos USING btree (updated_by_id);
 2   DROP INDEX public.tipoproductos_updated_by_id_fk;
       public            postgres    false    276            J           1259    16689    up_permissions_created_by_id_fk    INDEX     c   CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);
 3   DROP INDEX public.up_permissions_created_by_id_fk;
       public            postgres    false    257            N           1259    16690    up_permissions_role_links_fk    INDEX     k   CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);
 0   DROP INDEX public.up_permissions_role_links_fk;
       public            postgres    false    259            O           1259    16691     up_permissions_role_links_inv_fk    INDEX     i   CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);
 4   DROP INDEX public.up_permissions_role_links_inv_fk;
       public            postgres    false    259            P           1259    16692 &   up_permissions_role_links_order_inv_fk    INDEX     x   CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);
 :   DROP INDEX public.up_permissions_role_links_order_inv_fk;
       public            postgres    false    259            M           1259    16693    up_permissions_updated_by_id_fk    INDEX     c   CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);
 3   DROP INDEX public.up_permissions_updated_by_id_fk;
       public            postgres    false    257            U           1259    16694    up_roles_created_by_id_fk    INDEX     W   CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);
 -   DROP INDEX public.up_roles_created_by_id_fk;
       public            postgres    false    261            X           1259    16695    up_roles_updated_by_id_fk    INDEX     W   CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);
 -   DROP INDEX public.up_roles_updated_by_id_fk;
       public            postgres    false    261            Y           1259    16696    up_users_created_by_id_fk    INDEX     W   CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);
 -   DROP INDEX public.up_users_created_by_id_fk;
       public            postgres    false    263            ]           1259    16697    up_users_role_links_fk    INDEX     Y   CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);
 *   DROP INDEX public.up_users_role_links_fk;
       public            postgres    false    265            ^           1259    16698    up_users_role_links_inv_fk    INDEX     ]   CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);
 .   DROP INDEX public.up_users_role_links_inv_fk;
       public            postgres    false    265            _           1259    16699     up_users_role_links_order_inv_fk    INDEX     f   CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);
 4   DROP INDEX public.up_users_role_links_order_inv_fk;
       public            postgres    false    265            \           1259    16700    up_users_updated_by_id_fk    INDEX     W   CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);
 -   DROP INDEX public.up_users_updated_by_id_fk;
       public            postgres    false    263                       1259    16701    upload_files_created_at_index    INDEX     U   CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);
 1   DROP INDEX public.upload_files_created_at_index;
       public            postgres    false    225                       1259    16702    upload_files_ext_index    INDEX     G   CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);
 *   DROP INDEX public.upload_files_ext_index;
       public            postgres    false    225                       1259    16703    upload_files_folder_path_index    INDEX     W   CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);
 2   DROP INDEX public.upload_files_folder_path_index;
       public            postgres    false    225            	           1259    16704    upload_files_name_index    INDEX     I   CREATE INDEX upload_files_name_index ON public.files USING btree (name);
 +   DROP INDEX public.upload_files_name_index;
       public            postgres    false    225            
           1259    16705    upload_files_size_index    INDEX     I   CREATE INDEX upload_files_size_index ON public.files USING btree (size);
 +   DROP INDEX public.upload_files_size_index;
       public            postgres    false    225                       1259    16706    upload_files_updated_at_index    INDEX     U   CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);
 1   DROP INDEX public.upload_files_updated_at_index;
       public            postgres    false    225            d           1259    16707    upload_folders_created_by_id_fk    INDEX     c   CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);
 3   DROP INDEX public.upload_folders_created_by_id_fk;
       public            postgres    false    267            l           1259    16708    upload_folders_parent_links_fk    INDEX     k   CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);
 2   DROP INDEX public.upload_folders_parent_links_fk;
       public            postgres    false    269            m           1259    16709 "   upload_folders_parent_links_inv_fk    INDEX     s   CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);
 6   DROP INDEX public.upload_folders_parent_links_inv_fk;
       public            postgres    false    269            n           1259    16710 (   upload_folders_parent_links_order_inv_fk    INDEX     x   CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);
 <   DROP INDEX public.upload_folders_parent_links_order_inv_fk;
       public            postgres    false    269            k           1259    16711    upload_folders_updated_by_id_fk    INDEX     c   CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);
 3   DROP INDEX public.upload_folders_updated_by_id_fk;
       public            postgres    false    267            �           1259    17096    venta_en_mesas_created_by_id_fk    INDEX     c   CREATE INDEX venta_en_mesas_created_by_id_fk ON public.venta_en_mesas USING btree (created_by_id);
 3   DROP INDEX public.venta_en_mesas_created_by_id_fk;
       public            postgres    false    284            �           1259    17097    venta_en_mesas_updated_by_id_fk    INDEX     c   CREATE INDEX venta_en_mesas_updated_by_id_fk ON public.venta_en_mesas USING btree (updated_by_id);
 3   DROP INDEX public.venta_en_mesas_updated_by_id_fk;
       public            postgres    false    284            s           1259    16956    ventas_created_by_id_fk    INDEX     S   CREATE INDEX ventas_created_by_id_fk ON public.ventas USING btree (created_by_id);
 +   DROP INDEX public.ventas_created_by_id_fk;
       public            postgres    false    272            v           1259    16957    ventas_updated_by_id_fk    INDEX     S   CREATE INDEX ventas_updated_by_id_fk ON public.ventas USING btree (updated_by_id);
 +   DROP INDEX public.ventas_updated_by_id_fk;
       public            postgres    false    272            �           2606    16712 4   admin_permissions admin_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_created_by_id_fk;
       public          postgres    false    215    4856    221            �           2606    16717 <   admin_permissions_role_links admin_permissions_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_fk;
       public          postgres    false    217    215    4841            �           2606    16722 @   admin_permissions_role_links admin_permissions_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_inv_fk;
       public          postgres    false    217    219    4852            �           2606    16727 4   admin_permissions admin_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_updated_by_id_fk;
       public          postgres    false    215    221    4856            �           2606    16732 (   admin_roles admin_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_created_by_id_fk;
       public          postgres    false    4856    221    219            �           2606    16737 (   admin_roles admin_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_updated_by_id_fk;
       public          postgres    false    4856    221    219            �           2606    16742 (   admin_users admin_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_created_by_id_fk;
       public          postgres    false    221    221    4856            �           2606    16747 2   admin_users_roles_links admin_users_roles_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_fk;
       public          postgres    false    223    4856    221            �           2606    16752 6   admin_users_roles_links admin_users_roles_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_inv_fk;
       public          postgres    false    4852    219    223            �           2606    16757 (   admin_users admin_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_updated_by_id_fk;
       public          postgres    false    4856    221    221            �           2606    17052 "   clientes clientes_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_created_by_id_fk;
       public          postgres    false    280    4856    221            �           2606    17057 "   clientes clientes_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_updated_by_id_fk;
       public          postgres    false    280    221    4856            �           2606    16762    files files_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_created_by_id_fk;
       public          postgres    false    225    221    4856            �           2606    16767 (   files_folder_links files_folder_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_fk;
       public          postgres    false    225    4868    226            �           2606    16772 ,   files_folder_links files_folder_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_inv_fk;
       public          postgres    false    226    4970    267            �           2606    16777 ,   files_related_morphs files_related_morphs_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.files_related_morphs DROP CONSTRAINT files_related_morphs_fk;
       public          postgres    false    229    225    4868            �           2606    16782    files files_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_updated_by_id_fk;
       public          postgres    false    4856    225    221            �           2606    16787 (   i18n_locale i18n_locale_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_created_by_id_fk;
       public          postgres    false    231    221    4856            �           2606    16792 (   i18n_locale i18n_locale_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_updated_by_id_fk;
       public          postgres    false    231    221    4856            �           2606    16797    menus menus_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_created_by_id_fk;
       public          postgres    false    233    221    4856            �           2606    16802    menus menus_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_updated_by_id_fk;
       public          postgres    false    4856    233    221            �           2606    17025 &   personales personales_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.personales
    ADD CONSTRAINT personales_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.personales DROP CONSTRAINT personales_created_by_id_fk;
       public          postgres    false    4856    221    278            �           2606    17030 &   personales personales_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.personales
    ADD CONSTRAINT personales_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.personales DROP CONSTRAINT personales_updated_by_id_fk;
       public          postgres    false    4856    221    278            �           2606    16807 $   productos productos_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_created_by_id_fk;
       public          postgres    false    4856    221    235            �           2606    16980 4   productos_producto_links productos_producto_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos_producto_links
    ADD CONSTRAINT productos_producto_links_fk FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.productos_producto_links DROP CONSTRAINT productos_producto_links_fk;
       public          postgres    false    274    4898    235            �           2606    16985 8   productos_producto_links productos_producto_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos_producto_links
    ADD CONSTRAINT productos_producto_links_inv_fk FOREIGN KEY (venta_id) REFERENCES public.ventas(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.productos_producto_links DROP CONSTRAINT productos_producto_links_inv_fk;
       public          postgres    false    272    4981    274            �           2606    16812 $   productos productos_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_updated_by_id_fk;
       public          postgres    false    235    4856    221            �           2606    17075 6   promocionproductos promocionproductos_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.promocionproductos
    ADD CONSTRAINT promocionproductos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.promocionproductos DROP CONSTRAINT promocionproductos_created_by_id_fk;
       public          postgres    false    282    221    4856            �           2606    17080 6   promocionproductos promocionproductos_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.promocionproductos
    ADD CONSTRAINT promocionproductos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 `   ALTER TABLE ONLY public.promocionproductos DROP CONSTRAINT promocionproductos_updated_by_id_fk;
       public          postgres    false    221    4856    282            �           2606    16817 J   strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_created_by_id_fk;
       public          postgres    false    221    237    4856            �           2606    16822 T   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;
 ~   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_fk;
       public          postgres    false    239    237    4902            �           2606    16827 X   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_inv_fk;
       public          postgres    false    241    239    4913            �           2606    16832 J   strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_updated_by_id_fk;
       public          postgres    false    221    4856    237            �           2606    16837 4   strapi_api_tokens strapi_api_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_created_by_id_fk;
       public          postgres    false    4856    221    241            �           2606    16842 4   strapi_api_tokens strapi_api_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_updated_by_id_fk;
       public          postgres    false    4856    241    221            �           2606    16847 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk;
       public          postgres    false    249    221    4856            �           2606    16852 ^   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk    FK CONSTRAINT        ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_fk;
       public          postgres    false    249    4923    251            �           2606    16857 b   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk;
       public          postgres    false    251    253    4934            �           2606    16862 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk;
       public          postgres    false    221    249    4856            �           2606    16867 >   strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_created_by_id_fk;
       public          postgres    false    253    4856    221            �           2606    16872 >   strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_updated_by_id_fk;
       public          postgres    false    4856    253    221            �           2606    17001 ,   tipoproductos tipoproductos_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipoproductos
    ADD CONSTRAINT tipoproductos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.tipoproductos DROP CONSTRAINT tipoproductos_created_by_id_fk;
       public          postgres    false    221    4856    276            �           2606    17006 ,   tipoproductos tipoproductos_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipoproductos
    ADD CONSTRAINT tipoproductos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.tipoproductos DROP CONSTRAINT tipoproductos_updated_by_id_fk;
       public          postgres    false    4856    276    221            �           2606    16877 .   up_permissions up_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_created_by_id_fk;
       public          postgres    false    257    4856    221            �           2606    16882 6   up_permissions_role_links up_permissions_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_fk;
       public          postgres    false    257    4940    259            �           2606    16887 :   up_permissions_role_links up_permissions_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_inv_fk;
       public          postgres    false    4951    259    261            �           2606    16892 .   up_permissions up_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_updated_by_id_fk;
       public          postgres    false    221    257    4856            �           2606    16897 "   up_roles up_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_created_by_id_fk;
       public          postgres    false    261    221    4856            �           2606    16902 "   up_roles up_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_updated_by_id_fk;
       public          postgres    false    261    4856    221            �           2606    16907 "   up_users up_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_created_by_id_fk;
       public          postgres    false    4856    221    263            �           2606    16912 *   up_users_role_links up_users_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_fk;
       public          postgres    false    263    265    4955            �           2606    16917 .   up_users_role_links up_users_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_inv_fk;
       public          postgres    false    4951    265    261            �           2606    16922 "   up_users up_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_updated_by_id_fk;
       public          postgres    false    4856    263    221            �           2606    16927 .   upload_folders upload_folders_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_created_by_id_fk;
       public          postgres    false    267    221    4856            �           2606    16932 :   upload_folders_parent_links upload_folders_parent_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_fk;
       public          postgres    false    269    267    4970            �           2606    16937 >   upload_folders_parent_links upload_folders_parent_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_inv_fk;
       public          postgres    false    269    4970    267            �           2606    16942 .   upload_folders upload_folders_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_updated_by_id_fk;
       public          postgres    false    267    221    4856            �           2606    17098 .   venta_en_mesas venta_en_mesas_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_en_mesas
    ADD CONSTRAINT venta_en_mesas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.venta_en_mesas DROP CONSTRAINT venta_en_mesas_created_by_id_fk;
       public          postgres    false    284    221    4856            �           2606    17103 .   venta_en_mesas venta_en_mesas_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_en_mesas
    ADD CONSTRAINT venta_en_mesas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.venta_en_mesas DROP CONSTRAINT venta_en_mesas_updated_by_id_fk;
       public          postgres    false    284    4856    221            �           2606    16970    ventas ventas_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_created_by_id_fk;
       public          postgres    false    272    221    4856            �           2606    16975    ventas ventas_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_updated_by_id_fk;
       public          postgres    false    4856    272    221            ^   �  x��Z[o�6~N~E��Y%R�V�0`킡{j��HL�E�4IN���d����G	�^��������&e��O�0ܗY%V%���˿޶��?^8��n���ɕ턄��gn ���^:�u�"�K����>���4�@������Mm�R�F  �R��2A 
(��|R<��{��
2QQ~�fi��� ~��O�&Jv������LQm *�T�Kc�� ~`�/�)������ؠ���wA�'%/5��xϱH����㫔!C�K�7"o��(��Ee��%k%WiyjQ��RT����"�Ɩ�ŗ�]*��ބW�7-�G;���j#vQ��eU<����g��SQ%�s%�f7=�xy�v�X��FR�A�}�6+��cUdb�6�Wŉ�ӦP�����j���!����Ma.�-ޛ�;m�Ddg�#����{A|P�:��3�m>��^[��mΊ��8.�Lĭ#�I��C~�zW�DƤY���7Zs�o�~�e/�[���4KFU�\D�34�.,�tf�%0w��	��y�����/�)rb�6�x��­"w ';��/�-r�=���"w�����,��k����h/��+C���h�#ճ-���r��⪺��'�pZ��mb��L�$6�] �\k�s�k�T'���s�A�=¥�9ڊ@�_��ذ���Ȏ�uuzۈ]�I.���ET�"�[����N���?�%�Q�d�2�)Д�jJn���-Pè�a�PaR��%F�@W
T0�*����ƀa*B(1���������q}l� FK\��d����]T=�F�r�6�Z�\K�Z�I�~*�|�`�[�v+[�����6��X�L`H���J��|m�#����)����Eڃ�§#�Ć�p1{�,��@`��#Ӆ�Z\�d����� C+��V̝.��00��zN��tY��}�u�v�.��0�:_�N�^T�ۦ�"��Ǣ�O� ���|��X'�����:Γ��@{��ƺ3 �(wz�Q�{��
� �5P~���5��zm��r������[�m�/\��aho�7���զ���NT����@qD�(�9��H�:�<�i&����>D��o��!��)XdJ�˙B��4�A�E��)�x����d23��N�qSX�� �/���fۿ1���W���,�?=S��2�N�{�}YK3�Բ��vm9�<�:��qu��?g�
�u\�e,O������m��V%���M�T�d9�',t��!�7�ۙ�JZx~���9����2Lp%+<r7ܿ�YZ
�JZD�����|c���۪�#�Yğ�k�e�A����Co���i>�T��Wq������wx���@�X�7T��sC9W�� d21(que��ՙ��"�{��HIT��ͼ\VB>��,� 'Y�*?�;	qA\��Yi�39�a �$E����ɏ���y�+C!v23C�ɩ�O�"�<��DR�y<\�����{$�OA\�&QDg�7iY�x�1J�������$A�ɹ�#J@�q;�JD)�u�#���8׉rm�N(��m9���JND!���3H� ��\_� '�Ik"���s���"�2K=���m�x��my�q%b�8x�a<ɛ���M�A�������)C�{U�,K�b�s>��G$­��A\	�z�uf�q%2����gzܩf�zՏ;��,�V����%�.�JtO�d��y��:�M�k�K��B�Z�sA\���G�_A����R`Տ	�< U���Y|������|��żĮ`|x��J D�Y�wEk��)b��|zsd�ܾ�K���I���� ��B���!�++�(�+E�py���j�+��r9`>�,�G_�臆�����b1�J����;�mE�݉�?��wS�+�w{�U�F~��"��+�l���n���+�QޤI��5JE�i�m.	@\)��~K�QVʭ�ߒz�q���^zTAX�q%�3��3���UX�.//�_C��      `   J  x�%��m�0����SR/鿎�28���%����a�CZ�(+�m�wcl�;�����?����ϸ��ƕ�q3�U�.�y�+�MK�cZ�=���kZ�}�e���E0�i�l:��!��Bx6/�������B���B$ĳ����/�=
�����-Y�{&^_[��KѢ��3Ѣ��6�b��9��>+��x��Cq ���͊���hD�@��^!�5V�e���h٨k%Z�Y���Y��ͻ-�c�>4�'Z9��E�@��*�c�� �Z�j�����E���lD���<E���L����!��c�F�Lۈ։�|�ua��
B#��h=�g#Zܲ����mW	�Ϯ�0���S;s�,S�0���a7L�c�ㆥ�*H%�;Tx]׉-��z��#��V�C�e�Z���_�;����a��_pF��u�2Z���ђ|E�����_F��u��k��6?v-����hټF?F��u�1ZF�Տ�rz�~�����ص�^����k������?� �Wq��哿���&$��������������>d��Yq�&Vz�;v��sZܱ�U�����?ұ�      b   �   x�u��n� @g���TQ�-C�,]�\�#9`qG��}H��v@b��V�e�'Q�d���/4��s��0:G̀��#�p]�J(%S�L"!�xRf6v��8k��Q��azצ�/��>|���jS��bWW�V������0����k Ȓ� ]!�R_Q�r/��.oQV�J��7
��࿨��c^�,�]I�_D��?ty�_�a�?~3      d   �   x�3��)�,�t�/*JM�����K�S��s3A�\N�DCW�=_}=��`�Ԋ<��@��
�|G?�� wר�²�(��4�t�䊒���*�L��@T����ut��ͬ�,�Mp��5s��qqq �-�      f      x�3�4�@�=... �      �      x������ � �      h      x������ � �      i      x������ � �      l      x������ � �      n   <   x�3�t�K��,�P�H���L��4202�54�50T00�24�26�3�0�)�D\1z\\\ �c;      p   �   x�m�9�0Ek�\ �ټv�4��K(R�H��D�������\���oad�+�iv�QA1ls���./|�$�P9h�esn]_�-�����{w�+��>n��bnϡ���0�u�k>S /i���ǌ�>"/+��⾗�um!�'����g^�4.����Z��P�      �      x������ � �      r   T   x�3�tN-*K�J�4202�54�50T00�#N���bg0���E%(Jͭͭ���,�,�č̬���L��q�srr��qqq �5�      �      x�3�4B�=... ��      �      x������ � �      t      x������ � �      v      x������ � �      x      x������ � �      z      x��]�r�6��[y�٩��$Ų%Qes�8IUv[e˻u带(#a�!'$G��Rսƽ�=� ~��gHyl�6�h��_���{�|u��YZ*��")�KT��s|�������[���$��89Y�j��T�{?]�lz2uJ���5..������*�N.r4=i�ڟ�qޠJ�R��J��+K��k�'�}�h�Hp�3F9�-m�.24OVy󺬚�</�U������=���$K���Eu?En�Ia�k��4O.PNڐrH���U��ICޱ&Eh*�i��m�)��̓]�y��p�k��B%i���I���%UBF U�_W��xZ���ϓ�6n�]�wP�.���R\����2�˪$���`�tU�a�Jf8�JT ��J����oUҟ�����:�0S�j�B�!�PҠ��ZU�Kq>8�GW��j��uU��誋�1����J
��մ�9���gz�=��U����w�����\5<ZYo[��|��O6m���[}��};�t?Ƽ����}��t-)xl��`�b"#���"����B������u�����O�!UT�M�$ЌE�؝�4ʽ� $�gw.Hu��?\p����>�o�Bu3:wUԋ��Ԕ�|������n���PP���N+�&8FB���4��EZi��HK8��������BfP�%Xh�4���s*{���m�F��My���Y)�NP��έS;�4e��P�[�JQ]����
�Y�R�CT͓�yS�<�V:������O��?��B5<�p�1ץ��z��� �F1%<.~E�Yf7�4=(sV�X&L%u�(����9@C��"�	00�i�+|
�دa���H�Ψ�6�K�ߗl#�5�P�A�tT��Ztkѭu��٢�1h[G�9ݼK��8��J�z�*x��,��q�c�Ŏ���B\P��+2��������
���~����]��Υcm"d�����a�
��b\F��q!:���v{�ۍ�D���d���$;��ᔾ,��;���L��_2H;^2�kBt���4XCV�@�J���W8�*��ʲR\�/,'s~�-x �Eg�M�I��x4��%�H\�F��9��������9KLvO�j���]�;)�7�P$����Ez��(��\�z��� (�UF��>��1�n��Q^đ�C����ۂ1�CԻB��
|�d���e�H���1tT���UR���]e[�!C��c�����04��c�����:H � �>J^�Vp��r�O��ch���v�n0�}맕���@�������m�Hy��>z�A�RXUSs������
�x>�@��jy.����g��[+�i�c ��w�n!�z���F�[	��1�"�@��:����[�>5�q��h����t`8X8���kņ��Sa���	��E������%6�)fuz���{ ?����s�v�^pK��f��\�KZ��s�p�N���U�T/�l^��$wJX8�k2��^8]�9P.~�~��������v���dN��}Y����
�lU��MS�U�.��M����)brS��稸�^��o׉t����+\�L�2����w�h�~�/���]��JI1Vf����3�km%���{��
l��W(O8T�?	0$��y��@̦o�h��e�MR]�fj����y�[�7�;Pn��NE�	=me�󾁻�pc\��i���F�e�o�^�J���j=�qAݭB���M����,\�p� �Rtժ�P~�v�M��6VMR�@ܺ��w�Jm�^��yy���(���^2�4�y.R�X3�MG����(f�j��ɘ�L�CO^i ScU��W�n6�)�����X��Hp皸����q�)�֛�%�I]ߖU��%/��rp�ET��ws.�{�#v$���M�����4��&�$��hgy���(j�^��T
��_ɿm��D�}txƚ�Z��y�^�l�['Q��y��"�����U乻�潐�Ț��0\�,��I�i���T:���b���.6��P�}�����Klwt%�U~?���+O
z���5@_H4A�_{�p+$>�4��D����Oyx�V&� ���2o���g�"Y.���dM��{��;f���vi, D��;jn�A#E8���h{J ��zJ�콛kw�#C��2�V	���K<9��+SPO�l�CY�NF]�5�?�)�;@Z?���9f�&��ЮX-P%����O����"�V>_��A�,�ߪn�=ztw�o%��J+4� B�������[I&b��`�yO>��"_���;ߞ�G�U�L�]���+&2��Qss�>|�������!��nKP����9ic^���ӳ_Z���:A�1%�N�
|B狴�ぎ�(K�<f�����9����]�A��o~	sh�y8+�s�5�l��W�Qz'��a�f�k׎���a�Ò�Ȥ�O~�t:�]Rsk�a6�l��݃����31CH4��鞘��"����Qw�cBG���˪:�3��á-�!�"#��)5�q������]a���5���A�6�a���)�e�<}�a�2s�a�?c���N��0��%����R�5�iy�N>w���l����-�/�ޫ�v��[��I�6�J�m��x����yf���6���ݭ��l�^��`!ϔa��X�jy%��9��M��h	ľ�����y���pA���r�$��펚��2��p-M����Yk3��x��2}�Ղ���S���ho�X幖ZȐ��,i q�4Le�4U&�^�䰺A(JBzI �	�Ho��1g�<$��C"��y���(����N�/c���l�a����|
�'�jt��}�e3���;	���׾M�`��b�R|3h$+�_���}�g=A�smwڶ	��{��<��Ӛ���\�Ȳ�$���N��
�����"��H�T1� �kH�Er6'�#6~\�8 =7݋�h`-EQ�&�Зi����5�ūe�NѲ���)2wd��f�zϓgl1��_�����Ŀѓ�o����i����G��j��Ůg�Z�������iOގj���� �!�'��Q
���[{m���s������4�>2Ȑ�p��!���Qs+Wa'���;�3���@kyΦ,�����LTOn��X�e�r�4��ysZdg���8q ��y�$�e��&��וq՜����,�j���R�~�����#d`��7�Cz�u&��v�T�di����iqp�Xut0*�x� �D�qz��ykH��${S�j~m��}S���#�٦�,�i��e!�*2���u�σP;p��E����G^���;.F��;j��8wv`�l��y���*��г��g���ӿ}�?`:�K|r��h���x��釷�8y"�Zv�54��L֙�``��9�\\T�C&O�(�qV���ʪBzQ�I�9�Ѽ,�2qԄ��Hb��~ ��i<��N���C����,N�>�f{�U���.-�#9�>SSm<i���.m`��]�buH��di�ca�,KML3����ϯ��̏�T/��y����ʌR3��$�x�/Bi��85ੱ=`�a[��
�t��4����KT�e���^H)u�V)�=��ښ�!�&�Y�32�`���+f߲Ӌ�"X���q�Ε��T��xꢟ���E[ϴ��Z��*m�C�G?|卺LFȵMFkj��%�G/?��*yFp���:���WI�K����k��
�$�/bZ�$�t�����b����3�b��!������f�3��D̈���[eK��񆆿Uu�U򷋒��ޕy��6[wO+�'w~��,:gWx�QMd�&�δ|E� �@�5m��d�z2������Zh���)5q�m���,���^��7�0BC���a���r�ȼ�$bq��.,��g�� j��z������V���V��8���>��Zt��(K��L�'�;У^ζ��M��CO�!�x�e�H��<\��q"1���i1���\.Q�,�hX�OQ)�Pq�@ �  5�.~��*f��:��=@�%
=66Ań����4r�nя9����^Z}�n���-�d��Ŝ1���YR48K2o?�#b�Y6�,ε��u ;0���p�S�+o���{�ſ�>{�� �|qt��>���?�?�6Ne�R:d�ɉ6�ޛ��S�FMC��=��U~�C�������/�Җ(�%?>zD�6.~�(���qU7쌿|u�uY5<�.XF�LU����3� yfa�f��2܈�<���I�M!�j"V��v��V�S1�K2�Rtœ��9ھ�0�/WG]z����x>Me��j�C��_����ec�	�S�>j+)�#^C!9D=��R[C�E��Ԅ��	��jk��;w�k��	��KL?�|��.�J#݄�M�=����3O��a2��.y:Sg|E��44]�h�yg��˺��1�]d[kQ4��*�A�Q�9�P�<!���b;�:�`��I��F�d+�
G�t�� 7�n�����誋�1�m�����G���ͺ�1��=��������8�]�j�x��z�RU�jtK2�w���ߪ��d��X�c��6^�n���6��V�������`�O��q���� 4������28b��򀂿B�7%�t�,E0�d�`�;߂��֦e/�2��q�Ep��`��@�W�zx^6��Ѥ�0f��0����J�0*��� �mU8����CT�(��	��2؊A@b�4�"���#(���q���ۉ������Vl[K��Pl3��x��é?��q��xt-�2�><G7.8z��e���x>�TQ�9�s͏�^UQ������k<�/�
����f��44�J�1�n"��O�M�I->���(8�b}H�x`WA{pb����:��z����Cn!��6����U䂃V��/9��������x�Ӱ�C�6��˵��Q�ޑ2D��YR��p��[Zh,_
0t�Z0�9�`��t�+AG�'�A�{�Z����'��
�K�'�A?�*8��eɪ)_V4�,o������F�&�!ݛT�>}ʟ�����o�`� �.��h�X��]�'-���Sf|��Ayٞ��p���\Q���-j�O��]k�5":6��i��Iz=e��$�s�%o�,#MR�!3,2px~'����C�d*\��u���A��*�PuDSP��eY^�PV�W��s�b]���Z]t��V��/k��O����(8�ʺ�7j��"+o�>zH�^U��gL��7?� + j�P�7Q��C�E�$d�,:�Ruzt&y�v��J� v�7]�~sݧ�u�M�!�Z3��BϡM���zB�fa9.���(:t�Uzh!ڀzT�7H�9A��'�2��5S+-/ܾ���*�|���J����ݡ�y��������E��B󿺵T(��£'��S�I�� ������1=h�Gj���	���:D+�8�n@m����G)mcl�n���0."�C�	7�n;�B�k�IS�����hƥu?�}��[�껩ˍ���	�f�Go����)�~�u� �thU��V���x�q^�9�;�o��W$&gI�r��	�,*������X�C�^�$�D5��;��+��D�����������B�+�Is�4�~'yY�?*��p򺬪�IrA�1����\~��o�����\��������-����AiRL�`�h2/�$~�rBqjҔ6Bf?'\*��_�6y������'ݐ��}��?� W��ϯ��>�צ�p�L?�������Y�W(�X�C>��4-WE3�3��s���e5i_�A����p蓸Jns.�u����Y�����r���gEB���Аi<�!{J�^��S�C�O5?�ϼ$�I�et͓}�H�@�Q�ĭ˵�D$Ɋ�y\��jF*f������8t�n�0'@�%����|m�>�T8���-B���kbbي	zr<9�v�x�����Q��JoXK��o���>����GG��>�#q��w^)��eZxG��?/YJj��/[�c]���^�e�O��Wr����aa_��#U��sv��U�N���v���F^�Ư���p=A�����
n���`l��^�5�(̿(a+J/��`+7D1�I[��`�����j�
��1TT���r\*�K�j��Y ���Y��P,�JpΟj�O�\}�o�R�ݶ�h�ێ��js���2�0��j<g��~*x_�2��歩44@K�!:	�mE�
c�k��������%�>B������U�P��#�`���՘�F3�����>�z#Z�&���j�ǦƿOG!��2w���1���_K�Y���R=){�;��;t���\#%��<Rr��$F6��8t�C�*��; � Sp� ��<7��8@���
(�
���+��<���̚Q���C-�yK$�0����G
����I�
?�uK�|�oV2RکVt����GO���:���������>x-���ħ�\�s��7��?�g0Lg����_�-�A�2�w�o����xc�d�X7��F���g�?�<֭P=e�?>L���u�n�c��ڃ��=�#h?x�������v�D�BCC���il��w�dE�(��J���r�i����7����fșJu|���G`:d,^:^��f)]��Ms�:��5}�U8��� >]'���*ә�d>#D�hx�r4/PGY6����S��@�w�Y��ҬI��!�����j(����-@tޠ�i��
��i�e���f��x��e�����gƖ#DD<5���u�BJ��Q�<[�^���m��+b� )P�c)+��U��"�����wgWMu?98�r�׀��V6���{��y(�[���g��W���E���:�v`��߱\�[�Q��0]|Ш��=vת2�;}����=f�0�㘇�E�v��L�������Ԓ�#K�,%�K�況�6PA��=A�m|,E P�q1ZѦ����v��_�?aS��      |   �	  x��]K���^ۿ"ź��G�3�]����Me�ս.J�neh�1~��߯x5�B�-<��<�9�wB�ݾ��h��{��?EG�=y��(&~�8����B�O��Gh�?��?l��<I����sy `Qz�-i$����8��1�$��EØ�#⟽'�S����B�#_���P���{�im<������_Ji����us2�Y�:� ��������t�_P��Z���D-ދ���+� :���fR�@{��?4��o�=_j���^��GK���V�W���jؾ��L�6"b�X���(<�ǘI�F�q��̗щ��g�����kF��:�i�ij$��JI�T�e���x�9���W�L�"����j)EWF�Y�?{�����wϞ��M�n�B�$�q����$���P^�9�q%��#`4$��0%e>��xei HNI��1���I^�q@������0?���M�h#S#%�c>g��$�z����^�RL�`&�2�Ҋ�]��b�芨dGx"�����Ȯ�|D$�)�$!up�`�W�|��1h)��dӾ�� �F?�]^q`mJPk�F,x�v4k�cB?Bt��=hd�����
�"�-+�3ˊB�ݲ��.�������L�T~����z��`��a��ٝ�����43��$[@<�FH8���KM�gm(p����&�9qb�w���5"";�Ĩ5[���|Dvt�f�~`��a��A�ٳ|Ijv�F�4��=�+�A��&2%�L=��΅�sq�Ao����,�WtW2q�7]p<y%<9z����.{B�l��8��y��G8|���}\��C2ײ��E�L�����m'`�t�C���A-���R�k��(iux��5�g���JN�v���|QJȎ���?)])_	P�o�T^j�\�1��_�[�@O�P$�U{�z-�|����T�#	%��D�s�R�B�����s@��2 ґ�&ENu-#�#�j�7�;e�]����}p5셄y�����X I03�Œ+�]�nT�W�bK|Ѧ,�CU]Y��kK����b�Wc�T�=�cZ����U�α���㮫e-��Q$
dm���b���n3�An\ϱ��-��nI; �	`�����s@���Kf�{qi�R���;��r���AQ����vw�0�gݾ׿]����pK���ɞ2-�%D�x��%��p�{ͬKn�/�EXM����۔a�~��d`cGWD���K���k�� "2#���Tg���$��Y��f.�	 �q�aW��8�H�`a�s�A�k�c�YM�έ1"11p2"N�I�ڌkd.	dim姌9��m��l�d+�VDU�h|^��xؼ��D&�z�c�"�,Kc�>���IC�-R1�
�YL�\�R��:�Z����&�㖋���4��Z����r�`�X�l�3'WD+����!ў-�I�8a
S ^AD���܆`I|)�ȗ�e�{����ÕWRbY�,õ�Y�9Eǹ(���,+�ːYn���!	���/25�H7�u��Hi���� ��SQ[�-�a$�pvu��Pڡ�Ci=Jg_�G=�\�3�岻-@6��M�[/T��)��a�=�;,^�}L�#N��|j3�k1V1��:p�6twE�]M, ��G�Y~!�3�Gʵ(>����ԭ���%F0@T�����8�q8�H���)�4ŏ}�~@[ݣ��u�sԊ!��#*?=EH��ƞM-T�U�VI�ʗ+�m������٠j	��;ۻ�5h��/�����F��R�V�{�2�����ÆjlUt"��\�n# @�"�~M���i�-!�,)UX��;k��U0S�0]��(m�e�����c�i%}UˏA���p= T��%�O#�m��P�������܍�݉}U�s<-\�\u/S�*��3{s�O������Ҋa���&��G���j1f�}q���`��E�,Z	o,t��	��n=p7R�*wκΒ��T�+��atiN?��5gA��ti��9
v�Ə/.���
"�㿜�EA��|�Q~k��x|��^U�N�f���NٱB��7VJ��|Μ�EB���W�mb`.���y:1/��R^TV�B��봀�\�;GG�;�.���45Y��ThuSa�`���J�ö!FS)��W;����f��X��9=ь����A�ZH%�����d1�� t��02�uT���,I��w&U�":-8)d��B$��k�.�Y�nK Ϥ��'�f�1��b�[��5XZ�`<���z�=�k3ݨ�|f�.��L� z _��Z���7M:}�/TPI���`��LO�q&��J��:V,���~/��M}��dY�>��^��-V����,9fl�4x�+_SpT���l '&n�j=�^������(i�X��F��h�}<����������7?���p���p�t����۟_�w����=�Y�����>�/o���=�yx���^�~�~��      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   c   x�3���L�/J-VH�9���.�4202�54�50R02�20�24Գ01�"n�ga�U��̜�K��8�2�jd�gih�)nl�gfi�]��jj� �''      �     x���Oj�0�ᵞb.`Hb�c�C���M�?�PM$���֡0��@� A���BB�u��B�U+�E9��v�kAӺ"��䀩 L�ji����W�;�������H�>�2+u�"��U�o;�F��gI�h���y�����I�J��Xp�h�MG&�<�L���a�j>=*�H�홡.r����\�U	�Z3����3*}����`a¢�%1�� =�4Ɔux��c� 3�lg�}�ot{�
ܠ#���;��K���=P"8� LYt߹3*��WJux      �   P   x�%���@Cѳ]L0K/鿎 #��O_PFk�Ztx�tpb��ݘ��n�"����T�)��.��T@՞��?y      �   �   x�u�A
�0E��)�3k!;��x�nb�j �R3�_AA�����dvZ�Rjb����5W��,pI)P'��л���1�Ⱦ!l� 9�&���[����樧����%��=Y|�/f`
-$��?��Yk��KD�      �   �   x�E��
�@@�3_�­Ý�cjVBP6$$���G昤A��=6q8�쪩5�\1�8V��׭ef����A�pp��U*{�ch��R���q���9ʗ+�`Nq����%'[�M��hR����\�@� =��/�ȥ}&DH8�`��7,-�      �      x�3�4A�=... ��      �      x������ � �      �      x������ � �      �      x������ � �      �   P   x�3�K�+ITHIUHN-*K�J�4650�30�4202�54�50R02�21�21�375�75ӳ4��.nh�i�i����� N{N     