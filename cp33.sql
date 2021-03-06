PGDMP     #    0                u            cp33    9.6.3    9.6.3 o    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    40960    cp33    DATABASE     b   CREATE DATABASE cp33 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE cp33;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                        3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                        3079    40968 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                  false    4            �	           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                       false    2            �            1259    49368    bets    TABLE     �  CREATE TABLE bets (
    id bigint NOT NULL,
    platform_id smallint NOT NULL,
    uid integer NOT NULL,
    game_id smallint NOT NULL,
    bet_next smallint DEFAULT 0,
    amount numeric(11,3) NOT NULL,
    play_id smallint NOT NULL,
    sub_id smallint NOT NULL,
    sub_name character varying(20) NOT NULL,
    bet_code character varying(150) NOT NULL,
    bet_count smallint NOT NULL,
    bet_money numeric(11,3) NOT NULL,
    bet_each_money numeric(11,3) NOT NULL,
    bet_reward numeric(11,3) DEFAULT 0,
    bet_more smallint NOT NULL,
    bet_win_stop smallint DEFAULT 0,
    ctime timestamp(6) without time zone,
    etime timestamp(6) without time zone DEFAULT NULL::timestamp without time zone,
    game_period integer,
    is_delete boolean DEFAULT false NOT NULL,
    bet_prize character varying(25),
    bet_prize_show character varying(25),
    bet_pos character varying(9),
    is_win boolean DEFAULT false,
    win_amount numeric(11,3),
    status smallint DEFAULT 0,
    open_num character varying(30)
);
    DROP TABLE public.bets;
       public         postgres    false    4            �	           0    0 
   TABLE bets    COMMENT     ,   COMMENT ON TABLE bets IS '用户投注表';
            public       postgres    false    191            �	           0    0    COLUMN bets.game_period    COMMENT     0   COMMENT ON COLUMN bets.game_period IS '期号';
            public       postgres    false    191            �	           0    0    COLUMN bets.is_delete    COMMENT     :   COMMENT ON COLUMN bets.is_delete IS '是否取消购买';
            public       postgres    false    191            �	           0    0    COLUMN bets.bet_pos    COMMENT     G   COMMENT ON COLUMN bets.bet_pos IS '0万 1千 2百 3十 4个，位数';
            public       postgres    false    191            �	           0    0    COLUMN bets.status    COMMENT     ;   COMMENT ON COLUMN bets.status IS '2已取消,1已结算,';
            public       postgres    false    191            �            1259    49366    bets_id_seq    SEQUENCE     m   CREATE SEQUENCE bets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.bets_id_seq;
       public       postgres    false    4    191            �	           0    0    bets_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE bets_id_seq OWNED BY bets.id;
            public       postgres    false    190            �            1259    49385    data    TABLE     �   CREATE TABLE data (
    id bigint NOT NULL,
    type smallint NOT NULL,
    issue integer,
    "time" timestamp(6) without time zone,
    data character varying(80)
);
    DROP TABLE public.data;
       public         postgres    false    4            �	           0    0 
   TABLE data    COMMENT     /   COMMENT ON TABLE data IS '彩票开奖号码';
            public       postgres    false    193            �            1259    49383    data_id_seq    SEQUENCE     m   CREATE SEQUENCE data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.data_id_seq;
       public       postgres    false    4    193            �	           0    0    data_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE data_id_seq OWNED BY data.id;
            public       postgres    false    192            �            1259    49394 
   data_times    TABLE     �   CREATE TABLE data_times (
    id integer NOT NULL,
    type smallint NOT NULL,
    action_no smallint NOT NULL,
    action_time time without time zone NOT NULL,
    stop_time time(6) without time zone
);
    DROP TABLE public.data_times;
       public         postgres    false    4            �	           0    0    TABLE data_times    COMMENT     8   COMMENT ON TABLE data_times IS '彩票开奖时间表';
            public       postgres    false    195            �            1259    49392    data_time_id_seq    SEQUENCE     r   CREATE SEQUENCE data_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.data_time_id_seq;
       public       postgres    false    4    195            �	           0    0    data_time_id_seq    SEQUENCE OWNED BY     8   ALTER SEQUENCE data_time_id_seq OWNED BY data_times.id;
            public       postgres    false    194            �            1259    65831 	   lotteries    TABLE     \  CREATE TABLE lotteries (
    id integer NOT NULL,
    type smallint,
    enable boolean DEFAULT true NOT NULL,
    is_delete boolean DEFAULT false NOT NULL,
    sort smallint,
    name character varying(32),
    short_name character varying(8),
    info character varying(255),
    delay_second smallint DEFAULT 10,
    count smallint DEFAULT 0
);
    DROP TABLE public.lotteries;
       public         postgres    false    4            �	           0    0    TABLE lotteries    COMMENT     .   COMMENT ON TABLE lotteries IS '彩票类型';
            public       postgres    false    200            �	           0    0    COLUMN lotteries.type    COMMENT     2   COMMENT ON COLUMN lotteries.type IS '1时时彩';
            public       postgres    false    200            �	           0    0    COLUMN lotteries.delay_second    COMMENT     K   COMMENT ON COLUMN lotteries.delay_second IS '开奖前停止下注时间';
            public       postgres    false    200            �	           0    0    COLUMN lotteries.count    COMMENT     5   COMMENT ON COLUMN lotteries.count IS '彩种期数';
            public       postgres    false    200            �            1259    40999    members_uid    SEQUENCE     u   CREATE SEQUENCE members_uid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 "   DROP SEQUENCE public.members_uid;
       public       postgres    false    4            �	           0    0    SEQUENCE members_uid    COMMENT     >   COMMENT ON SEQUENCE members_uid IS 'members_uid自增序列';
            public       postgres    false    187            �            1259    40961    members    TABLE     �  CREATE TABLE members (
    uid integer DEFAULT nextval('members_uid'::regclass) NOT NULL,
    uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
    source smallint DEFAULT '-1'::integer NOT NULL,
    is_delete boolean DEFAULT false NOT NULL,
    enable boolean DEFAULT true NOT NULL,
    parent_id integer,
    parents integer[],
    username character varying(16) COLLATE pg_catalog."zh_CN.UTF-8",
    password character(64),
    coin_password character(20) COLLATE pg_catalog."en_US.UTF-8" DEFAULT NULL::bpchar,
    type smallint,
    reg_time timestamp(6) without time zone,
    update_time timestamp(6) without time zone,
    grade smallint DEFAULT 1 NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    score_total integer DEFAULT 0 NOT NULL,
    coin numeric(11,3) DEFAULT 0 NOT NULL,
    fcoin numeric(11,3) DEFAULT 0 NOT NULL,
    fan_dian numeric(3,1) DEFAULT 0 NOT NULL,
    fan_dian_bdw numeric(3,1) DEFAULT 0 NOT NULL,
    qq character varying(13) COLLATE pg_catalog."en_US.UTF-8",
    con_comm_status boolean DEFAULT false NOT NULL,
    loss_comm_status boolean DEFAULT false NOT NULL,
    info character varying(128) COLLATE pg_catalog."zh_CN.UTF-8",
    reg_ip inet,
    platform_id smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.members;
       public         postgres    false    2    4    187    4            �	           0    0    TABLE members    COMMENT     /   COMMENT ON TABLE members IS '普通用户表';
            public       postgres    false    186            �	           0    0    COLUMN members.uuid    COMMENT     9   COMMENT ON COLUMN members.uuid IS '用于推广的uuid';
            public       postgres    false    186            �	           0    0    COLUMN members.source    COMMENT     .   COMMENT ON COLUMN members.source IS '来源';
            public       postgres    false    186            �	           0    0    COLUMN members.is_delete    COMMENT     7   COMMENT ON COLUMN members.is_delete IS '是否删除';
            public       postgres    false    186            �	           0    0    COLUMN members.parent_id    COMMENT     =   COMMENT ON COLUMN members.parent_id IS '会员从属关系';
            public       postgres    false    186            �	           0    0    COLUMN members.parents    COMMENT     =   COMMENT ON COLUMN members.parents IS '上级系列如1,2,5';
            public       postgres    false    186            �	           0    0    COLUMN members.username    COMMENT     3   COMMENT ON COLUMN members.username IS '用户名';
            public       postgres    false    186            �	           0    0    COLUMN members.password    COMMENT     �   COMMENT ON COLUMN members.password IS '客户端完成sha3->ripemd160的加密(为防止网络监控)，服务端再argon2加密.';
            public       postgres    false    186            �	           0    0    COLUMN members.coin_password    COMMENT     M   COMMENT ON COLUMN members.coin_password IS 'sha3->ripemd160 //提款密码';
            public       postgres    false    186            �	           0    0    COLUMN members.type    COMMENT     >   COMMENT ON COLUMN members.type IS '0测试 1会员  2代理';
            public       postgres    false    186            �	           0    0    COLUMN members.reg_time    COMMENT     6   COMMENT ON COLUMN members.reg_time IS '注册时间';
            public       postgres    false    186            �	           0    0    COLUMN members.grade    COMMENT     -   COMMENT ON COLUMN members.grade IS '等级';
            public       postgres    false    186            �	           0    0    COLUMN members.score    COMMENT     -   COMMENT ON COLUMN members.score IS '积分';
            public       postgres    false    186            �	           0    0    COLUMN members.score_total    COMMENT     9   COMMENT ON COLUMN members.score_total IS '累计积分';
            public       postgres    false    186            �	           0    0    COLUMN members.coin    COMMENT     2   COMMENT ON COLUMN members.coin IS '个人财产';
            public       postgres    false    186            �	           0    0    COLUMN members.fcoin    COMMENT     3   COMMENT ON COLUMN members.fcoin IS '冻结资产';
            public       postgres    false    186            �	           0    0    COLUMN members.fan_dian    COMMENT     B   COMMENT ON COLUMN members.fan_dian IS '用户设置的返点数';
            public       postgres    false    186            �	           0    0    COLUMN members.fan_dian_bdw    COMMENT     =   COMMENT ON COLUMN members.fan_dian_bdw IS '不定位返点';
            public       postgres    false    186            �	           0    0    COLUMN members.con_comm_status    COMMENT     I   COMMENT ON COLUMN members.con_comm_status IS '消费佣金发放状态';
            public       postgres    false    186            �	           0    0    COLUMN members.loss_comm_status    COMMENT     J   COMMENT ON COLUMN members.loss_comm_status IS '亏损佣金发放状态';
            public       postgres    false    186            �	           0    0    COLUMN members.info    COMMENT     ,   COMMENT ON COLUMN members.info IS '备注';
            public       postgres    false    186            �            1259    41081 
   pingtai_id    SEQUENCE     o   CREATE SEQUENCE pingtai_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 32766
    CACHE 1;
 !   DROP SEQUENCE public.pingtai_id;
       public       postgres    false    4            �            1259    41076    pingtais    TABLE     *  CREATE TABLE pingtais (
    id smallint DEFAULT nextval('pingtai_id'::regclass) NOT NULL,
    platform uuid DEFAULT uuid_generate_v4() NOT NULL,
    ctime timestamp(6) without time zone,
    etime timestamp(6) without time zone,
    qq character varying(12),
    stime time(6) without time zone
);
    DROP TABLE public.pingtais;
       public         postgres    false    189    2    4    4            �	           0    0    TABLE pingtais    COMMENT     3   COMMENT ON TABLE pingtais IS '平台开通信息';
            public       postgres    false    188            �	           0    0    COLUMN pingtais.ctime    COMMENT     4   COMMENT ON COLUMN pingtais.ctime IS '创建时间';
            public       postgres    false    188            �	           0    0    COLUMN pingtais.etime    COMMENT     4   COMMENT ON COLUMN pingtais.etime IS '结束时间';
            public       postgres    false    188             
           0    0    COLUMN pingtais.qq    COMMENT     0   COMMENT ON COLUMN pingtais.qq IS '联系人qq';
            public       postgres    false    188            �            1259    49451    played_group    TABLE     �   CREATE TABLE played_group (
    id smallint NOT NULL,
    enable boolean NOT NULL,
    type smallint NOT NULL,
    group_name character varying(32) NOT NULL,
    sort smallint NOT NULL,
    platform_id integer DEFAULT 0 NOT NULL
);
     DROP TABLE public.played_group;
       public         postgres    false    4            
           0    0    TABLE played_group    COMMENT     .   COMMENT ON TABLE played_group IS '玩法组';
            public       postgres    false    197            
           0    0    COLUMN played_group.type    COMMENT     D   COMMENT ON COLUMN played_group.type IS '对应post 数据[playId]';
            public       postgres    false    197            �            1259    49449    played_group_id_seq    SEQUENCE     u   CREATE SEQUENCE played_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.played_group_id_seq;
       public       postgres    false    197    4            
           0    0    played_group_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE played_group_id_seq OWNED BY played_group.id;
            public       postgres    false    196            �            1259    65778    playeds    TABLE       CREATE TABLE playeds (
    id integer NOT NULL,
    sub_name character varying(16),
    enable boolean DEFAULT false,
    sub_id smallint,
    group_id integer,
    simple_info character varying(255),
    info character varying(255),
    example character varying(255),
    sort smallint DEFAULT 0 NOT NULL,
    min_charge numeric(11,3) DEFAULT 0.0 NOT NULL,
    max_count smallint DEFAULT 100 NOT NULL,
    platform_id integer DEFAULT 0 NOT NULL,
    bonus_prop character varying(25),
    bonus_prop_base character varying(25)
);
    DROP TABLE public.playeds;
       public         postgres    false    4            
           0    0    COLUMN playeds.sub_name    COMMENT     0   COMMENT ON COLUMN playeds.sub_name IS '名称';
            public       postgres    false    198            
           0    0    COLUMN playeds.group_id    COMMENT     N   COMMENT ON COLUMN playeds.group_id IS '对应post数据的playId玩法组id';
            public       postgres    false    198            
           0    0    COLUMN playeds.simple_info    COMMENT     ?   COMMENT ON COLUMN playeds.simple_info IS '玩法简单说明';
            public       postgres    false    198            
           0    0    COLUMN playeds.info    COMMENT     2   COMMENT ON COLUMN playeds.info IS '玩法说明';
            public       postgres    false    198            
           0    0    COLUMN playeds.example    COMMENT     5   COMMENT ON COLUMN playeds.example IS '中奖举例';
            public       postgres    false    198            	
           0    0    COLUMN playeds.min_charge    COMMENT     >   COMMENT ON COLUMN playeds.min_charge IS '最低消费金额';
            public       postgres    false    198            

           0    0    COLUMN playeds.max_count    COMMENT     7   COMMENT ON COLUMN playeds.max_count IS '最大注数';
            public       postgres    false    198            
           0    0    COLUMN playeds.bonus_prop    COMMENT     K   COMMENT ON COLUMN playeds.bonus_prop IS '最大赔率，多个用|相隔';
            public       postgres    false    198            �            1259    65781    played_id_seq    SEQUENCE     o   CREATE SEQUENCE played_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.played_id_seq;
       public       postgres    false    4    198            
           0    0    played_id_seq    SEQUENCE OWNED BY     2   ALTER SEQUENCE played_id_seq OWNED BY playeds.id;
            public       postgres    false    199            �            1259    65834    type_id_seq    SEQUENCE     m   CREATE SEQUENCE type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.type_id_seq;
       public       postgres    false    200    4            
           0    0    type_id_seq    SEQUENCE OWNED BY     2   ALTER SEQUENCE type_id_seq OWNED BY lotteries.id;
            public       postgres    false    201            %	           2604    49371    bets id    DEFAULT     T   ALTER TABLE ONLY bets ALTER COLUMN id SET DEFAULT nextval('bets_id_seq'::regclass);
 6   ALTER TABLE public.bets ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190    191            -	           2604    49388    data id    DEFAULT     T   ALTER TABLE ONLY data ALTER COLUMN id SET DEFAULT nextval('data_id_seq'::regclass);
 6   ALTER TABLE public.data ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192    193            .	           2604    49397    data_times id    DEFAULT     _   ALTER TABLE ONLY data_times ALTER COLUMN id SET DEFAULT nextval('data_time_id_seq'::regclass);
 <   ALTER TABLE public.data_times ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    195    195            7	           2604    65836    lotteries id    DEFAULT     Y   ALTER TABLE ONLY lotteries ALTER COLUMN id SET DEFAULT nextval('type_id_seq'::regclass);
 ;   ALTER TABLE public.lotteries ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            /	           2604    49454    played_group id    DEFAULT     d   ALTER TABLE ONLY played_group ALTER COLUMN id SET DEFAULT nextval('played_group_id_seq'::regclass);
 >   ALTER TABLE public.played_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            1	           2604    65783 
   playeds id    DEFAULT     Y   ALTER TABLE ONLY playeds ALTER COLUMN id SET DEFAULT nextval('played_id_seq'::regclass);
 9   ALTER TABLE public.playeds ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �	          0    49368    bets 
   TABLE DATA               '  COPY bets (id, platform_id, uid, game_id, bet_next, amount, play_id, sub_id, sub_name, bet_code, bet_count, bet_money, bet_each_money, bet_reward, bet_more, bet_win_stop, ctime, etime, game_period, is_delete, bet_prize, bet_prize_show, bet_pos, is_win, win_amount, status, open_num) FROM stdin;
    public       postgres    false    191   o       
           0    0    bets_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('bets_id_seq', 4694, true);
            public       postgres    false    190            �	          0    49385    data 
   TABLE DATA               6   COPY data (id, type, issue, "time", data) FROM stdin;
    public       postgres    false    193   �w       
           0    0    data_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('data_id_seq', 960, true);
            public       postgres    false    192            
           0    0    data_time_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('data_time_id_seq', 1, true);
            public       postgres    false    194            �	          0    49394 
   data_times 
   TABLE DATA               J   COPY data_times (id, type, action_no, action_time, stop_time) FROM stdin;
    public       postgres    false    195   �       �	          0    65831 	   lotteries 
   TABLE DATA               l   COPY lotteries (id, type, enable, is_delete, sort, name, short_name, info, delay_second, count) FROM stdin;
    public       postgres    false    200   ��      �	          0    40961    members 
   TABLE DATA                 COPY members (uid, uuid, source, is_delete, enable, parent_id, parents, username, password, coin_password, type, reg_time, update_time, grade, score, score_total, coin, fcoin, fan_dian, fan_dian_bdw, qq, con_comm_status, loss_comm_status, info, reg_ip, platform_id) FROM stdin;
    public       postgres    false    186   |�      
           0    0    members_uid    SEQUENCE SET     4   SELECT pg_catalog.setval('members_uid', 108, true);
            public       postgres    false    187            
           0    0 
   pingtai_id    SEQUENCE SET     1   SELECT pg_catalog.setval('pingtai_id', 1, true);
            public       postgres    false    189            �	          0    41076    pingtais 
   TABLE DATA               B   COPY pingtais (id, platform, ctime, etime, qq, stime) FROM stdin;
    public       postgres    false    188   $�      �	          0    49451    played_group 
   TABLE DATA               P   COPY played_group (id, enable, type, group_name, sort, platform_id) FROM stdin;
    public       postgres    false    197   ��      
           0    0    played_group_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('played_group_id_seq', 1, false);
            public       postgres    false    196            
           0    0    played_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('played_id_seq', 1, false);
            public       postgres    false    199            �	          0    65778    playeds 
   TABLE DATA               �   COPY playeds (id, sub_name, enable, sub_id, group_id, simple_info, info, example, sort, min_charge, max_count, platform_id, bonus_prop, bonus_prop_base) FROM stdin;
    public       postgres    false    198   3�      
           0    0    type_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('type_id_seq', 1, false);
            public       postgres    false    201            C	           2606    49373    bets bets_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY bets
    ADD CONSTRAINT bets_pkey PRIMARY KEY (id, platform_id, uid, game_id);
 8   ALTER TABLE ONLY public.bets DROP CONSTRAINT bets_pkey;
       public         postgres    false    191    191    191    191    191            H	           2606    49390    data data_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY data
    ADD CONSTRAINT data_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.data DROP CONSTRAINT data_pkey;
       public         postgres    false    193    193            J	           2606    49399    data_times data_time_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY data_times
    ADD CONSTRAINT data_time_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.data_times DROP CONSTRAINT data_time_pkey;
       public         postgres    false    195    195            ?	           2606    41080    pingtais none 
   CONSTRAINT     F   ALTER TABLE ONLY pingtais
    ADD CONSTRAINT "none" PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.pingtais DROP CONSTRAINT "none";
       public         postgres    false    188    188            A	           2606    41084    pingtais platform 
   CONSTRAINT     I   ALTER TABLE ONLY pingtais
    ADD CONSTRAINT platform UNIQUE (platform);
 ;   ALTER TABLE ONLY public.pingtais DROP CONSTRAINT platform;
       public         postgres    false    188    188            F	           1259    49410 
   data_index    INDEX     >   CREATE INDEX data_index ON data USING brin (type, issue, id);
    DROP INDEX public.data_index;
       public         postgres    false    193    193    193            K	           1259    49404    data_times_brin    INDEX     I   CREATE INDEX data_times_brin ON data_times USING brin (type, action_no);
 #   DROP INDEX public.data_times_brin;
       public         postgres    false    195    195            D	           1259    49374    id    INDEX     )   CREATE INDEX id ON bets USING brin (id);
    DROP INDEX public.id;
       public         postgres    false    191            <	           1259    41075    member_username    INDEX     L   CREATE INDEX member_username ON members USING btree (username varchar_ops);
 #   DROP INDEX public.member_username;
       public         postgres    false    186            =	           1259    41070    member_uuid    INDEX     7   CREATE INDEX member_uuid ON members USING hash (uuid);
    DROP INDEX public.member_uuid;
       public         postgres    false    186            E	           1259    49375    platformId&uid&game_id    INDEX     V   CREATE INDEX "platformId&uid&game_id" ON bets USING brin (platform_id, uid, game_id);
 ,   DROP INDEX public."platformId&uid&game_id";
       public         postgres    false    191    191    191            �	   �  x���͎�D���)r�[F]��~� g�H|HHDH��N�o�U�-�=�v�]5HTI�l�z���{~�HT)0�+���
��`>���?�{������CZ?��nyun�"t�ߺ��H��1����+\��R�j�p�S�[��k/O!��99.߱�<����������|~y]C_�=����^�����us��^�-`��a�n�?h??lb/(����	���!�M��[��Qnwa��&h��i(�C�"tc���#%�w�Ϳ�ޅ�&$�v�K��i��(1��G�k��v=���1�1�=����{gd<�����_ҥ-��ϯ����E����-
�]�v]�5Y�c�&��nچ$&$nC�xޱY����?���ui98B|4'ms��a�� �.�/�C��W`�Au[�]��蝜w����x�|��e�B�4CWl9���aD�v�vV��꽿<���qY�q;�=���2���{*��droz���4Y?�ԇJ��F�S�Ks�zD�<�4��\8Y�~�v햣����߽����-�K��x嶫�O�n%����
��ٓ��~綄iºF���?�A{���u��Wr���;�g�o��q=�/�u�mi���z�v�^�[b�ת=d�s�|���A\C��Ҷ�~��+������Չ��� \��U��)q�<��~�nn{ZϺ�>�����N���G�b���<����ʛ��d+p�밥uL�G���Q�ܵ��������h��-Q/;��?^��v,w�ZW�n��[��~��˯]ix���2���ho��X|��AF��_��K���5��bM|����ԭ�i����u�ق��~��m��Q���0�%5���l�^��C����>���ﯾ�w��#{��ۣ�o�����]����W��|�\`ν����}v{��Ӈ����m�Ƕ�^N����y�W�w��v>�r��]:'�jq���dP��lP��b��	��m7�����@& ,��-���[D& X$&@]�p.at���s	�S���K���- �%��BB�q�BB`$	��,$FB��	�BB`$	�=a	�=a	�=a	�=a	��-$DFB��	�BBd$D	��-$DFB��	�BBd$D	��-$�h!�g$�zFBo!�g$�zFBo!�g$�zFBo!�g$�zFBo!�g$�FBo!a`$F�`!a`$F�`!a`$F�`!a`$F�`!a`$FF�`!ad$�FF�h!ad$�FF�h!ad$�FF�h!ad$�FF�h!ad$�&F�h!ab$L&F�d!ab$L&F�d!ab$L&F�d!ab$L&F�d!ab$LfF�d!af$�fF�l!af$�fF�l!af$�fF�l!af$�fF�l!af$�F�l!aa$,F�b!aa$,F�b!aa$,F�b!aa$,F�b!aa$,VF�b!ae$�VF�j!ae$�VF�j!ae$�VFB:cҾq����tc�ܔ'�����to F�#�M���~��J;�QG:�QG:�QG:�QGf;�sFE� ��*t�MGpB�7� �#u��a�i�=Mt`E���4ѹ���D�W�:xO�bQ�<��,j��t�E�C𔎶huD�S:��!xJ]�:O鼋Z��){Q�<��/j��tF�C��¨u����Q�Nƨu����$xJ�d�:O鸌Z��)��Q�<��3j��t�F�C�Ҩu�҉��S:X��!xJ�k�:O阍VG<��6j��t�F�C��ިu����S:���!xJr�:O�\�Z��)�Q�<�S:j��tXG���ҙ��S:���!xJ'x�:O� �Z��)��Q�<�c=j��t�G�C���u��Y��S:��QO��Z��) R�<�s@j��tH�C�N�u��� ��S:#��!xJG��:O�ĐZ��)R���6��<�cDj��t�H�C��u���"��S:b��!xJ'��:O���Z��)�;R�<��GZ xJ���:O�0�Z��)�IR�<��Ij��tBI�C�*�u��y%��S:���!xJ���:O��V
��Y&�p����4�u���&��S:��!xJ��:O鸓Z��)�zR�<��Oj��tJ�C�BiuH�S:��!xJ��:XO�]������U`      �	      x��]�q$�����B��$6�m��,�J��t�}��tf�� v���k��C���S�g����9���
�
��G~�~�>��@�g����e��k��_�o� h܈��!����<�/�a{��7�j���!���aO`{��������(�j�Cu���~�-�B� ��d/�����@��[�����4p�����D����c��k�Ə��{���C�=�f��!�e?�m�}0����$=�^b�<�)31�`�a�~AHa�4��C��_k,5A���#C��Q���=.:yO*�}a����qS�^���nj�3	�7f:?mq���D��c2(,أa;�`���r%��`φ��o���om�e�c"(4ثCз��u?�	�^���?c��Ŷū��*4�ג��bC5ٰmI] ��)4��0��ʞ�������
�4��d�}5mi06�*4��0$��*/b�6Br�)4�kyLE��צm����h��{�l�����A��ۥ��@W�,���/��ޮ
)�cr+4Ph �ez�E-)�B�![!��[l�rH�����%�\I��L�}��џPX��c�ki���k\��
T;�m/��1��G�K�0�W�>�t�4	в������X0�c؈`ʍ�PSnb���o��Yc�CS�h�á�\v�n\0�0�Ia�0�\��R0�1�0���P��e��`�"�Ǳ�l'���u��}����|i &҆�O��azw�N���8
��:j'�)�ܱ���Y0�1�e=�6}��`��Yo\#�rc�)l���ݠ`v�L�:�)E|�Ι�c���ю1�f�"�5���HfvYS<�+[�G��2r�b1�>c����x
�s�aT���x�.��g��w�@ǰk�ئG_��A��Ć�}j< ���̵�k�7�5]�sV�)�<N�[�ʒ��1s�
�_f�PlS��7�%]�1�U�����2���,��Yf��s&oכ�tLo*˳�aL�Ҵm�I��sQ/ǔ�Y�aХ�KK:¦�o*˳�a(0�j���ASVo*����-vh/!���|}s٦x��?���c[>�� 沤(��1�ͬ]�8�]��˚�-t���t��>�1LYSԆ��l���!�9����6��;�۶�@qØaSQ�[�Q��s�!�r/�M�*.<�k�ڙ���n43ٟ��7��j��)~�B���8���o.<`hS�fT�?7���"kƆA�v4
�S��ݤ���A(^��Z��B����"6��#v�8E���j㜦��b��q?f:���rvE%Uj�AܪZ�f���C���-Uj�0)5s��H\no)�GF��AB�����rzt����C������]v��,خ��{&���#�eEfƻ�����GB���eI���)�6�U]��w�<B�1IO3�\��2߻�@�a07�62�9�V�.,i
���c#�B�i�~.ڻ�z��J��0����N;���@�ޅ{4L�MI%D���i���cg�r���������0%��}BzXN7-4��0I���2������Zh�/��5��]n����E��D67�9���iv#������[���
�0f�!L(^-<��5o�'jl���5��0k��.3{_;����5UhWv +:��	�QU���|3�����6K|�yڣ��RQ��������/���,���^�D��N����T�U����`Ƕ�vF�.ۙ�,��:'*m�8�*�Q�U;�]�{F|QF�9�ºoP���V&�W�v �H
hv������j��v���]X�t���̡�λ	�nؤ���d�>��h�˛q��a�B]�rɼ� ��`��,~����O����I۽��i:�V���j.>A���y�i�C�r�'е/�.@+غU��B�t�˱Kyr��
ew(�����	ȃ���l�1w���{�O�k_�P�(6�Q����F��w������B�����Z�� ���kG��q��Ļ���s�I�HNeе�|^��S��mLzD��EıTQ� �A7<n�Q�P��kFTb<;d�U��*�Q�U�:�v��OM��N��1Wa�����Q\s��.�U��|�ۓ�\��Do���J�N���82�@��d���av��Q�^���0��� f1���������h��9��Jx�۟� 4Ӿ]��N��nL(���@+\1�f�2#NX(� m �oZ��.�����*���@:���C�߮g�ꉠ��5Bx�xb�ʯǥ\����B�J�X`-�c��ƅB�Z�{P�	�On�B�J�پŽ^iB 7��a�;�A���c!JQ�T�T9��\X�7!�ylG����ɱ���0;ϕ�L�B��i{R��a�nT��M�X!�@�ubt�\aa�`��N�z�I�QME`a�p��L��n?d�D���
#D:hzVEQe�/�xr�\c�Oc�z�AO��A����@�1��ٖ�I�{4P
b�rF�C#['*�س� �L��#�/*�ثa�l�S�5����s�&M^&��<Z�#��b(|��ҺWr�牒8p!�k*|��@)���_��X�x���A��d\n��I�["��q4c2��&>�%�'�D�z���΅
)� �k��΅��c3����1�T��@�K�;9�'>�-�ut���雑�.<.�P� ��d�B��b!��m������-��/[	��M���h��CI�"�� )��@�Iq3�!����'g � q�5-�"�=��a}@k5a�II�ş'Nj��Q@�A�2�M��~�"4\OJ�(�6���}o���	�2�> ;g��0q�t��
�2��!r�m��)*B���u����eaze$*ԫFT���'�;8��E=y2�0��0��f���:�b)��&�d��m\�"tA-�RQm� Q���4gfm!�^S
#�^���c��{���0��R��|%��h߅x#�jf񶝛��8�wa�Ziy�Q>�R�c�]A�� 1H�m��&q���Z����N���+�]A�@y�()(GP��݅t��{f�0��8�S����� Z��㎑�Q�0waiy������ L�O*��[������ϴo�O海�A�'�Wg̟��8�0���ж����ǻmB-�`l���p��ta�D��F05P5@D��6tPa�\j��w�W�Y��)��A�#��!�X��+��:��@�bs� �E�\
����z5
b��j�þ���J�e��}�qj���ʈ���k�0V �n
�4����|���݆)dػa0v��k�"7���0�[&]b�
�t�f�(\Ћ���1=|�fD!�(\��@+�~K;r��Y�@����Lt�[i�|����@�^�@� ݈j�]ã��I�_P�LfCf�W#���@�^��Qָ؏S|����jq%��6�t��ġ�z"�:ǽ�p*<ٽ`��O����9�/��h'�������D*���	Ќ�5㐢�r�3h�{"�z��)�1�j��ۨ��E<	h5��Iٓ̌g
�I~���y۔��~�lkM�#|F�6e�<�����SK�O*���A��d|P����=8#f_'��ٯ.�)'���z�����D=+�v����N�0����5?���^�fe�7R9�(�����5��+��U@���hC%Wz3�w���H����rk�e����g"�F*Da��>7?�oۃ�@�c�/&���a�8��'^�@������f�z�P�da��o��A��>f���'%ak�T:H��&s��L����,��4��f���I�꠬��*���Y��-�(��a*�������V����
!&5������#2�P1���)Ȃ�\�]/(���A�xW:SonR.(���� � �Ar>�ׂ��r)�ԕ�M�m~�I��-Y-tX�#r[��Bzb�A(tX}��!�;=�Tq �:�:��{��s��q    u{;,l ���ɓ�����*l�ka=@nny^p㩭Q�[� ��":/>��݈�/,d i���ְ���Õ��B���nU?�N��4
*�6HF���<��PG%2v�ծ��B���j�F.l��3vc!��
G�##��*�5�B�Z�0��ϴ����:6�����L�z�qQaR��
4<����0�����0t�69<��d+K�(�J�3<1렫�
���];*'V�eT��@٣�A]��p�b�Q!�Z�M^���YTA��2|���XQ�6S�Qa������¥:%�ދ#����$��w?�{F7�
�p�v���� F�4�	����YLth.���@����N%��sqaie�f��pJB0
�#�^'>��B'�A�Ņ��ˋ�r�H�f�������3��lZ\���[�F��z�i�y�%j,�Y���A��̪[�Pr���K
#�V,�D-̄w�&����F4P�d�'��T(YF6��H�jV�eӒ���H���S��B�6Ia��_�oBr�l~K
!�^-���W�e�hI!�h�v2��)Y9'�B��@Zy�o!w��-�{����kD~f��I��Z�,C�8���^���w!�ƿ ��K3)�\2��B�-��6;
����*���/��*���OV)!v!���㱫�y2)��]�!ļ=���ߒ_2�2�u�
������N�����e��t�\@�AQ�¦����Z[
�D��]�����{Jb�]@�A�׬��da��aļ]���p�_��sh��0����QL��,��@���dN�� ��utP��&�]=aS� 
(]A�Sӻݱw�Zq;3
WP��^*K�)��0�vf�E�E�דx[Zq;3'�@��G~�0�8^�0bvFP���N�RY~��0bvFP4.����zY���+�����̎б�:&����S�y��<�(��^��k����t�j�,�p�'��C+�7P�� 9�^��5��]��ʃƴ�j������tuPR�3���'Qqe�f;������T:H:(T�F��)��|���iE�xf�~��ե�H;(H�Ň2#B>�7���i`��n�ۉ�x�f!���(�4W$�)c0!�M�y�g{ӝ�O}���,���A!=��= FQs���4Cz�h�t��B�I�d���Д��S�0�a2��v�E��:M0�tP0�˲V�|e&��(��  z3S�f����mk��+�%
�z�MA�S5fv:��^���a����~��*�t��au>K��;��1�@��Z��}��"\�@L?V��� �v��,�5��B�%��2Ď�O&�8�
#�n��qe�SOO'5�����Y���o�7����iΏG�g�����Va����_�y!�&o]���W�؃��H]� t��Ծ)+(�C�0��2gi��}V8�qN�0��2�<E5�\\Ra܌Ⱥ�M(��s<�0oD_����s>A��[.���U0K�M�Fb>sT���:i�l�p��
!���S�"���(��[���zϪ��g4��� B0�'�"����7cB05}2N:!�9D���
!����{�T�Fb$@��X��@I���3�ى��(\;y�rֈ'HX$Q�Zi�s� d4Pڔ�AaSԧ�(�,|��@��G���$#��X� ���x�{*�.dT,�(=��S�7�r >6�:{}��=�w��A�B'"�949��@���n1K�������A����jdK!�d���G�r���ۻ�����5Pa�h���^.�"*�أ�N�y�3N����bφ�d+�ѩ!��{�]�i�� �}D��<'��\�2m�r�2�y�P�2�'�0��d�vQ�e��@~��/Nu`cʄ�e�67PF����Z=�N-˴�e�ʆ�hXG�����L:����I�s22Z�Ig�!�E#�I� =��`9h��hg��Ѻ3��E�4���|e��z�~����y�hق5�S����7gp�>���~%�*�W6�z��38o�^�]�r~��ы����v
/��EF���B������|��rj��x����NǜvADQ��X��y{N'���w7�+�	xjop]��
StE�BL[�W��� >��L��1EM��_�R�+�v|��u���c�ʯ��$3�����6PS�I���W�o|��u���c�z�?�Β�h1�,���"eg,�}++��a�U0�a�r��bN�d( ���[�`�������h /��֞��|z�A	���������f�L����}�� ��5ӗ��%���S�4�g!D���Oa)��#|���'B�L��d�����땎I���5ѷ>�3��s!N��u>�-<��7���g�������?A�L�
�"�����/�3nĔ�B9�r���� O:y�o�'����U�@�@�5M9<Ź~rԄˡ����ȣ�vJ/��IИ�W�����){'�r
���4���$:�и
x5Pz�f3�攟y�E�
!��+�s�~�d�m0
!�mK����삀B�:�e�+|���
#�^'��d��p ̕�P��@�{_�A�=��F(���@�.�\�{�9�rŉ����_1�|͗��
#d4�����T,�f B���q�aK���V ޮBnB���n����I���An��z�޾�UB;�d�y��=4��Tp�@�����j>��V�=(U>�k1=b��^A��S�cf��y��e�J���X������ sy�~:v�ٱ�A/>�Q�''O7�'K�]�!.SoSo��̘�O�����eT~A�1tE����;H:���F����I����e��}8�J��ﴮCC<����������x�1�q�e��yh��+0*q"���3�.�p}�C�E��n�;�/!�2��XE��b'���>� \���ۜ [&9�#.��@�#����@R@��ܥ�>���1�.���T��ՃOTo�	���y�������0*�g�I�1g�S��y���ݠt
�C�?�+pه	
��-+FZ�)��Ə)��r.��}h��Ls��N�=.���@�d&N����+��{��>\�Bz��䈞��B��ɹ�(���)n� B 6Ph�x~���
�BT�N!���@��Q.l.�@i )�ޖ�3�S(<�RA�2�]4|���C_���F)����j���Jz�S�I�<(&0������ZO
!x5�I10�а�2z�R��@7M��ڽ���(��A>�B�����K�R��@1Q���.��g�jL�	���U�Еt�F���dKe�;��xRa��2:4�N�녻�#d4���'�W&;c����A~�9���d���qFȽ�1��= ~��0�v!�@�d$Ռk��~<�O*�l ߃��)sا��k�qB5P��z����l�؅���"|z4%���v!�H��i�̊��d��@�r�m{`�*�o��6�.�m��`O��c:6�B��@ǡ11p�<F�B��@̶�%qxjn\-�ث�2Q�~h�k�v[\-���@g���	��8<�}1��ty@8Rbi��7Flj�y�^Q᝽������3z����p�B�-�}:�>n���<�P��w���d">E�[5P���:)R�nԬC���Q����r��Q���q��(|P�B︉��Y��%�4
��C4�;�"⑑6�*i>�n���WAJg��O��Q���A��.����DO���r`�LA��|��G\@��¸�+�
�x�.)��@���'=��3�*�r�P�y%bL����*�r�	(/:���YBO�.�����^т�6׾�	T��1��c 7���?���sWuBd�����k���NO���@��R�������K���&�,���˜U�3`��������y����G����(    ��1Z;W(z�x���Sy1~�l}����@O���5>SwE6�D~k���$��0/�ayʚ���H%^>>�n�;=��j��H%^>>�n���;��
f6Ljd�y����0�j���fě~d�V�@A�_�x��(��*| l�S��ٞ}z���U� �@'�$q>�H\
AB�M��	�~�EN�}
�\� ��s/Cvd%b���
!`7б��Q<�B������Rz"���M�EP���2xaÎ�9l�tF�l���� A�i�"(����!����]��@|����}�#�b☜.���ʍ�,^�E?�wF 7�Og�U�l�89Da�����,d�H���@�x3":|�̳��t�#�0�_�����t"��$,�@m�����X��h�I#h4P����~J<�k	#h6ЙS�xC���9F4P�����O�%�����)���VĖ	!�&3��ޔ�5�����"���N�#����
B7�
�O�Z�qjdp	!H¸f�:����
!h7�	��^g�?Dڄ����R��4���k��
!���g����({$�D�<��S�tFx ��"���� =��"^y���YB06Pj0��Ì�K�*�`j�����z�L��7['*��{q��w3���2�����a��E{��O/�#*�`��׳Sz��'r(�ط�ճ[s�����([VM\��W�|-QW���U�U�t
�g��82.0(|��*�/���'3V6�%�x���>)�k��N������>���a����D���c���~���GpA>(5�WPr|}.".|ЋDg��2�N�fj��M�*u+S��;L7#<.���@�Y�ٯ��~{a Ia��_���i)~����7=�J��4|�4\��-q
>�J�|4��hv6~�3�vP@�� cL~�����``AERg�5brN��}"�x�h�$uc��d�ÿ��^�,�X�%&C΀����H%^�S�2H���S'���T��Q����!�[@��b�B\�D�A��!v�mރ;�T��H��F��%�{,�)��!fDf�x+O=�]T1� ��)�_颅�#fD����N1)�3d�vaD�����t��3�֯F�2��F":�D'1Gc���$.��@i�#�9��0�	U��ID�N"�NfnF5t$.c�va��#w����a�=�J��@��W`���8OsA��O��.���n'�6�q|Ԟ�a���������o�=�i/�	U���gl�)X�6��EΠ�'TI��N���M0��GV�;H��U���L����������)(FV�>��F�������V�N<K!`5LZ�ʃh�ۙBi!@�I�`O�o����)� l�L�,7V��Ю"xB 5PF�����N�1gB��Lq����i[�qmB�4P�噊pP&���QQ�b:.��y��R̬~��+�������HR<�ge��z8M�xR!ދ������x�)�t�F 4P皺�S+t.���Q��=���qSSaRA6fG��d5��,��[a��$nD7�St�W�������\��='*���B��ͮ^��Q�C1ĉg!ce3�Y����B+ω�,�`j�4�|�ڤ��o��|�\��){��y9cC\z�,4cgx��$�\�5!��A�,$�.���=����s�ހ�r�]6��,|�{m�G�F���̈́�
!d�y�=g�|�F/�B��l,�z�U2��
!(c?n����j!��*�j����@淋l�B�/ȯ�cSa�짊�wW�HÜ� c�@�p���A�ՓF�6\/=w�>�6P�)l�?�'g��uB��@+>I̭z�
a�
!�l�s땂����ձ��B��ω&>!�	=Y�P���2z�S9N�Z$<T���u2r�>L�W�҆`(��� ��k[%��Y��P��� ���ZQ���lq�0b�J�W�s;œ
#�6�9g��@�e/�c(��kqO��kO����]x���Ƿ��s����7b1F(��wF�8�.,�Pl �R&ۛ>���6[',�Pj�dx]�:F�e`,��{q?�ōj;"��#T:(xF��R��ca��:�*5l���S�
#T;(�������'XI�N����]�\
hv�&�cPR��|�7?�J��G�.�ߴ�q3mO��te���p���	Vҕ��������W�q�F��`%]N$pm����a��+�mq�`%_8��h�_��3�)��'X����L,�i15c�q�<�J�����{%�i�Ȉ?�J�z�?/0�o��J�?���*�{�����|i��?_GR@�����M�4O��/�O��N��ï�L;��$����[�b�����+��y-��i�)4H(�\���i�� BT'��RVs��6�>}ds!�:�������Z�T%>�j����U����)|����Xr�b�WT� �@F�𒮗���1������9�E%o#b.t���s�;�{;�m.t i��)>���V`����"n�iU�sS^��R؀����� ���M)�8��Lv���|����5Ka����K>���}����L�*|@n�\Z��Ly%��>�4��Υ{!��f�B�E��^ã$���ΠB�6P��3���[ٱ��4贴�K�7Ψޅ4��4^�r,�p�va�J�b�h�;���6F4P���N[v�^a�[�<����+�>oWA��r،6�2[����]��/(&O>q��pû�gͨ?��eHV�bB04P:N^zokB0vP�]��
�tӆ�
!��"�o>�I'z^�����!'�d/�3e�`�K�XX�T
���<q5�>�n�4�Hq���Ҭ����m���"���
!d4P���T4'e�B�l���D�r�\%-|�{_|F0x���Q�!���:z6�ԞƵR�`e��l"3*�n�'��BtF�C(�Uc���B���M$W�����-��A�a2��Ӑ��P%��An>�%~����~�-O���
?>�z�/��f".�3�Ç+��'i2�@3��/�'Q�� ����u�m}	!�*a�N��m67}����'L)��[0����l����*r̎���y�-�d����4_i"��.O�R.[E>�t|R��s~��⛞8�\�����H9n��z3#����X�O��-��*�_'�����.z���������X	E���ӯg���������(��M��
!jZN��I������Vfaނ�ӗa��rn��x����ף���p��eBTBNO�����V�eZ�4�w�R�����/���@y��R�|�연�[��]<�'o�m�
�C\��KK��� �^�����	7���uBV�����3�o7��z9����m�����ӹ��+|�[xqb�#��+Ɲf�S�@�|83�$����B��B���s�#��(�� ���כF��9{پ	
!�#/��5��=��B����T�J�,�0F@aľ�)�%���)Q���c{�I��:(�d|�����Ӿo�0bs�X\c�����@�-����FQ�F��@��g��3R�>�@a���1����e�~���
#�by^�mF	��u�I�0Bg�e�D+��,�1A`a��Z�e��'��ۄX��@���X��0֟T����H_'�����	#tw�Lcj9h�.���⼭L s�Mv�����h��+�]�b�i<I
hvP<	���NoA��.��@���� ��sǆ<q������!&��W"���'Ny��>?׭���렰"b>�[�8�uG����gPqdh�
��r�L!�F{z^�,O�R�R!�R��Dr�e�p���~z�r%fJ ����	T�5G9@y)h^^rF��:QaĤ9����뼏�A��(뮅1�X�4|	FL�(�=���n�#��AA#�Fg u  r��\.��]�[�b�w�$�)\Q����/r]��^{\��'P����q(K��Y��*�U���tcW,:|VCD�8�<��}%%(kg����iO=��}M*ޟ��B��7�&|B���T�����Eݧ�:D.$Ĺ�%�+?9�ȟ�h7�ӈ="����+��FO�r_q�ILJ2�_s?�4{�`�&(oi$U�Q�,'�'X��I�	�����g#d�#t�F�{q�Ps{{���,c�F��@y?��>��s.�5Paĺ�%]f���r�C9 ^�0��%��{�����8��ۥ0bqA<��1'{a: R����:�5�>�s��"�k7��e^P^��M�"�K(oT�ҋ-gx����.���q�ǳr�~\��Jy>�l��<a3�s΄�؅��3����E� &�Jx�x����� ?39��KN�Ͷ�.l j 
r#}6y���ٰNpŘ
�z�T� �@3Җj����Vv�h���~��5�a:�h Lg՜��t�-�:�l �9`�s���j�>ྲྀ�Ϙ��9%�ZA���s���,0�?v6ia��l����L�0���..���y��0�nQ�ةǳ J���l�������`f�i��-� �� ��8Y^4R�ka�딕m�t)�η�:O#xuP
���i�yh}����Rw��}bQ�R���Q��@��Ta���$?f�(�`j��=�Wq"���{F�	�T�D'����,��~L�z�;۞}q�(���@+{�7����Wl�Gak��tq�_�ﴭ�Ga��� ���J"��(������|P�Y�"/���A!r$�;��'�b�7����Y�4���\'C*�l����%U�ʽg�ܫ�fn���L�fa�h�d��
�	��C�ga�z�r�*�JRaÞ[����U(^�ga�^tno[:��Ii2lh�P��%$9�(o1ڳ�a_�^a�L���V�`�Þ��(�:��+]�Q �W!��ʪV��|ob�M�
�4�'�d��~����W�����e�:&7�3�b�B����/��JpLW?��*���@a�F�h��m�oW���1�[$>�">)2��D*���'
��;pW�y1	�D*��]�S-�$�0����T�y{M��>�AgH��v��`���u�2b3=��=oO+�G��>T�?CgB�?��=oO+A�]������*�}i���u��Lenk?��}9��8���H:��D��'P���@�/G�a�	(�'P�/�=@�\A�:�BF�a�O�R/�M�f[1�-�rJ��cz��S�e��*ć�R�G�5�O�R/�M?M���HgB�Oh�^'�l��uj��ԫ�D?�ͼ�z� 
����O�R�R=�������:'��ԫ�D?�$�D�^u�3��z��S��SJ���:#�r��~�z��$���|&�+�(���)�2x��������r
�TA���ק^N>��j��0�Ve-/�W�̆3aaA���Q���5\��J�OC�h��������z�e��?w/zSaq�OQ�8�SF�DTA�@.=�������I?�
#h7PJ϶�ꙁ��M��C� O�F�~�"l�B�	��m�I>Wd�\^!ce�9h^mH'��r(�`�rUi;��(��R!����O����W��@���J#Z��:s�8B�6�<�ɒ�-d���B�Ii��!y���!d6PN���3��sgL\!�v�g�qc�ޢ�@��71��
1�b�;�0B��V>�;��\���ͅB�G�� 	�Ó�
#�;(��ݑ�>��I�"tL^����7FȽ��k$�'���V�F�6P�4�V�>���q�}Ka��R��sCU\9b���D~曹��<��$y����� ��j���·��+��K�Y�ޟbN���nGAF�tP��{Z�O4+�[)���@���}��µ�F�v����:9�a�e��)��o�x�Z��S�e��S�?UY�Y\�+�O�R�4Z�΍�����͞��*��z�S�϶���g���Q�'R��ի�T6��fJ�"c*�'T��٫g*ZhX\�,��zX@������9�d?�J��^����X<��31����*�J������w�����H�^�:=����\���O޻�*������Wo�����]1gI�E�Sx��B��h�#w�v����NZ1�������ʶ�BLl���P���6�a[!&u���a��+����o-���@jo���a�$�L�Z1���#hO�1�7����
!f'ę�I�ۧ�ը���3©1��~
�jaDI'��I'z����ڟ�W_�#֨��/�-؅>_�3����T:h5P���ggfQ���ttP*#;pOf0G��7R� i /n ;���a9
h7б+��7Yd'�~#��"�&��]�>��4��)�����[1^�/Ќ1S���t��F��@R@�A�r1s�}��M��K�	����%��K;(b2^�� z�X[ga\��N�(Ә������0f��;ӧY��:#`5P��h
�{�Yga@�@ �Df<�Ko,�Y�A����G��]]+@�@�9���X���;�WQ�[�� �7���|�O*� i�yU��쟧��A��b��O���v�yah��Mi¯L\����0gyx��;��HT����)�U��oA���U��A�NB����y�U��@+
ռ�s2Bv�*�@j Ȼ��ĕ�gN��uF 7.�.g]�3bF�-r<�M�O��ތ�N��0�V��+"]0~��a��0����ɴÙ���=]�tK���F�c��i&=(� j����c����^���J��kd�FM�X
#hwPD{�~}:���@�|�0>���;6C'���^��ɣ�����x*�`��nO蹴8�F06�v7�<���rU(��[xrXdv�׷���v��;(�>I8�c:E��W(���۝�T�������i�V,���A�#��y����ܸX����>�x�6��e��X��::(4*�]�?y�	!t6PJ��ͫ9C�Ca!����-�yS\�^!�b�kl�$yɷ V�B��bz�L��9���	#�bD:�	�H�euȎ�+���AA���9��|3֩0B��8��Q�b��0�eUzQ���d��^ҙ͚��Y@��(����7s�dJ#�'�pj�Fz!=�5z��� �#�3�?��(aA�o����yF��7QqyI������ �o�2b^vo�s�#����>�)��o�r]�l��d;��k��E{��7b��K���&,R8�		�iAA�H\��=}��o�r]�l'(����\��鎵'������?2��Y      �	      x�t]�$���}�i�p���.�����Q���mFm�0F�����u����ﺞƟ�o�Y.�����������l���}�Z�y6�����?�ϳ�7���Y�ϳ�w��o�g�y6���~�?[�y6���~�?�ϳ�W.���E�l�����=�t��_z\��.���_�_{����_|�/J�R���/���*�����E�U����"�� ����F!V ����G�00~Ѣ�P3`�?�E�n�_<1��G�00bУ�p3`���q�Ɵ|�E�π>�c��g� ���3`����h�0�G����W�>�w��
���h�U`����D���+��a��*0�G`��
��F�|X��bl� c�0����,��a16o�5`��E��ր>,�捿�Qcl��k� 5�捿� ����Eck� 5�Vcl� 5�Vcl� 5�Vcl� -��bl� -�捿:���x��h16o�u`��c��_�h16o�u`��c��_g(��������cl=���cl=���cl=���cl��� #�捿�1bl��� #�捿�1bl��� #�捿�1bl#��a�1�;��q���0��c�cl� w�������Ec��>��7�n`��c����1cl����>f��70�ǌ��0�ǌ����_���؀>V�m�؀>V��L~aa��&0�Ǌ�y�o|��7�&0�Ǌ�y�o��a�.D�o��a�.D�o��a�.D�o��a�.D�o�L|���c��b]�����b]����c�-օ��ź����ź����ź����ź����ź�����a������X1��H���>�C.�$~e�˙�E�t~���\$J��b��ƶ�*�O|���#Yڟ+Q4��ti��\���""=�9��H�.bң�󹋤iZ�b��6Ҧ���z��O�����9},�*�9�"���b�ƶ�������)�?-��hlqٟ�*�9�"���b��ƶ�������)2Y�K�~���K!.=�9����0�����ضA[M���ߑ!z��4��1���~G�Hu�i����;�B��������$C0=���K2���A�$C�>��
��[2����&S�
��-��V�]� a���WV��^��`dF`��y�03��3���<��Ҍ���Y3�2Z�͈�&g@7#.�v�ˀq%Y<̈˸�%�*q�+Y���>���*q	;E����XJ��c�J\@�e۸! �<{㖀����M��A,���߃�7$��)�Aͣ��Z�	�mi�A���v'd�1k#�`ֈ6
q�F��'�g����|�Dk�#:��5b�JBH��v%4�:1���N\��8(�u���A����zn��Ԟ�z�ĥ�d+`���K��u��>�։fűY�N\�lql[���q��l�l��cf�� Z[7�Q���� .�N�6�q��l.m�dKj�� �Y�Ůd�k7qA�>6�vD�c�m7q�*�ݠ�M\��|��v�J�d��ą��7�`7q�*�M<�M\�o��Y�n�RJ�䰛��+I��$.+ɧ�$,3I���
�dnlj�J�=6���M��,�45��l�%KaM���nl�E�z��iȹ�Rr=K�Bn���°�ha��X��w|���ۅ#����H�ߝ�z�F��f�Wݻ�����w#���$]GJ��
t��o�^���,cw��ײ�� J�rv�(#K�]���Y��dg�yP/�Arv��.�aW2��4H;����%s��Ab���l-�(� �I �h�H�W-@��$��4l&Ѳ�a+	�� �z%���QKҫ�j�JP�S�&H5�Q[��T�'�U5�QG��U�N�j@��dM�4�J��j@�]�
^h��,���f	_�h��ЌZ1Z�Nj�'��V��Fj�N(T�@�̈́y�
4�J[�@�_	ϫh����ڀF��U�4zM�hm@������ �Z\��#aӵ�~'$�6��g��k}%��6�1�d�P�%�`�4�%��ځƨ�v�v�1Z��h��l�j�z2�=W�@c��V�v�1f�ëh��lk���'kwI��u �ے�k@�ɦ��q�d�\и{�Ůh�#ٙ����N6�u �{&y�:�ƽ��A@cf�:��,I���@cZ��7И5I��h�)���������4�S7z#e;u�7R�S7v#e;uC7R�S7r#e;u7R�S'Φ3�S'�e�v�Fm�l�N����	r�39��L����	 r�3�D�v����9�Yd�)�Y@#g;h�lg�'R���F�v����9�Y@#e;�)�i�H�N��F�v�4R��.����v�����S$c;�)�i�H�N��F�vZ)�ih�l�q���V�F�vZ)�ih�l�����V12��
�H�N+@#e;̀F�v����4)�i4R��h�l��H�N3����f@#e;�@3��h�l�U����V�F�vZ)�ih�l�U����V�F�vZ)�ih�l�U����V��dl�5����րF�vZ)�ih�l�5����րF�vZ)�ih�l�5����րF�vZ�򚱝ցF�vZ)�ih�l�u����ցF�vZ)�ih̖����R�ӕ�=���JqΑ��)�9��+�9�ڷ��\I�[W�s]I5[W�s��j�+Ź,�N�Jq��T�u�8WK�ͺR��'Ue])ν�_����S��97�Ǆ\���Y�ITjّ��b�nّ�뢐r�QE /:�eGA���˾X�7~�s�+!���y�b��y��c�Օ�MHf_b�5a�}q��싐�L~xf_�Dl�C4�m���9.�RfB5ǥ��J�済�]	�q����q�O,���"."��9.�³�/�q��0�q������X~8�(�E��C:�R����9
q�WB;G!."��9����Q4�j�<G!.��9
q��p�Q�K	�F\D1?�sq����a�E$��?����?:���f~�0��,+�3�"����YZZBG\D5?,tq�������淐�gsd�g)���n~���Y���<Ct��ᢃg��8?dtp�����F��U!�'|t���CH�N;?�t���CI�N<?�t4�2����F\D=?�t4�"�������/���}~��h�E���LG�Z4j::q�p�щ�臜�N\DA?�tt�r_	�,su�ᧃ��d�A,uu�a��Ů�C?u��Չ臣�:���1�H�	K���3��c��O���+!�c��S��̬tn�"B��c���:q�ss�v��f���f�����4�emKd�̞�߽]�>�z=�m�������m��id�گ�-�)����il�;��ۮaOc[@픁�c<�m<�%)��̧�MA��2�ilP�����4�	0xn;̯�w����/�il��\A�L4��'���mO�Oc� �g�#��,<�����M �3pۍ���&�����|�4<�l=�m�O(��mOc���g�w�O�ﾁ�g�6�Oc���g�P��4�	hx�r���&���Mu���&�����{c���g������&�����x�4<���5�	hxn�[��6q�(��-O��@�3p��T���6���/隣M@�3p���4�	hxnY��6��u��7�	hx��il��\�oxc���g������6���o~�m�������#�2p�S��4<�����6���eol�����>�m�����il����?���hxn���il����?ճ��M@�3p7�7�	hx��t��߼��g��O�5��T���zc���g�����6����+{c���g�� ���&���=��4�	hxnbY��6��M��4<���z�4<7��7�f���D��4<�8+��M\O���b�4�	hx����&�����z�4<��=�m��[p�hl������&����4�	h��`l�i    �Mb>Xm���&�!�����&�!޳��֞�6qy�����4�	h(���>�m"=�ͧ�M@C�g�hV��6Q�����4�	h��t�wOc���jƑ���7+�P��������%�f۸ ��t�ŵz���'ǳm�<�����
���k�ۆ�`���h���b�O�f�0GDqz􋟇`�T���l/{���`���0%ɼl�SR����H�-e�ۨ��J����3��dQ���H�G��g�r'��m$>*����ܗ�**YFd��
1{�Y��en�(�т����L"$��nl#R�i����$B�]��F"d�WnObDO"���7S��D@�w���3���#��U�!��g6"TK�u�F"���G��gjzeU��H��ʷ���I��`2�H�������L"T�z�jD�r	��9��ىPͲ�H�����?�Iұ��F"Դv7>?�i���Q��a����$B-�2��D���\w��3��/]�ݥo#j\�z�I �t�ŷ�u����gB3_{0e6nK�����6�H2@��W�ӿڦF?�~,6��Ӣ�E?�͕��ѯF?�š7�@���C��mѯy?2�,r��i��;�EHt��Q��={��w��k�=U=�Jda��:z��*1�|E�@�&:E�W�Xo�S��Y�\o�X�`5z�� �ӣg ;��i9���$B�C���N��N9�g`˛�Зc��i{o����o� ]��`�+��%�-��u� ]��`ˋ��%�-��y����"B�-��3�]DH�5z��I��E��viz1�Ѣg`��� =z����A�lr!���E��e��ڃ�"B�3(�ӱ���J�tly1�rQ��=��t,zZ�$B�<�!c��D�W�[ly9��ߓq�=�P��-z�&={�$BM	��٣'j���5����ʁ8�5��Ջ����[�T�L����"�yƢg`[�PW�&z�:������i�@D����.!���"��N�����^'B=z��3]9����
�g{�5"4txv�1z��ӳ��$�%z�F���E��ֈ�`~Ȣg`kZǘN��3�5"4t�*z���R(�������+[-z���b��3��D�&B=z���LH9�������,Ƕ?�V"t�>[���m%B��t�l+�E��g`[�ԓJ[�l+�I�k�l��I���m#BS�<z��M4F���������6"4�P���-Y ��H���x�%D
���=��d^�D���,U(�.z�MlH��g`ۉ��fâg`ۉ��w5z��-n6j�l;Z�l���v"���k�3��Dh�=[�jP���g`ۉВ�z���-�������D`����aT�1z����D�5�u.}�X6��b�Td����W|��w�{?��QS����`qj�2܁�� ,VMe�; ��ū��p�����5�f�<�o���s�n��ή�,�7`z]<y���+�x�2p��N�K��[���*����8;�.�~uk�VE��8;�.��g�}�U!V=��N��2��7p��%�8�g�b:־�}}/����8O��ƍl�����B�d-���Ù۵�8�m&��g�VD���2~��ŷ����E��J��k+b܅����ٶ��{������8��C�ٞ�[Y�q�Ёp�g�Vĺ�":��l݊h��D�ٞ�[�֚�8۳y+"�Zg{voey�L����8����E�ٞ���{k]t�����ȷF�ٞ��}ket���跖F�ٞ=�]��e��q~6q&��1vq���L��cl���ƙ(8����ٳ�3qp�����g#g"�Ei�������Ij����x��G����x8����ٳ�3q.����g7g^,�u}��)�E��Y\��dl����:W��}���J��EǹTƞΞ=���s��M�=�:!�b�:{vu&F��2�u�l�L���e����י89���ٳ�3�r.����ggg��iE��Y���e����ۙx9���ٳ�3s.����gwgb�\,c{g���D͹X��Ξ����s���=<9�b;<{vx&v��2�x�l�L���e������9���ٳɳ��&)E��Y��el����(z�P���3�Q����7)��Ԃ�~��D�7`�oUk�qd��fyMj��
��(��N�Y^�Zp��,/K-�Wa��K���Ⱥ��0��n�Y^�Zp��,/M-�_a�צܰ0ˋS�X��թ�,���Ԃ{fy}j�M��@�4>���-��Ղ�fy�j����H��΅Y^�Zp��,/S-�wa�שܼ0�U�^�啪�/��RՂ�fy�ji<B΋U�`��ժ�0��r�Ҹ�����q��VK�2�W�n#JKV7 Bi��6��hu�PZ���D(-[�F"�֭n#JW������H����m$Bi��6��xus!"�V�n#J�W������H���m$Bi�6���u�PZú�D(-b�F"�V�n#J�X7$Bi�6���u�PZɺ�D�W���i������H��b�m$Bi5�6���u�PZϺ�D(-hݜ����H�Ғ�m$ByM��92�ƶѼ3ƶќ��b��&�BO=�F�MJ�����-����z$���J{[�3)xF?��E��.�z�c�6���U�􋵘#��mԅсg��я�]fV�/ްցg�k���wr?jL��j���	K�O�=���t�2�i/��aT��ҁg�T�*U3��m�lΝU�t�4��Yۨ+�:����l!B�j�@�!?������J,�ֵ��D�<?5D݈�x����8�xF)P`kD�<�g`���xF��ֈ�e�]�H����S�ԍ��g�l���g�l���g�l���<�g`[��xF���!?��K�J�R��m$B~�%O�m%B~�=�J���3z���+�P�J����S��+j�n�7"���3�m�@-ۊ�F���3z����g�l��OQXoD�erx�H���3J��F����pz#B~�=�F���3z������w"���3��
�:����m'B=S��F"���3��D�<�g`ۉ�x~��z'B�ʶ\�!?���������� B~�=�A���3z���������Łg�l����"42�ɂ�����3z���W���hkq��)���hkqਫ਼����Łg���7�����D�<�g`{�;{9`���Yaa���xF���&Bw\pc�$B��6��&B~�=ۛ�t��'��O1c�D�<�����I���3J�I���3z����g�l��P&�Zp�ƕP�9�ҕ�q���w�=��xF��v!?�����"B~�=�E����S���0f//�8�Q�Qz�."���3�]"�:�����r�xe���\�<?��]l:<���;ħ��3�:���gjZ����q�}[�o���ۣ���xF�}��L+�q�8��a��ª\YJa�ցg�-�WX��g�u��l?�����p����7pv����7pv�]��,�p����7pv����7pv����7pώO�}�CD;<{X���E�d�Վ��8�kǁg��#a۳��!���7pv
���7p6W(�t�����8�qǁg��E���3����q�ɾ�<ͨ�qӁg�����8�vǁg����2̞)���<�o�,���7p�� ���8�{ǁg��E���3��կ�)�!���7pn��mY�i4W�ցgk�V~�}gQ�8�����8xxF��Y$<<�o�,��7p���8��ǁg��E���3��b�q�}��)xF��Y\<<������8��a��ªgO��!:��7p���8��ǁg������3�΢�q�}gq�8�����HyxF��yx�$}�e��ǁg������S}���1����+��+��Q�8������yxF��Y�<<�o�,v��7p=���8��ǁg��oO6�O�1�8�����(zxF_��6fhR)�m�M*F��>L���1���Ic    &I���Ĕ��m�/[F��ʷ Sa�m�e*M���A���m#J�鶑�u�H�R��m$B�H�6�T�n�P*T�}��Ru�H�R��m$B�\�6�T�n�P*Y��D(��F"����Q��	�(R��I��R�����R����HS��	��S��I�T����hT�����T��	�(Ulc*eW�Uc&fW�Vc&gW�Wc&hW�X���8P�h_�L�/�Z�ɝ�Q@���{�s�VP�<9k�pŶ��<�T�LN ]�mwv& �m�Y��۶��>�+l��Zc���I��P��kDI���r�P��K(Y:��J2�P��qd�phY�xg�n�Y�8��6�,�:���W2��ihZ��枡j�J�$�]k�A���oB�$1�-`�Y�0�,�}�TI6
6��%��h��W��1F��P���+t.`L3�P��Ѳ�)�.`�Y~j0�,
�{����#KdB��;�UB�ƙ�#�{��2�P�@4���"�/`L�P��Ѳ� �/`�Y�
0�,�{�Ã
�#K�A�;��A	ƙ%۠����iP�@L�e�^)3�a���Ħ�U�J�0�h�J�0�h�J�0�h%H�.2��h��W���-�J�0>�%B^��g�D�+]��5"4�,�����T�W��1FkD�+]��5"�.a���J�0>��:6�
�2`���T�J�0>�%B^��m%B���1f%Bw����y�Kc��y����Z6+�J�0�h+�J�0>�%B^��g�Z��l�?+�J�0>�%B^�"㳖Mpij���?+7|������ʚh�n%�ZV�1��{V�1UD�J��(\g�$��of�q]\YI�lR������L�
#f�3��>��E�Yy���jY��*B�Y����XM�f������N|�t����8��``v"dWV0����!߱�d"$��=�����|��� B����A����s!1��A�DHL�{V>����A��t�'��&B�d���&Bղs�ykz��hz�DHL�{�<o"$��=`�7���P��c�y�:���y!1��a）����<wN"$��=�����|Oe�$B�)=^�Tj���DHL�{|:'j�	�DHL�{:'���s�I��ʎ2�$B��N+�"Bb:���\DHL盼����|�Ws!1�o�j.�Tf."�Ӄ������7y5��&��"Bb:���\DHL盼Z%K^��˒W�"Bb:��պ����7y�."$��M^�K�Xz��."4�,y�."4f��Z��&��E��+K^�B��t�ɫU����7y���(o�ɫU�/�ɫU����7y��~��1�h�����*DHL盼Z��+K^-iN�+K^1����2"�,�7y�L��fdg�M�W���U�ٻN��u>{�i��hQ��Ӷ!2��;m�$��N�FM�셧�(����mE���YU�d�<m��_����Q��[O�(���o���Lg����/>m��HٛO�(Ͷ�է��$���w���ٕ1�E����o?m�|'{�i�P���6!���ߗ�,�l�P�H��W�����@m#J_�*�+[��6��5�m$B�{P�H����Q�+{j�P�*�6��]�m$B��P�H�ҷ�����C�5�P�>�6��m$B�Q�H��W�����Dm�"P˘�D(}+j�P�Z�6����m$B�1ݺ�P~L�n"�ӭ���t�&B�1ݺ�P~L�n"�ӭ[A:=�[7ʏ��M��c�u���nM"�ӭI��c�5�P~L�&ʏ�k�qL�X���c���ӭ�u,=�[�A��1�b�?��k�qL�X���c����-� ��n���t�5��8�[���tk���n--��1�ZD(=�3h��˷ןɠ��HV$�6���ɠ��Lܹ"��`L��6^�|{�Y��x����gE2h��˷ןɠ�W��v>xm�z���Y��x����"������ϊd�ƫ�o�?+�A�^����Hm�*�cE2h���W�ϊd�ƫ���ɠ�W/�^V$�6^�|{�Y��x����gE2h�U)�+�A�^�:|V$�6^�|u��Hm�z����"Jg����ϊd����o�?+��p�J��X�u�����"�f���gE2T��˷ן�P4[/�^V$C�l�|{�Y�%�U�oǊd�������P0[/_>+��^�^����H�r�z����"�e����ϊd(��R~;V$+z�I��gE�"F���"*e����ϊd(���o�?+�����>�P&[��v�H�*�z���Y���R�V�ϊd����o�?+��D�^����HV�W����"
d+����P[/_>+��ju��H���z����"YQ$����"kc�� �P�}{r�`����A��#�	V���$X�8rz�`��ݶ� �P�m�A��v۲�C%,/I&�kC!,�����P[�� �J�(�A��
�� �P����������A�>�$Xi*���4i�g	V���+���A��.���0��	V}�+���A�F�� �
�o~�`�{�aoBfP�
cv�`�zU`K��^a�5�0f	��W��C�+��A����� �P�
cv�`(w�1;H0T�$�]a����WFfP�
cv�`�t�1;H0�$�\a�e�0f	�*W��C�+��A��Ƶ��A��ĵ��A�A����A�A����A�A����A�A����A�A����A�A����A�A����A�A����A�A����A�A����A�A����A�A����A�A���A�A���A�A���A�A���A���u,;H��kh�A�^C���Z~�`�_C~�`�Kh�A���	f���$��Z~�`�h�A���	f���� ��O�	��r�	��r�	��r�	}�r�	y���m!B�T����}��md@H�%���4]��|� M��M��t�6�t�6R�(M�l#��J�%����i�dy���K��Q�4-J�%�H��t�M=^:�%�Q�e��{&����n[���G�6
U���x���XOJ����#)=�6�g2'���LJ�����JJ��Me�WR{���$��V/W�O����Ј�~���Q"^-�>�F=�֓��m���H���Qu���6*G>���mqXI��6!q�O��6!+I���"߱��x��8��x��8��x��g���-Dȳ{a���_�$*��yvO��-��^��!���-��^c�F�<���izդ�x��g�dl�h�yv/�1Z#B��c�V�(5`�F"�ٽ0>�%B���3Z"��=�o�Dȳ{a��*{��	D'�a$B��c��*���x�ͳ{a��V"��=�3�J�Z&/��Dȳ{a|FK�<��g�Dȳ{a|FK�<��m#B�ݓ�~Fۈ�g���mDȳ{a��
X��1Fۈ�g���mD�g�淑yvO��-��^��!���-��^c��yv/�1�N�<��m'B�ݓ�Y�j'B��c��kI��6��]��F"�ٽ0>�%B���3Z"t������H�<��� B��c�v!��1F;��g���Dȳ{a��"��=k��R�]d�F"�ٽ0>�%B���3Z"4Eǿ��m$B�$��Vo"$���>6H]��'�t�f�4��e�y�:�m�IC�\��'�r�f�4��e�y��m�ICH\��'�p��?��P�l�IC(\����!.��G�
�m�#i��6��4��e��HB��=�o�
�m�#i�K=Y�$�p��?��P�lq��4��e��HB��$�p��?��P�T=y�4��e��HB��$�p��?��P�l�IC(\����!.��G�
�m�#i��6��4��e��HB��$�p��?��P�l�IC\����!.��G��m�#i��6��4��e��HB�R�j�4��e��HB��$�q��?���l�IC�\��g�MB��$�s��?���l�IC(]����!�.��G�J�m�#i��6��4��e��HB��$�t��?��P�l�IC(]����aW�R�4����IC(]����a�3�y�J�m�#i�K�{    �6v�kgګ���M~�F�\6l�6v��lm��e��&�k#4.��w�?kc��ș-�P�l��]����+!�le��%�%[!pI1�le��%�5[!p	c�VF\2�d+#.�x�\!p�Ǌ���K>ƚ����s����K�\!p	c��o���|�2vmRS�~�����+#.�ڹ2B�]�J�A�RJ����S�~��e�r�~��e�������v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���%Gߕ���U����U��ڒg+�Pj��8�P��o�lW��o�lW��o�lQrt����*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*���v�*��Kxt�O��%.�f�T�[n[�O��%�m�/Πt�
m�mK����ܶt�
e�mK���ܶt�
]K�ݯt1^&ݧBג��j�D��}*T-aL���dx�VchZ��E�C�2�q����0��TZ��d5��e+�اB��t�
5K=В����1ݧB������R���c�
%K�}*�,%����бl��T�X�S�b��?��C��}�PQG�O��%��>u�M�|�
K�}*�+aL��CO���T�W�S!^	c�O~�7;��re���A���TqȆ�R2�!�fe����Fg�C��ZS�!�Ze���A���TqȠTY�(�{���G��3?�T�8J���A���\qȠRYk�8d��5W��,.S���)*k%~����Xe�C}J��<�<e���A���\q� NYk�8dC�Tq� MYk�8dP��5W2SJ�.9�.e����d)k����5��g~��5W2hR֚+$)�ə)k������C=�Zs�!�e���A���\q� FYk�8dТ�q��=�e�����(k��B�:L���CYk�8d���5W2�P֚+D(k���5��g~���5W2(P֚+(k������C�H�Ršm$B���6*Hg�C6&�)���`$B���6�Tqh�P�8��D(U�F"�*m#J�����C�H�Ršm$B�␍�u,S�F"�*m#J�����C�H�Ršm$B���6�Tqh�P�8��D(U�F"�*�}�Tqh��g�C�H�Ršmd(ɓt�t�E���-*�'�oQ�<�~�J�I�[T:O�ߢ�y���Γt�t�E���-*�'�oQ�<�~�J�I�[T:O�ߢ�y���Γt�t�E���-*�'�oQ�<�~�J�I�[�2y���0�Iw(�&�o)��Iw(�V�޺��W�B�ƴR��:�����h���!�
"~�lJHW|U����n�����+����F�<h;��!����rW���
#���������ѓ�Bӿ=;������ۨ�C���Ip���ʉj�fb�x���sϿ���vɁM��hϿ���v"���UNh;���*'�]�c4~{�A$�
�rb���+�ʉ-D®��\��H�����Ė"aWpى-D®�[>��]�e'�|	���Nl� v����A$�
.;��5�*��|	���Nlo"T�Ё�M�*:�����\��y�ЎW=����W=���ЎW=����W=���ЎW=��Dh�����NE�F�ѓ��q��I�vԸ��$B��N"ԈЁ�$B;l\�Gz��W;��Dh�����N"����Nl�a�j'����q�ۥ �a<�]Dh�����."����Nl�a�j'��u"t`��� B����A�F"����l!�[����l!�[����l!�[����l!�[����l!�[����l!�[����l!�[����l!�[����l!�[����l!�[����l!�[�����m$B;l\�Ķ�6�qb[���8������5Nl�a�'����q�[�e�a�'����q��B�vظƉ��I�l�M"t`kDh��+H��H�vظ�[��wԮ��V�;l\����6���ֈ��}b+��6���ֈ��}bK�%��v�'�L����>�e��]�������2e�wԮ�2��Dh��k��V��mu��#�\��O�tŦ!q�^/�xe��7����"��*ڸ�����e��,�uQ�eq�������B��u��eu�����eV�z�8��N�߲v/��*����	vyW��ª�׉��*�J�n�������UX�����*������*��z�����ʮ׉��*��b�s����NL^VQ��7��ŵ��ڹW�"�|G�ܭM�m��v�צ�6�Q;wlS|�精{�)��w��]���;j�m�rS+�ܷMqn�E��y���U���
+=_|�,�]�~�x7U#����nĹ{�b�T�8�oSԛ���m�{S=���M�o�G�;�)�M��s7E�) q����]n�D���J/8��=e|�,
^���88U$΍�	��Ĺ��b�ԑ8�rS4�B�^n��SI���MqJI���)&N-�s;7����0�mV}����Va�_g�o���[uo���/Ѭ�UX�߹���j��I��*�����~�%JNQ�s_��ɩ*qn�H9e%Νݺ<2~�{o�����mVc���Va���8/1�r���cV�K��mV����e9��Ĺ�[b�ԗ8�xK���o��Sa����ɦW���*���]ķUX�/���UX��i���J�8��=w|�,�^���x:�&���Q��Ĺ�[b�Ԛ8�{KT�b�~o�P���#ӷUX��;�x[������*��K��mV�u���������|[���>>pe/z����"��׾��j��B�Va�^78�VOc���V�c��x�cU"�*����U���~g�/�x;�'���o��Ĺ\�풟8qo��ĉ�x�(N��ۥ@q�,�.	�g�viP�87O���N�VaU^��/�x�d(N��ۥCq�,�n��N��VaU���mV�u���
�����
��{[��]�k�o����;~z[=Cn����S�V�So��Bp9��˓�|���ٳ�6~��o����w���
+�jv��r�|�,�n�wh����/�طUX�����z�q«&�mV.�~p��[��s��UX��+x[�U}���ª�n��ª�� �Va�~���
+�|�,�nz���Y����������+Kx[�U�?1��UX��Zx[�U�Z/o��j�W��
��~�*o���R��X�U)ż�ª�J"^V�v�����������T�����*���T��ª�d��Va�_w��Va�_�o���*��X��(?Q��UX�Uk<�z��ۨ?���UX��+�x[���?���~�7~���Va�����WX��{�mVc���Vau_�נ�Vau�^}[��m�נ_V�v���QѷUX�����*���{s�mV��������H��
+�|�,�nz���Y��Mv��UX��{�mV�~�A����Pm�c?���
�U�~p[���נ�Va5��5�U~5��k�o����k�o������c��j*�k�g�T��?�k*x�IK�5Lw���u�T�5TS{ME��Ee���(߱T>���cѳQ���0D���*�HBc�pt���1��Y��[o�8����	��\��՜|�
?*:���B��1 "d��"BF��m�"Ԏ!#B�2"Ծ�DȈP��!#B�4�DȈP��!#B�;�N���c@D��~�ՒT�l#��:9�W��R]�1 "TU��� B�u9�D���hg�Pe]�1����9&��h*�r�Y6�j*�9�j%��F"Ԉ�1�jD�eC���&B���&Bm$%F�H�:f�M�:f�M��*���N��Yv��U.U>B���rβ�u"t̲�u"t̲� M��Y6�PIAT�#��(�,�D��c�M"ԉ�1�&D�e����YU>B��
;g�$B��K�,�Dh�r�e��v}�����|���T�9����h��ڮc�-"��
;g�"BwI��*!PM���    l���l��}g!PM�������$�|�@5v�2>B��
;f!PM������Y�GTSq�\>B��
;f!PM������Y�GTSa�,�#��8�3!PM������Y�GTSa�,�#���c�=�JRqW�t��߾������������������������$�|�@5��e|�@5��e|�@5��e�ŗ��fŹ��U�"6͚�zL�⏵_D�;ӊ5k*�9��}��8sM��5箤�W������/t]��n"!����|sv]��1�^�����ׅXS�	v!Vǜs�]��1�bUT~G����j�'�E5��Q9�.*����iv!V���fME=���6��Ȭ��^�����sq*ce�1�ĵ��0}G%����;*�m8�Y�Y��6���ķ���~G%�������n��ӟ����s��a=F�7U��VUe��Q�v��a��J�NV��"����;*1o8=��Q�z��a=F�#�c��$���Xsp���:���].�:����.�ꘃ�_SIum-��pzX����*�:�HxQe�1�J��9(�?+wk���z�JXu��sPLN�wT�S��=核8���
�EdN�wTb�pzX�����z�JX���s��U9sP���������Eu��'/*t>�Hy�J�猪�OFR�\�hy�Z���ˋ;G%b^T�|�A1�r�c���;sPܼ�����"�pzX�Q	��X}砉���a�_���GR�]��d���AC���ھVau��4qt8=�Ǩ��*��s��ҋJ��s�DӋj��s��Ӌ���s�D���0}G%��?�ǫ����a���xf�%��9h"�pzX�Q	+��q�A�]WI*ӫ�;7�X}砉���a=F%����Ae�����8;���z�&����;*�v8=��Q��1UO�����;M�NV�W�,����cTJe^��;M�N�wT��pzX��o�ӟ��������~G%����;*�v8=�Ǩ�U!V����-�M�j��pzX�Q	����c����a��J�N�wT��p��A5�v8=��Q����a��J�N�1*a�~�s��V��"CN��9�)r#V����cz�܈�1=Kn#�Q���F��9�yr#V��D��c����a=F%�jIn^To���z�ʏtk��������x;�������筎j��pzX��o�����x;��cTª�c�����#�������V�w7�98��w7�9(����;*�v8�y��x;��������~G%������o��o�ӟ�\�����a=F%�:�:�x;��都T�c�����4������~G%����;*�v8=�Ǩ�� V�o�ӟws�����a=F%��:�x;��������~G��To$�~�����a��J�N�wT��pzX�Q	��XsP�N�'�&���������x�JX�z��3�*���u~����M�Z/?坠����pzX��*�n�	���*�������%�U�x;��cT�j���1*a5u�;*�v8=��Q������U�����a����y1����*������Z��;�x;����U�x;��cT�j�����pzX��o�����x;���V�x;��������~Ge~���fǨ�t�X}�`o�ӟw�jo���z�J��}�`o�����x;��������-�Z�����d���p�rֲT�v8}9�Y�x{ui�cT^�P��q���W�����:�1�����,i���U�sP�N޼�U������J�N_β�*��/g]Ko�ӗ�����W{i���^�A��9(�^u����Uw�9(�^u����Uw�9(�^u����Uw�9(�^u��^�;����Z�{��z�K彼cF���0�V��������1�Υ��c�^�;���J�a<栗���1�۫�0sP����1�۫�0sP����1�W�c�����Y�R������mV�XsP��6�G%��/g�Ko�ӗ�쥊�������*���{�V�XsP�N_�җ:�|�XsP�N�$�VaՉ�1�����,���p�rֿT�v8}9`�x;�������j���cT�j��1�����,����p�rV���f#�����j�n�wT��p�r�T�v8}9+a�x;����0U�Nޫ�Vau�c�����YS�����,�i��p�r��4�v8�ycw[�0�X}�`o�ӗ�$������Y������,�i��p��.�
�I��s������Y������,�i��p�rV�4�v8�y�x[�����Q�b$V�9�����嬎i��p�r��4�v8�yy[���=��l��p�rV�4�v8}9Kd�x;���52M�Nތ�Va�x��;�x;���e2M�N_�:�f^�;�ǨT�yew��UU���\�R��E��s�y��E��9(��/g�Lo�ӟ���U���:�x;���u2M�N_�:�&��/g�L�^ �҃[�U�˯Ǩ�U!V�o�ӗ�N������Y'�������mVE�ӿ�o�ӗ�N������Y'�����嬓i���^�Ѽ�^M����oo&��cT-�9(��x�✃����9(��xA�������9(��xA������J�����
�1�ۛd��9ؽ�Zw��Q	�J��9(�������������UX����Q��7=7p�A������9�5�M��Ǩ�/H�sЫ�yA���^�����:ubu�A/ToRM���+��뱣�UX��9�V��i�屮X�I������=8F%�z�{P�x;���u2M�N_�:�&��/g�L�^�O݃c����OE������嬓i��p�r��4�v8}9�d�x;���u2M�Nj5�&��/g�Lo�ӗ�N������Y'�����嬓i�o@�D�6�v8}9�d�x;���u2M�N_�:�&��/g�Lo�ӟ�������Y'�����嬓i��p�r��t�v8}9�d�x;��T�����"��;�x;���u2]�N_�:�.��/g�Lo�ӟ�������Y'�����嬓���p�r��t�v8}9�d�x;��Tۨ]�N_�:�^�n�4�s������Y'�����嬓���p�Sǣv�v8}9�d�x{���wv��&�����M�#�9�����BH���M�#�9��ۛ�G�s���7�9F�7��=r�JW�R���ۻk���e$i�|�`o��9�����1������I���p�r��t�v8}9�d�x;���u2]�N_�:�^��VI�Rjo��9�x{���1�ۻ�G�9(�ޥ=r�A��.�c�����Y'�����嬓���p�r��t�v8}9�d�x;���x���7bu�A�v8}9�d�x;���u2]�N_�:�.��?�cjo�ӗ�N������Y'�����嬓���p�r��t�v8��KS�x;���u2���@i��V�XsP�N_�:�.��?ojo�ӗ�N������Y'�����嬓�����	�cT�؝sP�N_�:�.��/g�L~{����x;���u2]�N���.��/g�Lo�M/H|G%��/g�L�[�]�?Ǩ�U��j�{�]�?Ǩ�U'V�����Xs0���c�]S=�s�A�l��6�9�M�a�������8�x{��6�Q	���o��ҋ�o�ӗ�N������Y'�����嬓����D�v�v8}9�d�x;���u2]�N_�:�.��/g�Lo�ӟ:K������Y'�����嬓���p�r���v8}9�d�x;��Tp���K��J���!��/g��o�ӗ�Nf�����Y'3�����6T��p�r���v8}9�d�x;���u2C�N_�:�!��?U��o�ӗ�Nf��M��sp�����Y'3����嬓��p�SϪ�v8}9�d�x;���u2C�N_�:�!��/g��o�ӟJYu�����Y'3����嬓��p�r�������:F��W��U�x;��cT�"Q��;�x;��������~G�j/�HԽ�o���Y'3����v���v8��u2C�Nog�̨.&Pݰ:����v���v8��u2C�}P���    �pz;�d�x;��T$�C�Nog��o���Y'3����v���v8��u2C�Nj���\y�XsP�Nog��o���Y'3����v���v8���V�x;���:�!����Nf���������pz;�d�x;���g�C�Nog���.S!m�cTª6Z��o���Y'3������[��pz;�d�x;���:�!����Nf���������E�sP�Nog��o���Y'3�kz�c���������p�S���v8��u2C�Nog��o���Y'3����v���v8���W�x;���:�!�>�x�A��!��cN@!V�o�<�x��f�1�ۇ4�9(�>�x�A׉�f�1](f�L�o�R̠�1]*fP����Nf�X�k~Gj1#S.㚁�Q�^�k~G�1�<�x��f�1�ۇ4�9(�>�x�A��!��c��i~��-�>�����x��f�wޗK��������v�����pz;�dn�v8��u2�x;�>�H�����v�����pz;�dn�v8��u2�x;���:�[�N��/���pz;�d��:D��;o�v8��u2�x;���:��edr]�[�Nog��-����N�o���Y's������������b�-����N�o���Y's���������U��Ey�J�MW�Ey������������v�����pz;�dn�v8��u2�x;�>Q��]��"V�o���Y's������������v����%�J��y������������v�����7��9(����N�o��'ʜ�x;���:�[�Nog��-����N�o�5ˎ9��s�O�3
�ȯ@s�l6i~��W�߂M��-�5�_����t��z��'��>�6*6��Ӏ���K���~l��BZ��Tـ����jt��Q��GVOGW�/
#���Ӏ��H���l�Hl�������Ap\�xO6`$:����4`$<��|f80i~Z���{ i~�=o�I���i3zN�I�������3�;D���Tw�A���Y�{�{� B����>���&B��|�Bu����4?k8Pu���4?kxPu���4?[�Ps���4?�x�܇n"����M��TQÇ��Э$U���>t�*U���>4	B�*j�Ps���>�݇&A�RE��C� T���u��I�TQÇ���RE��C� 4}>�݇&ݤ�UQ�&������ #U�=݇�槇��E����1�<1h!i~z*OZDH������槇��E����q�<qh!i~z*OZDH�������ǡ�ġE����q�D��0!�C%���Q���{z��0WbUO�CxB����Z"�	Q�=g�ٽ'��ǡqO�be�\���0�Q^2�%������!�CxBF"TÇ<�	Q�k�zO�����4\K�!<!
�tcÇ<�	Q�>�qO��8]�U==�	Q�K�D��X�]���!<!
cy=j]"�	Q��_���D�/��qO��(���!�CxBF"�Ç<�	Q�Kê��!<!
����-���(��_����CF�n�Ɔy��`	����_F"4ߺ�qO��(�X��E��0J7�FO��J����q�"�	Q�KT�"�	Q�&�=݇�5?=Y�!<!
�t�Y��84�4H���E���J��FO��J�Vy=5n���(��r���}��U_r��ġF��8dOjDhI7�xψC���Z�����P#B�~i����8���ϟG�Փ-��~GO�!g��匮�D����|2�D"1fj~Z�"{B�835?-b�=�H�����Ȟ`$�L��'_aO4s��E8�'�;S��"��Ğ��i��	H���Kמ�Z_�;EHr]��1x{b�S�b.��}ݡ�C��R˵'*9�.�����,����KN��p5]����<��/9]{"��2��z��n%&M�O��dOl���Ep�'8�m��v��D���Y#<�'<�MS�F|�O|���g� U� %>M��'�R�%BM��!�>!J����5bT}b�(55?k��)qjj~>9��D)���]����
�J�<N�'Nݾ53W����W"���|20��Tb�������D���Y#V�'V�wS�F��O���瓟�O���g�pU�p%�M���>�Jܛ��5�U}��75?��M}��75?kī�ī��XbUï"^�S�F��O����۩O���g�xU�x%
N���>�J���5�U}�H85?��O}�X85?kī��+�pj~>���'^��S�F��O��������~i�_y�Z������jī%.N���F�Z"���|�F5����g�xU#^-�qj~ֈW5����g�xU#^-rj~>w�Zī%FN���E�Z����l�Zī%NN���E�Z�3$��`�"^-�rj~��W-��-��g�x�"^-�rj~��W-��1���so�E�Zb���l�Zī%jN�����j��S�E�j���95?�[]-��;��g�x�"^-�sj~��W-��2O'�FV_�WK���ϝ��j��S�E�j��(:5?[ī�j��S�E�j��H:5?�a-��K��g�x�"^-�tj~��W-��O��g�x�"^-uj~>��Zī%�N���E�Z�so�s��x��թ��"^��WKd����m��j��S�E�j���:5?��l[ī%�N���E�Z"���|'^��S�E�jO�e��g�x՞x%�N���=�J�����M��ī�J�9�_E�m��g�x՞x%�n�e���U��W��|������t,�WހU��K:�5�V��_Q��x�X����K���*ayQo��7`U��ޠ�+o����5]S}��U=��^�ހ�Ӻ��F��}��4?=^yVa%�O�WހUXI���7�U~嚟�������+o�*�������
+i~z����J���������+o�*�������z���5�����g���W���g���W���g���W���g���W���g�Uu��~04?ï��������¯��������¯��������¯�������~�ܯ���vz_�+�C�3���_i?���W��J�A����W��J�������W���g�Uw��~04?ï�������g�Uw��G���
��h~�'^��k~ʯ���tE��5��_��k~���~��+��9�����H����|╟�H����|������}#^i?���}#^i?��5��_i?蚟����t�O�W�W���ǫ�ī�GQ����|�����Y�o�+�]����|�������j>�J�A���x5�x���k~z��O��~�5?=^�'^i?蚟5�*�����Yï"^i?蚟5�*�����Yï"^-?��/����+�]�_E��~�5?k�U�+�]�_E��~�5?[�U�+�]�_E��~����k��W�R�sF��O��~����ݍ�h?H���jF�*�R�sF����凜�P���U�~����͎�h?H���jF�*�R�sF����������fī���k~z�Z��������jE�*���ǫ�h?蚟�Vī���k~z�Z��������jE�*�O��c��jE�*���ǫ�h?蚟�Vī���k~z�Z��������jE�*���ǫ�h?蚟�Vī���k~z�Z��������jE�*���ǫ�h?蚟�Vīb~|N�<^��WE�A���x�"^�]���ՊxU�ۡ��Sm]��x;4?�e��ǫ"��O|~�񪈷C�S�����J���?M�񪈷C�_�_y�*����ė�W��x;4?�����J�Z��R|]�J�b}~�񪈷C��z^u_��x;4?��}ݯ�ۡ��Ӄ]O�o��'���x%��O���_E�o���b�7�x;4?j��W�����Vī��+�vh~���W������l�5`V�Ғ��^�!-Y�U4`V��T��ƶ�����U4`V��T����J���WрUXI�S�*�
+i~*^EVa%�Oūh�*4*�PD��B�������=�{K���Fc[�̩��PрU    hT���X�F�R����̩��PрUhT���X�F%�HрU��.װ���ª���m4`V�X��Hb�T����hl��5?�n��{��9U=�.*�
�&e��Hb�T��ʨh�*��t�[�����Om��o������F_�Hb�T���h�*���:��u���^���V���R����RĪ�_ED�
�>\;W}#"y�T�ڹрUXu)�_ED�"�.e��Hb�T��2�h�*��KY7�
�!e]�Uy"��9U=�R*�*�M�Ψ���^/F�S�9�9����z�h�*4�t�]���#�M�Ψ���B�֗5���{S�3j���и�Uy��{��7u;�**�Ľ��eQрUX���#R�E5��ngFEV/����рUX���#R�F5��ng�FEVa5/W�����j���o4`V�X���H&�M�Ψ��ƶ�{S�3
��������X�Ք�p��G$��ng�HEV�D�����Lܛ��Q%X��җ�W�Lܛ��Q'X��2�
����
�UZ���Vqo�vF�T4`V�X��+�H&�M��(����j�?%�h�*��t�ï<"��7u;�^*�z�f��_Vn^/��h����K:��(�j&�M�Ψ��ƶ�{S�3�����7��USрU՛�`=^E�T3qo�vF�T4`U��5]�X}=^��7u;�r*�
��/k�u��^�J�<^E�T3qo�vF�T4`V�����������h�*�
��xeO���ngPEVaUq4`V�Xy��'^�{S�3j������Տ�����S?��^L�j�U�+�w`Ī�_E���ng�PEVae���X��I�9�*╸7u;��*�
+������Ľ��5TрUXy��Wb����h�*������u��^>]����V1s�vFU4`V�X��Wb����h�*���S]��ªJ�9�*╘9u;��*�
�v�&s�5`V���X�U�&���>�J̜��QC�m��ּ�b��u�3�ng�PEVaը���>�J̜��QCX�U��笾��̩�5TрUXu}Y�����9u;��*�
�n���}ݯ�̩�5T��V1s�vFU4`��|b��>�J̜��QCX�U�Z�рUXub��>�J̜��QCX�ո\)���
�Q~J�рUXbUï"^��A�j�U�+��0��H{_�+��0�OG:��-�W�_E��kC���W��Ø�2����"�X?��h�*�n}~�J����QCX��m�A�}ݯ�۩�5T��kU����QCX��M�z��ǫ*�N�Ψ���~���)TGVauK�:���Uo�ng�PEVa5/ׯ����j�������ү�_EU������hl�x;u;��*�
+�������jRg��U�P�*�N�Ψ���~?f����z�������h�*����ѷz_a���ǫ��jU����QCX�ժ?e�hl�x;u;��*�
�E�<^EU������h�*����͎��j+�WQCժx;u;��*��m��U����]姪Xu��"V5���Uo�ng�PEc[�۩�5TрUW����܎��StI�;���Uo�ng�PEV�*��+r��ǫ*�N�Ψ���ª���+�W���+i}�_y�������h�*�J��uGc[�۩�5TрUXb�ï"^��S�3j����*�O�;�
�"���W�����h�*��r���k�*���X������W��W���������ư5W���W����%�h�*��������۩��#^�'^��S��G��O�o�ng�GVa�]����
�J����/̕�y���j,9������")�jn|��0Q3iv��$"U����t;s;�ϫ�ϫQ���M��J�3�s�����ngn��y5�y%������j��J����������Ϋ��+�v�v�Wc�W����>��>��ۙ��r/����\u�W>��ۙ�9|^�}^�r@^�O^���J�����'����������t;s;�ϫ��+�v�v�Wc�W����tz�@��Ц�+�W��Cy���+�W��Cy���+�W��Cy���+�W��Cy���+�Ww�E���}��J�}(o���y%�>��?|_���n����|^I����W>��ۇ����+�W����t.�@��T.��+�v�vN�Ws�W����>��>��ۙ���t/������u^�}^I�3�s������ngn��y5�y%���Ng�{T\-mv�� /rU����Uy�WV�z���2!��M\����K��������yu�y��:��ϫ�|�kV�~[��e#���{T\-rU���yu�y��:��ϫK��������yuI���w�Wu^]��Cy���U�W�t�P�~�}U��%�>���}_�yuI���w�Wu^]��Cy���U�W�t�P�~�}U���ھ+�]����n�ۿ|_�yuI���_��꼺�ۇ��/�Wu^]��Cy���:�.�������U�W�t�P�����ΫK�}(o�����n����꼺�ۇ����:�.��������ΫK�}(o�������ʐ��P���O��@�roʐ�}�{�/�v�v�{Խ��������{TFw�v��{TN�Ƭ�:�v��%ݎ��p��@�uow���u^]�������{�/�v�v�{�c��_��U�W�G��n��ۯ�j��_��Sy�u^��K�}*o�Ϋݣ~I�O���y�{�/�����:�v��%�>��_���Q��ۧ����=�t�T�~�W�G��n��ۯ�j��_��Sy����ϫ���U�}��J�}*o����y%�>���}_������w�W>���g�����y%�>+o����+���������+���������+��Y?�}��J�}V޾�+�W�����}_��5ѿ���{�/�v�v�{�c��_��������Q���g�����y%�>+o����+��Yy���|^I�����}��J�}���] W�y�^ W����j��_������[�ժ\�����u_I���۟�m�W��Sy�u^��K�}*o�Ϋݣ~I����o�[�W������~��J�}V�~�o뾒n��ۯ�j��_��Sy�u^��K�}*o�Ϋݣ~I�O���y�{ԯ�BL�U�W�G��n��ۯ�j��_��Sy�u^��K�}*o�Ϋݣ~I�O���y�{�/�����:�v��%�>���}_���n���ﾯ|^I�O��w�W>��ۧ����+�W��Sy����ϫ�_4�����+���������t�T������t�T������t�T������t;r;�=�{�/�v�v�{�c��_������b���v�v�{�c���v�v�{�c���v�v�{�c���V�8�;} v���nGng�G=v���nGng�G=v������l��] W��l/��+���y�{�G�)o�Ϋݣ>*GHy�u^��QAB�ۯ�j���JR�~�W�G}T������=��YBw�5�o�&���:�v���n��ۯ�j�������:�v���n��ۯ�j�������:�v���n��ۯ�j�������:�v���n��ۯ�j�������:�v���n��ۯ�j�������:�v���J^j51�@���;1���^j�����jH�#�3ܣ���nGng�G���_j�;O���_j�����Ϋ!ݎ��p��@������y5�ۑ۹�-��Q��������Q�b�4���U�WC������=�C���{C��!ݎ��p�z��!ݎ��p�z��!ݎ��p�z��!ݎ��=�!v���nGng�G=v���nGng�G=v���nGng�G=v���n_�3�����9��� *�����ʋ*ݾ�������Jy�:�� *��������Jy�:�� *�����*w���n_���y��G}H���I�?�⪓+�W�;؇t;�j��;�Ǩ ������}H�#�6�����}H�#�6�����}H�#�6�����}H�#�vϏ���>��V��`���>��V��`���>��V��`���>��V��KxT\]����y%ݎ��t�tUZ�U�'�u_I�#�vϞ����4�����+�v�զ;ؽ *���&S�>���Y�'S��`���Mw���`�툭Mw���`���Mw    ���`�툮�s+rw��v�צ;�sw��������}��J�������C��{�E��!ݎ�t{��!ݎ�t{��!ݎ�t{��!ݎ�=����jj����>��c��`��J�#�6��Pq5�w"�@+���	����C�Q���v/���y׼���t;�l������C�i�������C�q�������C�y�������C���{�F���)ݎD�t{���)ݎH�t{���)ݎL�t{����*�q}gm��o��툼M����o���ȼM����o����M����o���H�ݓ8� *�nr�}_�y5�ۑ{��o��J�#�6���Pqu��/���[�A|_�y5�ۑ}��o�h%\�5�C���jJ�#�vO����>+�Ѧ�:�fŀ>����ΫY9�O֌����ߊ��g|��o���h>��:�fE�>�j����jV�3k�~[�լ0�g}'���o���h>��:���@5��U�W�y��ҿ�
m?�A� �DЦ� ��v��HЦ� ݿ��J�a���v/�*����/�*�q�C�W��}V,h��:�v��\�v�l��Ϋ)ݎD�=[$w��nG$n��=w���J�����S���������S���{�H���)ݎX�t{���)ݎ\�t{���)ݎ`�t{���)ݎd�=�$w��nG4n��=w��nG6n��=w��nG8n��=w��nG:�Z��J�%W����+�v���۽�����M��{T\���4���J�R�}����S�T|_���nGHn��=w��nGJ�x���}J����W>��ۑ���o���>�����o���>G����<����S�Q�������S�Y�������S�a�������S�i�{ZJ���)ݎ��t{���)ݎ��t{���)ݎ��t{���)ݎ��=K�����,�W��}J�#37����]�a|դ��m�W��H�ݓV� *�.μ��j��O�v���۽ *�����>��������o����M����o����M����o����M����o�����SZr��O�v����s��ϻ�5K%�>������o���>����g���o����M����o����M����o����M����o�����^� *�&�꾯|^I�#67�����nGln�����j���/�V:������y%ݎ��t�@�ռk:�~��J���{:L���)ݎ��t{���)ݎ��t{���)ݎ��t{���)ݎ��=;&w��nGln��=w��nGln��=w��nGln��=w�j%���er��/�v����s��/�v����s��/�v���۽���������H�[�U���4�|0�
vc������:u��ǭ��'8�c	L�\�Bi�:����4��0GB�C�|���\�1��s[����̸�!j���\����y_'x���0��0AB-�|��}�7���e�������\��^ /�������9���)��s !n�W_���/5��ؾN𢯉�|�Ȇ[�M&j����eꋏ�6�:'x�y��1�
�05B�Z�`�eꝼ1_�/s�n��-�������x�zk�L�:�˼o6���E��`�4^��1_�/��Vk naX�^� c�Eo��.}���{��}�1�������|���C7�����?O��o��������F�n�/*���� �?��������L�뇴�l��視����L�S��aM��C���U��*�EؾN4t��c�:����s� ��*̼
������a"�0�+e;f^�#(F��
3�³c� Hn���4�e/f^��	F��
3��M� HzB�w��j��{��Q�'r�WK�ʞl�W�.������{'��+�W����M}�l��̫�9u;�0�*<���d(e�4����:xG�}
3��C� H�R�5��j��G��i#���W2w	�ղu
3��H2�����g�6Na敼=}�웂ڀ!Š���!��1��`��r5��}�d�L�Ւ!��|	#�2U2�2�e�T�a�W{��+m�qYa�}��N J�4諽Ȑ��?]�YYa�r�WK��V��}�d�b��?M�#�]z%�%C,i�W��R,��$��vI�ˠ��ۥY�A_-��S3�?-i#��QM]�L��j�2���I��ӑ4��.��}�dH�e�WK�f;4�Dg��K��N2$�}��I��ӏ0���/�A_�$C�/à�v������Ь��	��jɐ$L�WK��a��9��1�A_�"CR1à�v�!}B��c�@\VXǄA_�"C2i�W�Ȑ��?�"���R�2��V�~}gd緖-2�a������|'F緖-2�Q�i�W{����&r %`~�緖�dHs��A_�M��g�o~��}�p;$�$d�UE����&0&�c����uH���`����<j������{�}�zO{�Z���goG����8����D��Cj��ޣbr��s�����Ge���GU��Ue-���Pcc�XC���Ʀ�4�^C���Â�1���΁x�晖1��i`���^'��}�8����m(l_��v�u���1q�7�EEZ���R��h�U]k�kr���9{$9���O|�@ @�$֭c���������7�������1H�Rw�3�|�I�2�oQX��R�i��`�����j��u����8*9��!e�4'��%C���'�i �]�I��`�)ا�WK�z;���dg���}��u%�8�W�����/�W����@2�'b�W��P��̏��+��R3�Q� �����^߫%C��0|�ӠUhB�.>�E�.����s�S�_��HZ(�/_�����	$���������d���=�~��.{��Q� *;��}�d����Ւ!����}�dh�	A��WK�%���9�NJ�髝�ji4����ڹ��>J��o��!=�/W�
�АSL��^-�V���5�ʚz�j��j����v}��M=!��� %��ծ}���'A]�������F���c$���� �j��_��j���<t�������j��d�i]��Z24O��#�+��V�t�.> m��xB0諥� ���;��Hhu�֣�A2��_J0����J�W��H:
(�]��[˖J�� �%C�>t�����ڵ,���n���}TW��e4������ f�Iգ�A2T�G}�7R��?=>YV Gu�ԣ�A2t�?Dූ�d�^��� +�w5I�� ��͇�np_-z���_�R� F}#om/ ��G_�~k�C��~��;a�O���@2��ӡA_�C��y��7�_p�������:��̒���g��~N�8�]�~��;NDW��;N$W��;NW�s��'r� ^�w���8N�8�Zp��q"�
�:��Df����U ��;N$V�ٯ��q"�
�)m �
`��q"�
`?��DZ���aU5����YU ��g׻��N�8�TK�O�8T�9��DN����'b� ��'R�������DH�~zǉ�*���'"� ��;N$T��w���N�8�O�>��D<����Tx�N�8N0N�8�M0O�8M���q"�
�uzǉ`*����T ��'b� ��;N�R�O�8J�9��D&ކ��;NDR<�.G�$���;NR�w�ȣx��q"�
�8��D�yzǉ0*���YT ��;NDQ|N�8�D�wB��AT ��9T ��1T ��'R� ^�w��8N�8�Ap��q"�
�:��D���T ��;N�O�@8��C�z�No�=���ӛ8$O�69��C���7qH��`��&�Sl�8��C���O��7����k8�Mq:��5¦ ��5�� ��5��-{z��)��I� h���I� g�����d�)��$Y��t%����s�$�e;J�����K�ܺw�(In2$��$7��yI�����K��dH_V_��&C����$7��yI��I�$�M�z;J���S"�@��<J�G^�(I2$��$��yI��I�$�C��e�%I    2��$y�P��WK��v�$��'I�4)���$A��~�$Ȓ�.7��D��`$C�fp_-�>0��j�P5��WK��L��^-�$I"0N�)Q �$I��$	2� ^'I��(��$I�p�$ɥ���fp_-I��0��jE�s�$H�Beh'I�p(����l(�y�$���O��P ��$A0�q�$ȅ8O��P �I� 
�}�$���$	2�P�I� 
`�$	� �I� 
`?I�A�N�qP �I� 
�<I�A\�ϮȂx�>�"

�s��$(��v�� (�����˭��e��Ϯ���O�]/B�u��(H��gW�@᧳Z��˕�Qk��}�����	P ��nm/>� E�ޡ��B.}�W�!�	~���D��7'��'�pR��}�`�"�����IE"󉭼�ħv�T$�>�sR�H{⤮��D������'�y���z☁��D���$#��G���D���IF"�I�C��'}9�H�<|N2Ot��d$"� �IF"�	`�d$�hT9�H�;�N2�N �IF"�	�<�H�;\'�l'��IF"�	�s��Hv��A;�H;���D��<�H�:�'�T'��IF"�I����D��y���t�N2�N D���$#��Ӡ�d$� �R�Ҝ���$#2�wb/����2�!CR�/��!)ŗ�|Ȑ��KF>d躏2�!Cz'���D�Өm��B��PGCQ�i����MC5�������v�
��u�{h��÷y|o- �����2�
B��Ý��]��O^l=�aA:�G���׃�&���2!Q��~�wADO��4�� %ANDq�$HJ��j�G8��Ɣ���i	�Eh���y��%�Kj˼D��%�K���3��Ӷ9��`�%��>�c�Y�-��K��$/i^�xI��%�KY�ă[�%��/I^Ҽd��%�K��,^�tm��,^:x�䥛���D����t���?�~�sB�O�� /���N^�y��K/��t�R6	�.�xmV�x�䥛�^�t���K7/�x���Җy���^.�r��:��ē[��*^اw�S�b�x�6��V����0�r/�|y��KYD��C�1�����/y���U�\��"/�y����m���x�e��a^|�2��0/�x�e�S"���-�2���#���2��^�z��K�c���kn��Q��2��0/�x�e��a^F�2��Ԗy��/�sU��2E��Z�Ɗ�	^>���ۇ�$�qr�+^&x�H��E�k�d-��Ɗ�	^�z	���e���^�*G���/���U�bף	^��c��/���yq=Z�e��0/�G��~�kDTҎ�e^\�xY�%̋��/���yq=Z,��%̋��/K=����h��E^¼�-�rk˼����&/i^\�n�r��4/�G7x�����Hp�s˼����&/i^\�n�r��4/�G7x��K�ף�ꅼ�yq=��˭�S��zt��G[����/y�����/y�����/O?��"i�͢9 �`��!/ݼ�=��!/ݼ�=��!/ݼ�=��!/ݼ�=�u䥛ףG�N{&�
Ҕ�m��53U�&�.�}�35U�&�.�}�n�I�s_�pQ�Իp�a��TU�T���5;�v.Nj^��Z�.��Ҥ��{&�
Ӥ�ï9���dH]˗��4K���a��6Mi��Z6CU���o�SK��24�P��)�dh���OS�7��0CU��p��a��BM)� C�U����A���5����Þ�"5)���k~#����z:H��b�2�C_�����`1D!��.���0~��!Ja8��7C��p�ao,�(�����m����{��b�r���2m�����p�a�U��]Pd(�PU�IE�_K��tɚ��p�a�U͚��p�5�y�u2f��֤*��{f��֤,�ï9���d�Ҟ��5)���k~7����Ie�_s�� ��E��U횗�1�P��*^����#/ ������5)���Þ��5����kN@� ��P���`�
?왡*a���tm�����p��tK�I��_s�b���*���$/ �1�u3TulR'��=3T�lR(�����@24�P7CU�&�2~�3CU�&�2~�iK^|@�e8���R���rR-��=3�ZF��_s�f�m��z���e�k3~�3C�eSo*��e�\�(���k�Z���Q3��=3�ZF��_s|� ��Ҟr-�l�ï�Umۯj'u3~��N^ $C�3�ZF���̐k�3~͡O^ $C�3�Z��2�3�ZF��_s� ��"C���Q?��=3�ZF�_��j/ �!H��Z�w-���ï�a��d"�)R^ $CP�ݵ��ZF����b�2��)/ �}�ͽe�����{��b�J6���)/> �4|~�/��~i?��a�Þr-���ӯ�k����I5�_�e}�2�i8��g�\˨���kN�� z�P�!�2*j8��g�\��$Ca�\��Ԟ�Z���a�k�r������Ǎ��Z���a�kn�n�u{QS��=3T�lQS�����@�ld(�PղEM���PղEM�_s:� �r���4CU�55,�3CU�V�)�f�j٢���uײ�Z���a�k�_o�}QS��ל��@2d����e���?왡�e�����-/ �� C�U-[�԰�a�U-[z���3CU˖^,'��PղUo���e���-�ZN2t���eK]f�j����$C��Z��v9��e���-�^N2t���eK]f�j���$C��Z���a�kݵ���-jjX��?��!oQS��ל��@�|'C�U-[�԰�a�U-[�԰�5�y�u24�PղEM���PղEM�_sV� �P'C�U-[�԰�a�U-[�԰�5�� ���\�.ײEM�_�5���>qq�,���a�k�k��Z���a���0XQS���<\��d��r-�\�55,ػC�԰�5����RS����I��O����?왡�e����ff���EM�_�\�.ײ5�	���Z���a�k���@24�P���e���?왡�e�����A�^ $CS{fȵ�������m�^�԰�5��� �d(͐k55,�3C�e�԰�5�����r��4C�e�԰�a���QS���<��dh��4C�e�԰�a���QS����q�������v��]��QS�����m۩���a�k�'�@2��P7C�e�԰�a���-}$C���QS���.ײk�2jjX��g�\˨�a�k�B�����对á��EM��̐k55,�v��ʋ���v��]��QS��=3�ZFM�_��r/ ���]fȵ�ַR2t�!�2jjX��ǚ{�=�3C�e�԰�5�y��汨�a�k�x�@2���a�\˨�a�Þr-����y� ��C��r-����{fȵ�����9�^ ��d24̐k٣���3CU�njjX��{]� �/���õl����ɀ��q����M=\ˆk�MM��.�W���M=\ˆk�MM�6��Y �+CSײ�ZvSS����] 
�=���'w2f�j�MM���Pղ����f�~�������6\ˆk�MM���Pղ�����ӶsLojjX��p-�e755,�3CU�njjX����{����Pղ����殧����TWJ3T�즦��9 �����?왡�e755,ͣ� H����ZvSS��=3T�즦��yj� �P��4CU�numt홡�e��6:�f�j٭��N���ZvW��f�j٭΍N���Zv�u���n�������d����e��7:�f�j٭�N���Zv�}���n�����԰�5O���RS������v��MM���Pղ�����0���,�K�-d�2CU�njjX��g�����԰�5'����{SS��׆k�p-���a�Þ�ZvSS���<���dhh�U-���a�knl�	𦦆�{f�j�MM�_s�Gۉ755,�3CU���24�Pղ�����|��ojjX��g������    ��a�U-���a�Þ�ZvSS��=3�ZFM�_s'� �4�t-���QS���k�@2M=]��e����a�2XMuHM���55�؛�!jjX���C����a�6XQS�����`1DM�_s;h���755��3C�e����5g����rSS���=3�ZFM��̐k55��Y�mg]�KMdd(̐k55��3C�e����a���QS���=3�ZFM�_sOl�=�755��3C�e����5ܴpsSS���=3�ZFM��̐k55�͉�m'~�����a�����#Ci�\˨���Þr-����{fȵ��޿����ojjx��g�\˨���kN�i;�禦��{fȵ���?�!�2jjx��s���=�����Þr-����{fȵ�Q+"�fȵ�Q/���Pղ��޿��趻�jjx��g���=����5G�u��ӹ���U-{����Þ�Z�PS��ל��v��CM���Pղ���?왡�e55��3CU�jjx��g���=�vM24�Pղ���@왡�e55���yOm�==��0b�U-{��aĞ�Z�PS�؜��v�CMc ��Pղ���@왡�e55���3CU�jj�g���=��06�-� ����^,���al�� ��^�e˵졦�1{��b�����I ^ $C��˵l��=��0bo,���a��m����1{��b����f�i۞Ӈ��@왡�eOW�/
3T�졦�1{f�j�CMc ��Pղ�����ym�Cx��aĞ�Z�PS��=3T�졦�1{f�j٣��K{f�j٣����Z��+�"Ci���=j���P���eO�E��4CU�5F_d(�PղG��J3T��Qk�E��U-{�}��4CU�5G_d(�Pղ���@왡�e55|������55���3CU�jj8�3��΀{��aĞ�Z�����n���=��06��h{6�CMw ��Pղ���@왡�e55���3CU�jj�g�\˨�al�`�m�~��aĞr-���A�9�� ���A�!�2jj�g�\˦����e�\˨�aĞr-���A{fȵ��A�!�2jj�g�\˨�al����C��aĞr-���A�9��4���A�!�2jj�g�\˨�al������gɀ@��r-���A{fȵ��A�!�2jj�g�\˨�al6�{��L`�Zv�ZFM�`s$� �4��Zv�ZFM� �.��55���b� H���oײ{ײ[��{�`1DM� �n��55��xC��06'��H�PS� �=3�ZFM�`s.d۹�55��3C�e��0b���QS� �<3��955��3C�e��0b���=����0C�e�|,�3C�e�QS�"���@:YJ3�Z�ieid(͐j������4C�e�f�F����}@�YJ3�Z�igid(͐j������4C�e���F����}@2�3CY��>���H��u3ԋ!jj��B� H��u3ԋ!jj�g�z1DM�`��$/ �� C��b���A왡^QS�<�=3ԋ!jj��g�z1DM��;����$x3tC��06Ǥz�%���UQS�B�=3tC���6O�� J2t�������{f�*���a#Ğ��!jj��g��b��F�w��$C�34��.Ø����(����%Ğ�55̄�3C������y�� �P'C��b��~B왡QQS�P�=34�!jj8
�g�F1DMK�;(b6jjx
��!jj�
�s� (O��	t��55l�ػC���bo,���a,��4XQS�Y��e�����{��bH�á��`1$��8���M�áD63ŐL�CAf(�!�
3�P�5r�E1$�� Ca����p��0CQ�y8�P��(�d=d(�PC��pb���QS�f����>C�!�2jj���� H���H̐k55���3C�eS�LM�0C�e��0b���QS�m�=3�ZFM�!�̐k55���3C�e��0��Sf����{fȵ������h/ ���\?3�ZFM�!�̐k55\��3�� (�w�!�2jj��g�\˨�a<Ğr-����{fȵ����w��$C7�̐k55̇�!�^ $C�fʙ!�2jj��g�\˨��?l�4�@2t��������j��r-���{fȵ��D�!�2jj��1:�=dh�!�2jj���Ľ H�24̐k55���3C�e��p"6�[� z�c�\˨��EĞr-{d���3�Z���=3T�,��aF|�	͠��{a0
����h���0#b�����)�j� AM&G��B7hN��@z��r���U �Ѝ�H�e^ $C5 �1X�l�93������U-j�`��̠����f�jYPSϚ�b���5��d�0CU˂�zj�J���eAM=5Y%�Pղ�����f�jYPSÌ���RSÌ�Ε��r�k���Z��0#�kH�jj��a^ $CI��U-jj��q^ $CI��U-jj�Á^ $C�V3T�,��aFGvx���aF|�k͠��1��@��ä���0#�c;� H�:�f�jYPSÌ�� ��c���55̈��/ ����f�jYPSÌ���RSÌ�N�AM=/ŏ���eAM3b��͸�Ǡ1Tf�jYPSOF�U-� ���e���55̈�/ ��K��Pղ���1���@24�g���55̈�Y�AM3b8���dh(��U-jj��Q^ Tdf�jYPSÌ�� dh���eAM3b8���dhh�Z���3C�e
��qȚ��D��1�a�R����Q3��1a�C
�����Z��U��F��Őb=&#쪖Ůe������Z��)�c2®jY�ZFM3"���55̈�����0#��=� H�V?LϚAM3b8���dh)����QSÌ����O4����QSÌ��� Zd(̐k55̈�/> 55̈�����0#�c>� H��~!6��f�pЇ ��M����QSÌ��� ��P�!ײ[�0b�\˨�aF�}x�=�3C�e��0#��gPSÌ�� zNs�fPSÌ��� z�P7C�e��0#�C?� H�E�!�2jj�ñ^ T|����!ײG�9�3CU˒�f�w��Ljj�ù^ d�N#C���IM3b8����id�2CU˒�f�p� ���n���%55̈��/ 2H����U-Kjj�ù^|�P��i��Ljꥁ��U-Kj�X�&�ͤ�^
f�jYRS/��3T�,����F��Z��ԫ~���eIM�*��U-Kj�Ua�f�jYRS/�f�jYRS/��V-KײL�0i O,�����F���kYRS/��V-Kײ��^
�Z��eIM�jZ�0XQS/�Z��eIM�4��jY��%5�Ҵªe�Z���K�
���kYRS�~�c�IM3b8���
��ي3��aF�~x�u2f�jYRSÌ��� ��h���%55̈��/ �����f�jYRSÌ����RSÌ�Τ�IM�.֚��eIM3b�Lμ��!Nf�jYRS/���9�c&55̈��/ �����Z���0#�s?� H�.2�f�jYRSÌ����RSÌ��IM3b8���dh�Ô͙��0#�s?� ��32��Pղ���1���@24�P7CU˒�f�p� ���LP3T�,��aF�~x���aF|�Ϥ��1���@245���QSÌ��� �d�2C�e��0#�s?� H�&�̐k55̈��/ ��I�.3�Z����=3�Z��������[dh�!�2�-2�ϼՙJ�[ b�\�����0C�e��[dh�!ײ
�Ө43�Z�ԼE��r-Sl�"C���QSÌ����RSÌ�Ω�IM3"��`1DM3�{��Ljj���C��0#b�2XQSÌ��a����{�`1t+WP���b��fD���!jj���,���aF|�uϤ��1���@2��&�Τ��1���@2���0C�e��0#�s?� H�E��    !�2jj�ù^ T����!ײGً�3CU�:55̈���٩�aF�~x����NM3b8���`ld(�PղNM3b8����`l�c���u%H7�����e��f�p� �Ph�U-�x��@�٩�aF�~x�E?�`���f�p� �P��n���ujj�ù^ $CA���Z֩��� #3T��SSÌ��� J홡�e��f�wv��O�l4CU�:55̈�D=;55̈��/ �!�z��PղNM}+��2CU�:5�� ��U-��Է�/3T��SS�5��U-���w����e���>��NM}k��0CU�zWȩ�Z���e�����a���uj�[���Z֩�oM f�jY���k��Z֩�aF�~x�u24�PղNM3b8�ËHM}_�aX�SSߚ ^��r-��Է&�W-�\���X����!j�c4\�.ײNM3"���b��fD�M��55̈�[�!jj��w,���aF��c�����=�avjj�ù^ $C���NM3b8�����%Ca���ujj�ù^ $C���Z֩�aF�~x�M�7CU�:55̈��/> 55̈�y�SSÌ��� ��0�~vjj�ù^ $C��r-���1���@24�P�!�2jj�ù^ $C��r-���1��������=�cvjj�ù^ $C�u3�ZFM3b8���dh��n�\˨�aF�~xP���k�\˨�aF�~x�-2�͐k���o�!�2�Q�q�l2�Ҩo2t�!�2�Q�d�2C�eʣ���e�\�H}�����)��֨3�Z�H�]fȵ�2�5~���)��&C�r-���1�������1^�]f���1���@2���a�\˨�aF�~x�=dh�!�2jj�ù^ $C��ј!�2jj�ù^ Tl�4�!ײG���3CU�.jj��3n�EM3"��`����a4Uˆk�EM3"���^ û���k�p-���aF��08
d|w�`�ip���q=��*�ލ�z��ײ��fD�=��P��i�����aF�~x�
3T�좦�1���@2d(�Pղ��f�p� �P��0CU�.jj�ù^ $C��Ff�j�EM3b8�ËHM3�{�ѼR���m���]��0#�s?� H����ZvQSÌ��� J2�f�j�EM3b8���d(�P���e55̈��/ ���=3T�좦��=�i^��0#�s?� ��|�A7CU�.jj�ù^ $C�u3T�좦�1���@2���U-�����f�j�EM�h(V7CU�.j�Ƨ���e5�s�:/j꧆b���e5���X��Zv]�!�A�f�j�EM�hP�e���]��0#�s?� H�.2t���e55̈��/ ���]f�j�EM3b8�ËHM3b��͋�f�p� ����03T�좦�1���@�Y C�U-���aF�~x�24�Pղ��f�p� �� C�U-���aF�~x���aF|O@�55̈���55̈�K��55̈���!jj��w,���aF��0XQSÌ��i����{�`1DM3"�n��55̈�{C��0#���͋�f�p� ��"Ca�\˨�aF�~x�-2fȵ��f�p� 5���r-���1���@2��P�!�2jj�ù^|@jj�߳��EM3b8���d�&Ci�\˨�aF�~x��d(͐k55̈��/ ����r-�5τ�r-���1���@2�h���i������Ҭ��u3�Z�a/�fȵL�^2�͐k�ƽ<d��!�2�{y4����i�ˣ�fȵL_2�͐kY�|!C���y�6MQ�n;�{.�5�����$U95�����,U=5�����4UA5�����<UE5�����DUI5��i$����6j�KӤGSUEm��F�.sUU�sC���ZM>�11^c"g�>�31�Pq�j���l5���p�@�U��a����D��A ^ WA�����Vs�OG�xT\��b���o��p(��@�����{���<ĀG�a���(���F�+͂�K��hq�a0�)b�2Z\i|��F�+���Q��hq�y0p*bs-�4VEl�F�+M��W����J#a`V|Ϣ���p+��A� Z���U���v���+��A� *�:�
sU�N���p8�@�U'Wa���i^b��������*�U�<�L��!^|P��m1��Pqu��4WU�491`\g�x��T��4WU�4=1�8��9%dj~b���	�����U���}��p/��B� *�.r�檪��(���/>������
���䪛�*����0��B� *����J�&*L��/���A����"���c81���j��n��j�b��������4W��+c85���j���\�jd̌��/���I�.s�:��1�3��C� *�&��̕������������2W��Kc8=���ji�\�jtL���/���E���r����	"^ W�\s�:��106�3D� *����upո8r5̕�&�������Z�j�+�A͐��1$����y��w���F�+�����i���8�ٍW$�#6/�ŕ&����a���(��9�Ww�ֻ���W&�#6o�ŕ������hq�q20:�3E� *�r��uPe`u��xT\=�*̕�F�������z�U�+�A���1�,�Pq���0W��O"$Wa�\��D�MsUu��5��N��.R��yǋĎ�q�0=��Eb�ԼF��#�Fj`#l�ᄑ�	#5���p�H숑��c8c$v�H�l��12;d��6��N��2⩍�MsUup�m$W�\U��� W�\U��� W�\U��� W�\U��� W�\U��� W�\U��� W�\U��� W�\U��� W�\U���pA�Gb�� G� É#�Gj�#|��ȑؑ#5�F�p�H�̑��'d8t$v�Hq�2�:;u��8���;Rca�����9�pC��Gb�� G�!��#��Gj�#������#5���p�H�쑚�Gd8|$v�Hs�%2�>;}��9���?R�a�����y�pE�Hb��@G�"�	$�Hj�#|����$5���pI����gd8�$vIu�5�'��u��:���0Z\I����4Z\]5=��f7Z\I�����hq%�$6���J�IlN�ŕt;��\F�+�vX$�y-������c���n�I2�G;���;�%$�HRa�'��N$�	��I�#IbG�ԈG%Ù$�3Ij�#���P�ء$5�V�p*I�T����d8�$v,I�y�Y2�K;���<�-&�LR�a�'��N&�I��K��IbG�ԨG&��$��Ij�#��p���$5���p:I�t����d8�$v<I�{�i2�O;���=�5(�PRa�'��N(����M�#JbG���G'�%�3Jj�#��ᐒ�!%5���pJI씒���d8�$vLI�}�y2�S;���>�=*�TR�a�'��N*�ɏ�O��JbG���G(�Y%��Jj�#�ᰒ�a%5��pZI촒��e8�$v\I���2�W;���?�E,�XR a�'��N,�	��Q�#KbG��H)Ù%�3Kj$���Вء%5V�pjI�Ԓ�	/e8�$vlI����2�[;���@�M.�\R� a�'��N.�I��S��KbG��(H*��%��Kj$�����%5��pzI����	Oe8�$v|I����2�_;�D� #k�\U�@Ȁ��gP/�jB�G�c3�F�����L�Y�fd:6��^��d�����U�:�9��B5&�#б9��B5'�#б���B5(�#бy�W���hq5L�\���:�ِ�e:�$w���C,��4��i&��X��LrǙh<d�d��3ɝg����e:�$w��Dl��D�܉&��Y�#MrG�hDd�h��4ɝi�j�zj�\U\5x=�U����˓��U�����F�'�JsUup���$Wi������*�U�    �U�ד\���:�j�z��4WUW�_Or�����I��\UԴȀ�2o�;�D�"��t�I�|͋�.�'�N402`�L'��N8��Ȁ�2q�;�D##��t�I�͌8/�!'�CN442`�L���N9��Ȁ�2s�;�Dc#��t�I�͍�/�A'��N482`�L'��N:��Ȁ�2u�;�D�#�t�I�͎80�a'��N4<2`�L���N;��Ȁ3w�;�D�#&�t�I�͏�0Ӂ'�O4@2`�L'��N<�ɀ3y�;�D#$F�t�I��͐81ӡ'�CO4D2`�L���N=�ɀ3{�;�Dc$f�t�I��͑�1��'��O4H2`�L'��N>�$ɀ3}�;�D�$��t�I��͒82��'��O4L2`��)D4v�n�'�a���n�)�i���n�+��hq%�[&6/�ŕt;|��F�+�v3�9�W��pfbs-���a���m���n�7����J���tJ�͕�3�A(��P4X2`�L'��NB�dɀ?3��;
E�%�tJ�,͖84�a(��P4\2`�L���NC�tɀG3��;E�%&�tJ�<͗�4Ӂ(�Q4`2`�L'��NDфɀO3��;E#&F�t&J�L͘85ӡ(�CQ4d2`�L���NEєɀW3��;Ec&f�t.J�\͙�5��(��Q4h2`�L'��NFѤɀ_3��;E�&��t6J�l͚86��(��Q4l2`�L���NGѴɀg3��;E�&��t>J�|͛�6�)�R4p2`�L'��NH��ɀo3��;"E#'��tFJ�͜�^��꠆N��锔�))�:�n�cRrǤh�d����Iɝ�����f:(%wP�O�餔�I)�<�o��RrG�h�d����Jɝ��ٓg:,%wX��O,�鴔�i)�>�p��Rrǥh�d�ę�Kɝ����g:0%w`�Pl��Ĕ܉)�@�q�#SrG�he�ș�Lɝ���'g:4%wh��P���Ԕܩ)�B�r�cSrǦhe�̙�Mɝ��9�7g:8%wp�Q�<g���&Q����ŕt;��L�ŕt;���F�+�vX:�y-�������0Z\I��ԉ�i���n����hq%�['6o�ŕt;|��|�W��0v�3Trg�h&e�ٙQ�����kg:E%w���R�����1*K0w�sTr�h.e�ݙR�����{g:I%w��&S���(��Q*M0x��Trg�h6e��S�����g:M%w���S<��8��q*O0y��Tr�h>e��T�����g:Q%w��&T|��H�ܑ*Q0z�3Urg�hFe��U���!��g:U%w���T���X�ܱ*S0{�sUr�hNe��V���A��g:Y%w��&U���h���*U0|��Urg�hVe��W���a��g:]%w���U<��x���*W0}��Ur�h^e���X������g:a%w&V|�鈕�+Y0~�3Vrg�hfe���Y������g:e%wʊ�V��阕�1+[0�sVr�hne���Z������g:i%wҊ&W��騕�Q+]0���Vrg�hve��[����h:m%wڊ�W<�鸕�q+_0���Vr�h~e��\����h:q%w�&X|��ȕܑ+a0��3Wrg�h�e�	�]���!�pm� !�w�l��a���l��i���l���hQ%�7(6/�E�d;��F�*�v�A�9�U��0�bs-�$����m���l�%��ѢJ���t�J�����B��+��W4�2�
M��`�@ˀ-4���;�E-��tK���C�,�3X4�2�M���a�Pˀ54�;�ES-��tK�����6�U�A͵�C�A,��X4�2`M'��Nb�dˀ?4Œ;�E�-�tK�,Ͷ8D�a,��X4�2`M���Nc�tˀG4ǒ;�E�-&�tK�<ͷ�DӁ,�Y4�2`M'��NdфˀO4ɒ;�E#.F�t&K�L͸8Eӡ,�CY4�2`M���NeєˀW4˒;�Ec.f�t.K�\͹�E��,��Y4�2`M'��NfѤˀ_4͒;�E�.�҉��U�Aͺ8F��,��Y4�2`M���NgѴˀg4ϒ;�E�.��t>K�|ͻ�F�-�Z4�2`M'��Nh��ˀo4ђ;�E#/��tFK�ͼ8G�!-�CZ4�2`M���Ni��ˀw4Ӓ;�Ec/��tNK�ͽ�G�A-��Z4�2`M'��Nj��ˀ4Ւ;�E�/�tVK�;8H�a-��Z4�2`!M���Nk��ˀ�4ג;�E�/&�t^K�XN����5�)��M �S�yꋇ�`?5��r
�:u>�r
p�Z}a98O����\�fNXNާ�EXN>�v=XN/�F8���r
�ؐ�)�<u �r
��Zn`9x�zL`98NM����.XN��gsXNާ�İ�|NFa9�t{��)��/XN��[,� ���,� ���|XN���kXN���ZXN��JXNާ7r��|N��`9�[vz��)��Né�8ų�i,����o����(�M��{B��;�_���i�����:o`�al_�LS!��:?�p���9p�����қ�h�ȿ��p�T^���UNS�A�w�T�Ӕ���q�p�<&i�iJ;��i8Mާ�d8M��L����4�W����p�T��A_��{G��}�R
�1�p��N	�p��B~�C�i
��)@���WK����o�� ��fPW�`4��A;d�-�L*�L��l� ��e0�ϫB�L� �C�т��8D�,XL�Rn� �!�e�`
�>d�,�K>�X�{)N�vH�Xp��C�Â�`r�� ��¿`-x���R��q{�Xz�ڿ��_)�u��.�J�cꂫ�spb.�Jq&���p�S
0^�K)�<��� ��M�`(x�C~R����Y�����S ����`&x, ^R�ϡ�}�J���M�NR�q�j^0��C`?��.�H^�F�)�q�L\0�<��-xH�C�ق��}h�Zp�|�ER��vh�Y���C�Ȃ}`&ܣ ��C`�<
�:|_���o���Ol�>z.8G��W��(���Yk�7
�9|�Y��B%�Ç��(�8��_0��ë��(�~x�`x^>.����zm��Ea=Ȳ�(���l�+��N�l�)��� �|�|�˲�صr�e��g�(�Vc��Q���~��,[��*gY��1'Y�{Uβl5���e�j�T9˲�بr�e��O�,�Vc��Y��ƿ��,[�UgY���βl5�U�e�jK��I��ƿ��,[�gY��Sβl5v��e�jlN9˲�؛r�e��5�/Y�Δ�dS��e�K�K����:�2v��%�ؔ�,cO�_��-)�2v��%�ؐ�,c?�_���(�2v��%�،�,{teY�(�C�;Q��e�F�?dY��YlC�C��P��e�&�?dY��YlA�C�;P��e:���,��,���!˂�'Ȳ`���,�{�,���!˂�'Ȳ`���,�w�,���!�B��Y���	�(���x�e�x<�28<Q��O�GY'��,���Q���	�(�`�x�e�v<�2X;e�� ���N���j;���j�P�7��v�o!�ͱ��_.N������G�Ϸ��$@��{�/B��7�_4���w�_��ﷰ_�����B�����H���W��~��E���|��E���'�t������o��ҧ��C\����!�֏��E���ic�E������Aŕ�^<q���C���+^<q5Z�~�)�����y�+�r�x��Jm�/���R���)��O;�/*�����Pq5����/*������E���i��E���yS��.q5��񋊫���[q5~�_T\�~Qq5�������ߊ+�-^L.q%���]���1���J�Ϸ������-�dLy�|�+�Z^<����1������V��A�U�_|~Qq��o��E�U_�OI����?&�_T\��oT    ?�#���U��������W�G������Qqտ2�Pq���s�/*�����W
�x�����0�_T\U�?��L��W���J���i�@�9Qq�?�.���Rhǿ<s`&Ό����W
��g����qQq?�J�������?h������Wѿ��Qq?�����`�_T\���Pq՞��_T\����󋊫��_�Qq�~�Qq�������Ja�/����
�|��B:_�W������yz�T_�+X��[�W&��\B�7����������P>��x�M��}��E�<����=��<���]�Op�/z	�>��*������ǃ��r�W���������Ɉ�E�ƛg�v��7�W=;+���[qu��=�/*��q������m�����;��W�A��Y�=4��ųt{�N>�E�UM������y+/���C�Z^<K���yI�����3d�W����Pq��4/����~�K�v����R��!%�'��ng����/����~�K�v����R���,�'��ng����/���~�K�vɼ��R��!4�'��ng����/��c�L��E���~�K���|�����Ѭ/���c����E���@�_T\�����A�U��}�V\i��g��������q��^�EŕF�x�ng����/���~�K�v�H���R��T�'��ngx���/��|o�����~L�vn��S��a]����ng���y0���~L�v���S���d����ng���y0����~L�v���S��al����ng���y0���~L�vȽ��t;���σ]���u���.��л��K�30��x���x��σ]�/p��y�K���o{?v�v�6n���.ݎ7���<إ�񲺽��t;�s���`�n�+��~���x���σ]�/���y�K��~{?v�v|h���.ݎ/	��<إ������t;�_���`�nǧ��~����j��σ��M|n��~����V��σ]��y��y�K��Q{?v���_D{?v���L�X�jHԋd��ϟp{?vi��_{?
vI�����O�]��s���`�`�W��إ�?']{?v���!��O�]j�s���C`�X����إ�?�z{?vI�����R��Ћ[	�Oj��.���`����%�?ů����T��n���_�H����~����j�ޏ~]�S���ɯK�4B{?�u	�h��.}�Q&����%�zq+u��Ћ[��j�g�.m�Qa����%�?�������G���_�0����~������ޏ{]��#V��i�K�tn{?�u��Dn�g�.M�Q�����%�'zq+E>�Ћ[	���s{?�u���5��c^���Ӷ�S^�����y]b��p{?�ui�����K�����^�������%�?wR{?�u���=�ޏw]2|���R�zq+���i�g�.��[k�G�.	��+m�'�.���n��.�9����KΔ�~��ߟӨ������k.��9����K{���~��ޝ�����d�ŭ���o��.�����8�%�?ե���T��.���\���T��~���ܟZ�ޏr]��SE��I�כ���z�y|q[����/���������������w�;�N���zE�_n�zC_��� ���*��|��^���۫T�"��e�@�/�Wi�A��_��&C�r{��&C/nK`'�^�Z_|��$#�^�J]?�^?��֋Y)�E��;2l�x������4����Rԝ��w�y������[��]���~��6��%��;*`�$z쨀ђ豣FK�ǎ
-�;*`�$z쨀ђ豣FK�ǎ
-�;*`�zђ豣F��GG������FK�ǎ
-�;*`�$z���N�ǎ
��$z���N�ǎ
L�zda����Rg��I��Q���D��I��Q���D��I��Q�ɝD��I��Q�ٝ@������I��Q��D���I��Q��D���I��Q��D���I��Q�!�@���I��Q�1�D���I��Q�A�D���I��Q�Q�D���I��Q�a�D���I��Q�q�@���I��Q���D���I��Q���D���I��Q���D���I��Q���D���I��Q����9vT`�'�cGF{=vT`�'�cG�{=vT`�'�cG�{=vT`�'�cG|=vT`�'�cGF|�:vT`�'�cG�|=vT`�'�cG�|=vT`�'�cG}=vT`�'�cG}=vT`�'�cG}2���Q�A�D��I��Q�A�D��I��Q�A�D��I��Q�A�D��I��Q�A�D���Aǎ
�$z���O�ǎ
�$z���O�ǎ
�$z���O�ǎ
�$z�����O�ǎ
�d#����>�;*FVDı�bd9'�C�����!��GGŐn���bH���Q1z�C�����!��GGŐn���bH���Q1������tT��?:*�t�C�����!��GGŐn���bH���Q1����=r���=wT��?:*�t�C�����!��GGŐn���bH���Q1������tT��?:*�t�C�����!��GGŐn���bH���Q1������tT��?:*�t�C�����!��GGŐn���bH���Q1������tT��?:*�t�C�����!��GGŐn���bH���Q1����R�tT)�?:*���C�����qǎ�!e�GGŐ2���bH���Q1����R�tT)�?:*���C�����!e�GGŐ2���bH���Q1����R�tT)�?:*���C�����)e�GGŔ2���bJ���Q1���記R�tTL)�?:*���S�����)e�GGŔ2���bJ���Q1���記�����76�σS���Q1%��S���Q1%��S���Q1%��S���Q1%��S���Q1%��S���Q1%��Sz��Q1%��Sj��Q1%��SZ��Q1%��SJ��Q1%��S:��Q1%��S*��Q1%��S��Q1%��S
��Q1%��S���Q1%��S���Q1%��S���Q1%��S���Q1%��S���Q1%��S���Q1%�?�9tTLi�sGŔ�>wTL)�sGŔ�>wTL��sG�ԥ�;*�����bJL�;*�����bJJ�;*�����bJH�;*�t���bJF�;*�T���bJD�;*�4���bJB�;*����bJ@�;*���bJ>�;*��z�;*�����bJY�;*�����bJW�;*�d���bJU�;*�D���b���cGŬ��ǎ�Yﺏ�^u;*f��>vT�z�}쨘����Q1����Q1����Q1�%w;uT�R�ǎ�YB��Q1KG;*f��cG�,}�X%���4���b��>vT,+h��_�d�޿�.��cGŒz>vT,i�cGŒr>vT,��cGŒj>vT,��>vT�z�ͭ������b7^�v4W�9Uc/�&Sb~�Мz{�1�$���?����'J/�����>�z�a�����l~��� v[�'v/�=��� /���@�[����"r~޷xP�\�9^ $51�o�� Hnb~_=y�B��ﴼ �(�������G�[��Z���z��$��b�ھ�6�P���� �P���� ���
���y��ݬ �P��K_/ ��\߷�^ $Cy_S{���}��@2���ź ɐ2��A_m����O^ $C��� �P��/� H���~������s� ɐ2���}�d���D^ $C��~y� ����� �]�c�����{s�x9�Ӗ�;���\�?Ä��	m����f���L�8¡�~���ph��uOá9��G
�s�ڱnq��;���G
�s�ڱnq��;���G
�s�ώu�#ܹu�X�8R��r�X�8R��[׎u�#ܹu�X�8R��[׎u�#ڹ�gǺő�ܺv��������6��uY�c��Hwn];�-��όw�[)�έ?;�-��έ3x�����k����M)��[�    ڱnq� vn�{,-��έ~�X��)r����c��Hwn];�-�p�ֵc��Hwn];�-�p�ֵc��#[�ώu�#ڹ�gǺ�Y��;{�����ڞ������Wkk?������
��W�S���4֯���07�i�����>�*s`f���;s`b�W��2���́i�O�*s`V�Ӽ�����S��@l�ߘ��߻*�1&q�~{x�-���d �*�`F�[e���.�*�`B&�V�e0 ѫ,����ǫ��c���Y�1x���c �*�`6⬲Fc �*�`2�[e�@�U��\D���b z�e0���*�`(b��fb �*�`$⨲&b �*�` ⪲�a �U��8�]eL�@�*�`�WY�0�O�e0
�UY�0{�e�_2���2���8�,�1�K�,�)�b.��` �*�`�UY#0��2��AO|�,���,����3���2�8�,�����2~��w���ķ�2}���,���Ve�@�*�`�%�*�,�����2�z�ث,�����2�y�8�,�����2�x��VYf�)��*�,n��пY�.��2�v����] V�sì�^e�ż�D�7�,�����2t���,�9�o����c��׬~�?��p���.1��o��\�����������ꈾX}~�o,���6x�\@�Co�0D]@F|&�G]@��/�X���7�3h�Y*~6<�Z|�"�P���s��'>��/��|FL�.���{C�|�ƴ>vq{�ᷕ�淾��bX��)����		�{�'=��|I�Ƿ�O#h�me��z>Þ���O���f��/�\|����1���u�3=i�d8��?����$㸧�Y<o8�á��Y=o8�á��Y>o8�á��Y?o8�á�Y@o8��AT4��v8�-���ə%�á�O����5�á|@54��v84�?vg����A��Tͬ�&�ph��f��F84UC3kh�	#Z���5�Ä-����0a�CK5���,L�_��ɬ!�	��R��!&渚V֐E���������d��XC�4 c����'��,���?�d֐�C3��gj�Y84㗃lB�4!�f��]��.��д�Y�O�y84�w��C��!��=�5���j�~�h�y8�¡�C��!�V8�}��>����P��v���C+�>�N�ph�Cه��~>A����'YC��d�����+��V8�}����6���I�'á���鼬���J������Se�(#(5���>�_PFPjpO5�}?������j(�~CA��=�P�!��2�R���d�!��2�R�{���C�e��TCهv�v����b8��˞j(��n����j(��n����j(��n����j(��n|��CK5�}h�ph�CK5�}h��-��'��z8�á��>�{8d���>�{8d�ׯ�'��Y�:�}���Y���}���Y�"�}����}�d�P����n=�54x����C]}h�p�,:�ه��,~��>�Շ�������ᐷ_?W���ᐇCه�����á�C]}h�p�á�C]}h�p�á�C]}h�p�á�C���y8�}��>4�	-�??���p����֓YC�����,"��<���fb��®V�O+Jx�.ՑzSs3v5�~�ssBvu�~��sQv��~��s`v��~�Q���XNM�Y5$���j��ԑ�yS外�	��_������-��*(5��Ѝ��(u�эc *)��Lэ$�)���э�'**5���-�Z�*u���rp%�Ͳb���b�u�^u�T]�9���F�5/s�*n�iA?C�i���4��G�z]@�W=���A�Ӡ��1��L�����(S��qZ5���u�^u��!>�&�L�A�Gpy]@�W������j�_#K������W٨�iT����Tz5«lU�*�nx���Tz5«lV�4+��y��V�t+&��Q�lW�+F��)��W��+f����W��+���ٯ��R�b�n�+�+˿c9q��R�b�n9���R�b o�s�+�+&�����R�bo���+�+O֓��U�b���G�t]@�W�7UW�W��8��3�7N�b�a�g�_�ӯ�q���\P���j��ԯ�q���\P��
���*��1����#p�.��o�b�gW>���ë���~e��8�����~e�8(�3;y~W0&r2�M��T�2FrP�͡gG>K���~5կ��/$1a��j�_S9���ֳ�+c,ǁ<�t=˺2�r��)��~e�8��=��~eL�8D��Cώ|�^��k|UT�O�W�í��}�Yz�ë�WS�ʘ�qh7]�z>K�vx��j�_Y��I�U���~e�8艛S�f]%om[���YW��8`��[�f]1��p*n��ͺbH��֟	��Ò1��P,n���_c:���*��1��0.n���_�:���*��1��0n���_��oo��P]e�2fu>�45��~e�8������Wƴ�9�T]e�2�u����S镇WSu����1C�����W�Ď):�T]e�2Fv��a�\u��ʘ�1I���+�+�v����J�j�Jˁ�|6늱�t���R�bn�ySu�~�߹��s��Ecn�!~�d]�ӯ�۱  7��ͺbn�� ܜz6늹�p�ճYW��XZ��[�f]1�c�n��ͺbnǲ�)��W+������W�����uys�٬+�v,x�9ʰN�bn�r�|�l�s;K��٬+�v,��M׳YW��Xh��-�U�bn�2�����s;i��ԳYW��X��c�l�U~o�U��u�U~�iz6�J��ۯ�$�eˏ�=��+���
�ë��R����=��+����ë��R���=��+����yFu�~��»��>�~�܎�0���R�bn����J���i~��ӯv�`^MՕ�s;���J���KtpSu�~�܎<8e��R�bn���T]�_1�c�n��ԯ�۱4����٬+�v,�MՕ�s;���J�����~�T��cnǒ$�d]��_Y����XC�f]1�c9nN=�u�܎�N���٬+�v,��g���۱P
7]�f]1�cϗ�Y�+�v,��͞Ϫ_1�c	n=�u�܎Z?���ӯ�۱|7_=�u�܎�]�iz6����*��{�s;��]�gկ�۱l7{>��ʙ۱�7��e]9s;���_>��Yz�«�W���3�c}n���|�^�����3\���Xۆ����W�܎�o����~���X�����W���v��P]e�r�v���M�U�+gnǊ;�T]e�r�v���)K>��ʙ۱Z7UWٯ��k�pSu��ʙ۱���p�и�J�6�~���_9s{�ȩ��~����)��*��3�w��\���W��G��j���_9s{��ϥ��~���GG��*��3�w�:]���W���y`u���_y���:_{��<߃���_����{��v�+S��|Z��~e�W��A��ٯL���=hq�<���_�~�yk׳YW�4�s�|6���{�xʻ�ٯ<߃ΛC�f]�{�ۯ��*���*���_y�=��~e�W��A��_����{�ë�W�~����*���~��A�M�~e�_�{��ڳ_��W����Wv�߃#o��ͺ�{p� ~��3��|��+�+�G. P]�_�=8ry��J������Cu�~����҂��R��{pp��P]�_�=8�,a��ԯ<g«��R��6�MՕ�߃8�J�N��{�bpSu�~�� ����J���A���MՕ�߃8��+�+�q27UW�W�k�^5.�P]�_}*�jZ,�Ϯ|�^��j��د>�^u�T]�_}*����BM�}j�mĀx����J�z��g��������Wy�^�X���*/�ҫ�C�_�ŧ�=�C2��z��,߃8%��|���S�U�ٯ�*��G�]@�W��Z+"���ҫ��#��}��r	��_�Tz5«�Wy�^��*�U^@�W#��~���� ����ԳYW|����YW|��nn=�u�� N���٬+~������ҫ^��Ⱥ��+��M�    �Ⱥ�9^��Ⱥ��+��M��Ⱥ��+���M��Ⱥ��+��M��Ⱥ��+���	>;����
GgpSu5����
ggpSu5����
�g~V�8���j��jf]z�«���YW�~��3����YW#ǧ«��ZYW�~�4���R���+��MՕ��_��YW�~�C4���R���+���MՕ��_��}��S���ðQW��J��8�~����塖�g����
t��iN]@�Y�8��~��O��+�9�&:u�^���d�s.�ҫ7���_�*�ڼ9�l��_���4ש��j�W�W��J�6���ͺ��+`:�F;u�^m.�j����_��4ܩ�O}s0/�b��Tz�-�o�YW�~VG�|�.��+�MӳYW���u�Ǐ>�^Yx5TW�W���u4�x�*���j��ԯ��A�h���Tze��P]�_1����4��9ŨCS�9P�qA��J�*�9�7UW�W���v4�z�*���j��ԯr��ë��R��iO���J�*�==�Z�+������j��ԯr��y4]u�~��^-Օ��F>y�Lu�~��O�T]�_���ӊh�ʩ�'N�e�j�_�����yC�f]�h�Gɲ#�ӑr�k�5ܩ�O���'�fGj�#�t�cyn<�*�;S���:��䉻�H�t$����hPP���eGj�#1�O�ˎ�NGb2�<u�����d>y�.;R;��̎�1O]���9�Ms���J���.�+��W-�ʎ�IOoL�`w4�z�*��աNoO��WC���1����4������WC�&�#5&sP<��=u�^��j���#5&sP<�&>u�^u���9P�U���*;Rc2����*;Rc2��,��Tz5�]Bu��1�O������H��|r��T]eGjL擫1��*;Rc2ţi�S��d>��s���#5&��u�Ku��1�O�]���H��|r��R]eGjL�xܧL�1����4 ���jƚ��H� ��s��8��ͺb2��r�ճYWL�3׵n=�u�d>��5���@�1��\��ٯ�����W���d>��6��A�1�O���~�IPoL�kq�_i����J��W���d>��7���A�����_i������W��+&sP<��Au�^-�u��l��9(M���J�^�4=�u�d��}���9(M���J���j��ԯ��A�h��Tz��WCu�~5�Cx5TW�WL�x4M��*�z��Ϫ_1����4���j��J������YP�����J������P]@�W�k�UW�WL�x4M��*����R]�_�y $�Z�+�+&sP<�&Bu�^m.�Q]�_1�cA�D�.��+k�9soL��G�4�����z��q��9v4M��*��8���j�~�d��M���T&sl&h���<=cy&�Ϫ_1�c9A�D�.��+�͡g���̱��,&�Tz��U��q��94M��*���*��8���+
�&Bu�^yx��j�~�d�%M���J��rM{>�uey�(��~5N��<kě�g���̱��^4����
�&Bu��ʅK�+�+~QǮ���P]@偣�TW�W���V�4��OenǺ���P]@噣�r)�U�bn���P]@�W�7UW�W:��~���*�j��T]�_�Ѭ^MՕ�U��j�N��R���Y��TW�Wy:��WKu���3�cqA�D�.�ҫ&dA>��Yz�«���~ՙ��x-�U���܎���	�O�b��ٯ4Ꝺ��&Bu�^�@Cd��D�w�v,0h��Tz�����e]u���e^ٯ4Ꝺ}qwF�+M�zgn_�<��ٯ:s��G�]@�W\���J�ޙ��gd��D�w���ٯ4Ꝺ��&Bu�^��*��&B�3�c�A�D�.>����&Bu�^K|G>�u�܎uM���J�&o��ͺbn�B�{Ոw�vl4h��Tz5ë���~�{�����*�Ugn�R���P]@�W3����W��k�&Bu�^M˵(|6�Ugn�b���P]@�W�7UWٯ:s��ŀ�W���ܾ�����_u�v,7h��Tz�«���~�G&���*�Ugn�~���P]|*s;(M���J�Vx�TW�W���x4M��*�zySu�~���ǽk�;s;(M���J��X���j�~��^n��z6늹���P]@͓�o��z6늹���P]@�W��^>�~���G�D�.�ҫ͛C�f]1���q@F��J�vx��j�~���G�D�.�ҫMD��٬+�vP<�&Bu�^��*��:���c��U��u�s;M���J�vx��j�~���G�D�.��+���,��ܾ�u�+�+��E$�P]�_1�/⤆�J���}E5TW�W�����R�bn_��R]�_�<ӭI|V���}%zKu�~�ܾۥ�R�bn_D~MՕ�s�".l��ԯ����h��Tz���T]�_1����4����ë��R�bn�i"TP镇WKu�~ey ��TW�W�'�ySu�~���%�g۔w�����W��W��/vٯ�ӯ��_��_��_1����4��<�ܮ�P]|*s;M���ʓ���f,>�~���G�D�.�ҫƛC�f]y�h?�;]@�W-��~��~��H�D�.�ҫ^e�zO�bn�i"TP�U��_i"�s; M���J��p���g�U��_i"�GnV�iz��Yzիթ>�[!����W#�+t�*S]e��]��WCu��j�z�^�U����zx5TWٯF.X���P]e��a�[�F�ٯF�X���T]e���o>���~5��A9�G]@�W�{fUWٯs;� M���J������_�vPA�&Bu�^��j���_�vpA�&Bu�^q�R]e���/�.�U�����r��R]e���X\u���܎�U�ɺ��W����ps�٬��[;��w�٬+���ky�_m��������g����_���~�կs��=xٯ���`n�/��V���/7�e���W����*��W[�j0���S�j�_�v��MӳYW��Xf���g��F�8	��_m���܎uV���Y�+�v��ͩg���۱Њ�|6늹�ps�٬+����MӳYW���iu/��܎�V���R�bn�V+�T]�_1�c�n��ԯrs�^Օ���}0��P]�_1�c�n��ԯ�۱ڊ����s;v[��J���˭pSu�~�܎�V���j�WSu�~�܎�V���R�bn<7UW�W��X����+�+�v��MՕ�՛�s«��R�bn�,"��٬+�v���MՕ�s;v`��J���K�>�۱�i�]P��B��Wv�s;�`5M��*��XI���N�bn�&��	v]|*s;Va5M��jn�܎�gկ�۱�i�]P���гYW��X�u�غ�J�<��~e�_1�c!V��.��+��_��W��X��4�����ë�Wv�s;�b5M��*�rK<x>�ue��)��~e�_Y�e�MӳYW��X�u���܎�XM캀�R��uՕ�s;vc5M��*�3=\u��R�bn�v��	v]|*s;�c5M��*�3=��Q���s;d5M��*�j���R��\b�~��J�Zx5UW�W��X��4�����qO��J���k��&�u�^��j���_M��M��R]e���������~5��7��Ku��j2�ob��*��dnǲ�{��'7~�v��Wg�}2�c]V��.��+�vM��*�Bn��.��+�vM���S�۱2�i�]P�U�܏�g�_M�v,�j�`og�}�n�|d���Tz5«�Wg�}�v�^e�:�S��«�Wg�}�~�^e�:�3���*�ՙ`��!m�Wٯ���i#��~u&�g�Hd ,=�u�K�Fx���L�O�v��j�`og�}2�c�ֽt�'s;6h5M��*����P]e��=wɅWCu��j2�c�V��.�ҫ^�U���܎ZM캀J���d>��j2�c�V�{;쓹+��&�ۙ`���;�7�Wg�}2���ͪ��W��+��&�ۙ`���X��4�����x/�Z���W��}���TW�W��h���R�bn��d�TW�W�훫���J���}s��R]�_1�c�ֽu�'s�N�Fԕ.��+6دt�^�>�g����7Z�_�jn)����W��T��͕��W��J��Ӛ���	�    �ܾ�Ԛ���	��܎Z]��L�O�v���`�g�}2�c�V�{?쓹+��&���`���X��5����dn�
��	�~&�'s;VhuM��3�>�\�^�_�3�>�۱B�k���	��܎Z]��L�O�v���`�g�}2�c�ֽv�'s;VhuM��*���j��ԯ�۱B�k�]P�ݢ�R�bn�
��	v]|*s;VhuM��j�Ԯ�����«��R�bn�
��	�~&�'s;VhuM��3�>�۱B�k���	��܎Z]��L�O�v���`�g�}2�c�V�{?쓹+��&���`���X��5����dn�
��	�~&ا�P.�W]�_Yn�MՕ�s;Vh�{�}2�c�V��.��Tc�|��3�>�۱B�ku�.�re���_����܎Z]����T�v���o�Tn},w��\@��ЇX��Ϫ_1�c�V�|{?���s�*��/=�u�܎Z]���̷O�v���o�g�}2�c�V�|{?�퓹+������o���X��5���|�bn�
����~��s;Vhuͷ�3߾�۱B�k������܎Z]���̷/�v�к����C^�U���܎Z]����J�zx5TWٯs;Vhuͷ�*����P]e�Z��X��5߮���[B�s.�ҫ^M�U����n���*��bn�
����~��s;Vhuͷ�3߾�۱B�k������܎Z]���̷/�v���o�g�}1�c�V�|{?�틹+������o_��X��5���|�bn�
����~��Wn7�����~�r��ly�W�7�=n���|���_��o���p<��ԳYW���p]����J�&y[�f]1�c�V�|�.�ҫiI�Ϲ�J�� �5���|�bn�
����~��s�XR��̷/�vȓ�ՙo_��X��5���|�bn�
����~����u��U��3߾�۱B�k������܎Z]���̷/�v���o�g�}1�c�V�|{?�틹�^�4=�u�܎Z]����J���j��ԯ�۱B�k�]P��^Օ�s;Vhuͷ�j�����J�*i!ox5TW�W��X��5���|�bn�
����~��s;Vhuͷ�3߾�۱B�k������܎Z]���̷/�v���o�g�}1�c�V�|{?�틹+������o_��F&�R]�_��h<�Z�+�+�v#�f��ԯ�۱B�k������܎Z]���̷/�v���o�Tz�ܮ�v]@�W��o�Tz�ܮ�v]@�W��o�Tz�ܮ�v]|*s;Vhuͷ�jne7��~u��s;Vhuͷ�3߾�۱B�k������܎Z]���̷/�v���o�g�}1�c�V�|{?�틹+������o_��X��5���|�bn�
����~��s;Vhuͷ�3߾�۱B�k�����e��>��~u�ۗ�{�4=�u�܎Z]�����-�Ox5TW�W��X��5߮��c��WCu�~�܎Z]�����M�Ox5TW�W��X��5߮��e��WSu�~�܎Z]���̷/�v���o�g�}y.����J���+������o_��X��5���|�bn�
����~��s;Vhuͷ�3߾�۱B�k�������+������o�۱B�k�������+������o�۱B�k�����7ϥ>��1���I���rLGAle�1��-�l�Qp��Qg�rLFA\i�1�-P[��(��`m9Ƣ Z�rLEA������)`[��(oؖc$����嘈�8
ؖc 
�,`[�y(���m9ơ �l�1q�-�0D+`[�Y(�^���P��>l�1	��-� �^��sPG�r�AA�l�1q�-�ķ�m9f� �����hl�1�ؖc ��S��N[�r8A�l�1�q�-�x�Y���MW�r7A|ؖ�ς�s��<�|���� �\�-.�%�l��gA��7��� �Yp�����<�|�����p�f��w[l�_rW�-`[t>����Yp.ؖ�ς�s��<�|���A� �\�-:��my��,8l˃�gA��`[t>����Yp.ؖ�ς�s��<�|���A� �\�-:����/T����3p���<�|F��Pޖ��H����� �	8�Bu�[�>#G_�r˃�g$���any@�����b
�
���H���[?#��nyP������3p.���H���[ ?#�boy�������3p.����H���[0?#��oy�������3p��<x~F��P���H������ �	8�Bu \H?#G_��˃�g$����py@��}�:.����s��<�~F�E����	8���g$�\,.����s��<�~F�E��`�	8���g$�\<.����s�<�~F�E����	8���g$�\L.�L�A���\�����/T����:8�Bu�\�����/T���	;8�Bu�\�����/T���;8�Bu�\�����/T���);8��7cvp.&�o�� �\L.��A���\�����s1�|3j�br�f�����Ͱ����i;8��wO:�[0�|3o�br�f����������囑;	8�\������/T��囡;8�Bu�\������/T��囱;8�Bu�\������/T����;8�Bu�\�����s1�|3z�br�f�����  	8��7�yp.&�of� �\L.��A���\��΃�s1�|3��br�f>����̀����	=8��7#zp.&�of� ���ar�fH��P&�o�� ���ar�fL��P&�o�� ���ar�fP��P&�o&� ���ar�fT����ͬ����a=8��7�zp.&�o�� �\L.���A���\�؃�s1�|3��br�fd���������囡=8��7S{p.&�o�� �\L.���I����������囹=8��7s{p.&�o�� �\L.���A���\��ۃ�s1�|3��br�fn���������囹=8��7s{p.&�o�� �\L.���A���\��ۃ�s1�|3��br�fn���������囹=8��7s{p.&�o�� �\L.���A���\��ۃ�s1�|3��br�fn���������囹=8��7s{p.&�o�� �\L.���A���\���{����囹=8��7s{p.&�o�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7��$��ar�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1��br�1�'��ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�=8�ˍ�}�?L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.7�� �\L.w���s1�>�^�V0�>�^�^0�>�^�Q0�������Tz�W���Tz�߂�����������[���Tzս`r}*�ʛ�2�>�^�V0�>�^�^0�>�^�Q0�������Tz5V���Tz5ނ����j�����jX���Tz5�`r}*��O���Tz5[���Tz5{�    ��Tz5G��r�{08��S��\��S��|&קҫ�&קҫi��S�������j=��S��j��S�����S���˝�� �\L�O�WkUL.�{087������r���s3���� ��L.�� 	8�\����UL.����+&��{����=�Ί���|W���|�o���|��bry�_��\����+&��{p?���=�[���|�^1�<߃{TL.�������=�W���|�bry����\���m���=��br9�_aD��r~�������~�����
 
&���@L.��+,�(�\��WX Q0��߯� �`r9�_aD��r~�������~�����
 
&���@L.��+,���\�y� n(d�嫠rA�]�X.���w��L��
0d:�^�� s��{�FsA�|��
6d��8d�x>��s}rNy>��sA��
>dNz>o��Y�g�.Ȝ����9'b�`tAΙا�tA�k��.�t������Qp�>���s�� ӵ�
Rd�������]�� ӵf�2]k^к ӵ��.�9K�
^d��{�L��(�]��X�͊dd��W��L��[@� ӵ�jd�֭�vA�k�nd��w�wA�k��.�tm�����Q��>�?@:�2]��wA�k�-�]�����2]V � ӵ��2]#N��2]��`xA�k��Of�f��F�2m���xA�-�-8^�i���2m�>�����L/P^�i�z
�dڲZ�L[V/h^�YLk8�O~s�</�tm������ zA�kkH/�tmY��LזP/�t�}
�d���������zA�k�(�^��|͕��<�
�d����2]{w��L�^+�^�����2]�O���L�v+ _�����2]ۣ@|}2�~u.�d��W����Hނ����]`� ӵm�2]�^�� �5ru��� �5k�2]�^�� �5�듙����Y�C��L�l�/�t�ނ�9�����a��E��L���d��O���L׼�/�t�{A��L�|د�4����\�/�t�W��L��-�_����9-Y���L���d\�C�_�yt�i��Q��2�/=� �}2��v4z`�y��Y21=o� ��cL�. `�y�鱂9{y���ǽ�����V�� ӵ�d��F���<��f��L��*``��Z{d��v��Lך<0�t�y�L����C����Z��L�z/�`��Z�������C�L��*�`��Z.d��w�L��/2d�ֽ@�A�ky�_6d�6Z�L�F/�`�������s�� ӵ�
@d�6ނ���] � ӵa#2]^@� ӵ��0�tm����^p� ��Q��>��Gs�����U�� ӵ��0�tm���M+ha����������A�k��0�tm�����Q �>��㬳`�A�kk�0�tm�52][���A�k�
nd��� �A�k���!�A�ko+�a����vd������� X==r^>2]{߂���� �A�k���"�A�k�1�tm?C2]ۭ��A�k�1�tm�#���� �=G2]۫ �A���oA�L��.Pb��ڶ�%��m/`b��=M2]�V�� �5�O2]�Q �>���"�A�k�
�d�fo�����w�L��
�d�f^`� �5
�d�� �A�k��d��@�}ٞ��b�A�k�
�d��oA�L�|x1�y\�
�d��^ � ��>�c�yh�ib�Q�c2�?���}2�6��E�����*0c�y|�y�d�v��#����"�A�5^�� 碃�`�A�k��1�t���6���Q��>����A�km�1�t��q2]k�@�A�k�
�d�ּ��A�k�)�c�sAD+�c��Z�w2]� �}2�6��E�L��*�c��Z�d��w�L׺�1�t�{��L����1�tm�@���^� ӵ1
�'�o� �\2�tm�B������A�kc2�tmX�!�L׆ 2�t�ܟ?$2�tm�E���^�� �B�Q��>��碑A�ks82�tm��2]�� �A�k���"�A�k�$d����I���V@� ӵ�*d��F�%��7�̂K���U�� ӵ�d2�tm�M��-+�d����N���OA'�L��V�� ӵ�|2�t�����A��.B�\��
Dd����2]{w)�L�^+(e�����2]�O�)�L�v+@e�����2]ۣ@�}2�62��*�L��*`e�sq�[�� ӵ�\d�����A�k�`d�F>�bd�f�@�A�k�fd�f���}2�6F�E-�L�l�2�t�ނ[9.�\���o��\����2�t͟�]��y+�e����^���(�e��� hA�2]�U � �5�d��@�A�EUV0� �5�b9\�|��2wY=���A6ʽ��A�>�g �O����Hf����Y�2�Z=o�2�̽V�.`f���걂f9|y�3�L��S�� ��V � ӵ��d��F�4�d�m��i���U@� ӵ�T3�t��k��5+�f��Z�l���#�l���V�� ӵ��d��G7�d�m,��n���U�� ӵ�|3�t��p���o��p��u/g��Z���q���V@� ӵ����87
��'�ι1�d�6V:�L��[�� ӵ��d�6�`�A�k��d�6��v���V�� ӵ��d�6G<�䕛�fA<�L��*�g���|�d�6w=�Lצ�3�tmz�=�L��Sp� ӵ�
�d��zA>�L��(�g�̿�4t�� ��U�� ӵ��3�tm���-+�g��������7�����@�A�ko/h���;
�'�o��)h��ڻ
���4�t��2]��	2]{�@�A�k�)Xh���n2]۽��A�k{8�O��X�q�� ӵ�
 d��߂�97j����m+�h��������SP� �5k2]�^p� �5���Vx�d4�t�V�F�L��-�h����97�ZAG�L��<d��O�G�L׼�4�t�{AH�L�|���L�m�e7#2]�U@� �5Jd����A�kn'rnp��9w�>)2��>�@�A6ʽ`�A�&�g��O���&ҁ�CK��m��*pi����y^dnt}vL�̝���4����x�L�L��S0� ���V@� ӵ�jd��F�M�d�m�������U�� ӵ��4�t�����5+�i��Z��������A�k��4�t�������Q �>��H
A2]�@�A�k�-j��Z�D2]�VP� ӵ�F2]˻�r� ӵ�
�d�6zAR����G�R�d�m䢋����U�� ӵ�45�tm����+xj��������_����V � ӵ��d�6GU�d���U2]����A�k�-�j����X2]�V�� ӵ�Z2][O�V�L�V+�j����]2][���}2�6���W����WX�L��[� ӵ��d���`�A�k��d��>e2]{[�Y�L��^p� ӵw��O���5�y�CZ�L��U�� �N��`�A�k�.`k���km2]{���A�k�)xk���np2]۽ �A�k{ȵO��A8��k���^t2]�oA]����w�]�L׶�5�tm{^�L��9�C^�L׬�5�t�z�^�L�l�O���:�y�C_�L�l�5�t�ނ����. l�s�6�tͼ@�A�k�6�t�[a�L׼6�t�G�ak���A=�8l�隯����[�� �5��2]s+Xl��]��r��������86�F�<6�d<� �}2�6���"dr�U � �d��2Y�.�l�I3x���A&���������AN�C+�l��Z��2]k�@�}2�6��f�L��*�l��Z{:d��v�g�Lך|6�t�yh�L��C�Ch����bx   �>D�(�l�ȿ
fAg��i�����l6����@�A����"]*�l��Q�٠&�� �A����f��{�0ۧ���Y�٠�>��5w�`6���� �A�]��j�'.�lPs?qf��;w0T�S/�lPs7jf��ܟ70��aY�٠�^��5w`6��?� �A͝p�j�+�lPs�Yf��=� �A�}T��Sso�,�lPsoPf���p
0���R�٠�Β�57p`6�yP}d�6�p)��������l�Y      �	   y   x�3�4�,�L�/�{��j{6}=ݻ������t���{fX��;��H+<�m|���r�|�gs��$�=]2��]@u`y�:C+SS�'����k]5�� (�id�ih`����� C�G�      �	   �   x�m��!ߦ�4 ����"R�}����;Z�>F�!pSv++���g���cX꒥h"���7�f�^Ս]�*���l"hz^�k�<mμ
�v�E��k�<AF�%b�\�/���#	W�����zL~�sO�$
w
!|4�2X      �	   S   x�Uʹ�0��[,�{���M�% "B��i$���M�d�&ܯ)�p��8zRHfF]T7���7I�-���M��Dtfz      �	   �   x�%�M
�@�ur1��v��1�� :օ�؅���,-�f"×�K>�xڒ�>�坿�=fa��L���F��0x@�b�C[
�I�m6���N�"SG��*c���B������W���}�"�daOe�-� �6
�+L̢~���7+f���J'      �	   �  x���Kn1@��a,W�	N�1��E1hB""XD��(���9M:�[P�nOw��#"%ӣI^�]~.{@t�o�y�\�Ǐ�-��Zȿ"�@Ϩ����ٷ�������yB � �DBOB!	"E7�����D�"`a��m��(`6vS��iW�7���'�I3���H�����|�40�����^���^��xֽ~�id���U
+*~��nE+ � �blg��X�Fc��)S����m��^��� Ag�/0<�J�*a�A��᠄���~X<�����w���Y|y��s�5����w/�����K��yAi$
|X�h%�>��g`��FVg�JS�Fּ�K�gXc�5z���F�#/��s/]d��x	��.� �ń�L���Ll���33���Ç������6Zf)%r%=[���e�"b#��Y�)^m"���xh5�j{����j{*���Z�)���	��N�^|[�-,��^g�8H��=s{}x��I���팬�S.$z㥁���n���b�{�)�e,w	�J�Z�S�J�oc�	��=�͙���٨��A�"ҋ �+�72��H%�@Q�	�<�yZ�|�n1m(hI����/������ݻ��&Ɔ*����Jr#v;]js�[�'���J�_%ﺰ�X���D�'��^��Mw���<�O��M?t����֋.PF��-��a7��Mvd8w,��QҪr6�f�Y�]s��I{r"w�*������Y٦Y55�-u+�t+���ХvEͩ�c̗�	��Qݟ�N7�������Tj0s��<
����\�+P5��dw�)W��2�:�]s�)j�S��R6|��΍c!E�9���:����S~zI7���a�0�,�ؗ1O�o�gg}]A�(����P��0l�骑Y�f�XI)�̱��     