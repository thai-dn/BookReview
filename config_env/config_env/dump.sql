--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    title character varying,
    description text,
    author character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    category_id integer,
    book_img_file_name character varying,
    book_img_content_type character varying,
    book_img_file_size integer,
    book_img_updated_at timestamp without time zone,
    avatar character varying
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ckeditor_assets (
    id bigint NOT NULL,
    data_file_name character varying NOT NULL,
    data_content_type character varying,
    data_file_size integer,
    type character varying(30),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ckeditor_assets OWNER TO postgres;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ckeditor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ckeditor_assets_id_seq OWNER TO postgres;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ckeditor_assets_id_seq OWNED BY public.ckeditor_assets.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    rating integer,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    book_id integer
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    book_id integer
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar character varying,
    provider character varying,
    uid character varying,
    name character varying,
    auth_token character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: ckeditor_assets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ckeditor_assets ALTER COLUMN id SET DEFAULT nextval('public.ckeditor_assets_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2019-04-06 10:57:19.460527	2019-04-06 10:57:19.460527
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, description, author, created_at, updated_at, user_id, category_id, book_img_file_name, book_img_content_type, book_img_file_size, book_img_updated_at, avatar) FROM stdin;
1	Fifty Shades of Grey	<p>When literature student Anastasia Steele goes to interview young entrepreneur Christian Grey, she encounters a man who is beautiful, brilliant, and intimidating. The unworldly, innocent Ana is startled to realize she wants this man and, despite his enigmatic reserve, finds she is desperate to get close to him.</p>\r\n\r\n<p>Unable to resist Ana&rsquo;s quiet beauty, wit, and independent spirit, Grey admits he wants her, too&mdash;but on his own terms. Shocked yet thrilled by Grey&rsquo;s singular erotic tastes, Ana hesitates. For all the trappings of success&mdash;his multinational businesses, his vast wealth, his loving family&mdash;Grey is a man tormented by demons and consumed by the need to control.</p>\r\n\r\n<p>When the couple embarks on a daring, passionately physical affair, Ana discovers Christian Grey&rsquo;s secrets and explores her own dark desires. Erotic, amusing, and deeply moving, the Fifty Shades Trilogy is a tale that will obsess you, possess you, and stay with you forever. This book is intended for mature audiences.</p>\r\n	E.L. James	2019-04-06 11:01:45.082965	2019-09-27 12:22:40.973373	1	5	21942587._SY540_.jpg	image/jpeg	23870	2019-04-06 14:55:28.285932	image/upload/v1554625571/gfiftr7qhpu2h54v3xj2.jpg
15	Cowboy in Wolf's Clothing	<p>Born a cowboy and bred a warrior... High Commander Colt Cavanaugh has spent his life defending his pack and its sprawling ranchlands. But the hardened Grey Wolf soldier has a dark secret that could destroy his life forever.</p>\r\n\r\n<p>Belle Beaumont is a wanted woman, on the run from the wolf pack that kidnapped her. When fate brings her face-to-face with the Grey Wolf High Commander himself, rivalry becomes passion, and suddenly more than just her freedom is at stake.</p>\r\n\r\n<p>Colt will fight to the death for the healing Belle brings to his battle&mdash;worn heart&mdash;and for this cowboy wolf, all&#39;s fair in love and war... Seven Range Shifters Series: Cowboy Wolf Trouble (book 1) Cowboy in Wolf&#39;s Clothing (book 2) What People Are Saying About Kait Ballenger: &quot;Paranormal fans have a new voice to check out...intense and riveting.&quot;&mdash;RT Book Reviews for Twilight Hunter, 4 Stars &quot;An extremely promising high-voltage start...&quot;&mdash;Publishers Weekly STARRED review for Twilight Hunter, a PW Top 10 Romance Pick</p>\r\n	Kait Ballenger	2019-07-08 10:53:48.629518	2019-10-02 07:19:07.303987	1	9	\N	\N	\N	\N	image/upload/v1562583228/mmly7rg5n10jcafr5d9l.jpg
4	The Future of Humanity: Terraforming Mars, Interstellar Travel, Immortality, and Our Destiny Beyond Earth	The #1 bestselling author of The Future of the Mind brings us a stunning new vision of our future in space.\r\n\r\nHuman civilization is on the verge of spreading beyond Earth. More than a possibility, it is becoming a necessity: whether our hand is forced by climate change and resource depletion or whether future catastrophes compel us to abandon Earth, one day we will make our homes among the stars.\r\n\r\nWorld-renowned physicist and futurist Michio Kaku explores in rich, accessible detail how humanity might gradually develop a sustainable civilization in outer space. With his trademark storytelling verve, Kaku shows us how science fiction is becoming reality: mind-boggling developments in robotics, nanotechnology, and biotechnology could enable us to build habitable cities on Mars; nearby stars might be reached by microscopic spaceships sailing through space on laser beams; and technology might one day allow us to transcend our physical bodies entirely.\r\n\r\nWith irrepressible enthusiasm and wonder, Dr. Kaku takes readers on a fascinating journey to a future in which humanity could finally fulfil its long-awaited destiny among the stars - and perhaps even achieve immortality.	Michio Kaku	2019-04-06 11:08:48.895371	2019-04-07 08:24:49.459194	1	3	36407347.jpg	image/jpeg	67285	2019-04-06 14:54:32.213315	image/upload/v1554625489/e6ohvviwqtwxdh47s1qc.jpg
8	The Dispatcher	Zachary Quinto - best known for his role as the Nimoy-approved Spock in the recent Star Trek reboot and the menacing, power-stealing serial killer, Sylar, in Heroes - brings his well-earned sci-fi credentials and simmering intensity to this audio-exclusive novella from master storyteller John Scalzi.\r\n\r\nOne day, not long from now, it becomes almost impossible to murder anyone - 999 times out of a thousand, anyone who is intentionally killed comes back. How? We don't know. But it changes everything: war, crime, daily life.\r\n\r\nTony Valdez is a Dispatcher - a licensed, bonded professional whose job is to humanely dispatch those whose circumstances put them in death's crosshairs, so they can have a second chance to avoid the reaper. But when a fellow Dispatcher and former friend is apparently kidnapped, Tony learns that there are some things that are worse than death and that some people are ready to do almost anything to avenge a supposed wrong.\r\n\r\nIt's a race against time for Valdez to find his friend before it's too late...before not even a Dispatcher can save him.	John Scalzi (Author), Zachary Quinto (Narrator), Audible Studios (Publisher)	2019-04-07 09:58:54.786249	2019-04-07 09:58:54.786249	1	4	\N	\N	\N	\N	image/upload/v1554631134/sj5wsle01ogtf8rgoar9.jpg
5	Quảy gánh băng đồng ra thế giới	<p>T&aacute;c giả Nguyễn Phi V&acirc;n với kinh nghiệm l&agrave;m việc v&agrave; sinh sống tại hơn 60 quốc gia tr&ecirc;n thế giới, trải nghiệm qua nhiều c&ocirc;ng việc từ dọn ph&ograve;ng, chạy b&agrave;n đến c&aacute;c vị tr&iacute; l&atilde;nh đạo, cố vấn nhượng quyền thương hiệu cho Ch&iacute;nh phủ Malaysia. Chị l&agrave; t&aacute;c giả của c&aacute;c quyển s&aacute;ch nổi tiếng đ&atilde; xuất bản như: &ndash; Nhượng quyền khởi nghiệp &ndash; Con đường ngắn để bước ra thế giới. &ndash; Quảy g&aacute;nh băng đồng ra thế giới &ndash; Bức tranh về nền kinh tế thế giới. &ndash; T&ocirc;i, tương lai v&agrave; thế giới &ndash; Sổ tay ra thế giới Kh&ocirc;ng chỉ l&agrave; doanh nh&acirc;n, Phạm Phi V&acirc;n c&ograve;n l&agrave; diễn giả truyền cảm hứng cho c&aacute;c bạn trẻ c&oacute; kh&aacute;t khao khẳng định bản th&acirc;n.</p>\r\n\r\n<p>Cuốn s&aacute;ch &ldquo;Quảy g&aacute;nh băng đồng ra thế giới&rdquo; đ&atilde; đ&uacute;c kểt ch&acirc;n thực, đầy t&acirc;m huyết về t&igrave;nh h&igrave;nh kinh tế thế giới ở một số quốc gia v&agrave; chặng đường 20 năm trở th&agrave;nh c&ocirc;ng d&acirc;n to&agrave;n cầu của ch&iacute;nh chị. Từ củ tỏi ở Rome đến ớt Indonesia Cuốn s&aacute;ch gồm 20 chương, mỗi chương đề cập đến một quốc gia, xuy&ecirc;n suốt từ &Aacute; sang &Acirc;u, từ ch&acirc;u Phi sang ch&acirc;u Mỹ. Mỗi trang s&aacute;ch tổng h&ograve;a đam m&ecirc;, th&iacute;ch th&uacute; v&agrave; khao kh&aacute;t được tương t&aacute;c, kh&aacute;m ph&aacute; những miền đất mới.</p>\r\n\r\n<p>Với g&oacute;c nh&igrave;n s&acirc;u sắc về lịch sử, văn ho&aacute;, x&atilde; hội của người nhiều năm sống nước ngo&agrave;i, cuốn s&aacute;ch l&agrave; tấm bản đồ định vị để người trẻ ho&agrave; m&igrave;nh v&agrave;o d&ograve;ng chảy c&ocirc;ng d&acirc;n to&agrave;n cầu. Ngo&agrave;i ra s&aacute;ch c&ograve;n cung cấp nhiều kiến thức về kinh tế được lồng gh&eacute;p kh&eacute;o l&eacute;o qua từng c&acirc;u chuyện, kh&aacute; hữu &iacute;ch cho độc giả muốn t&igrave;m hiểu về những đất nước xa lạ m&agrave; chưa c&oacute; may mắn được đặt ch&acirc;n đến.</p>\r\n\r\n<p>C&aacute;c tiểu tiết nho nhỏ th&uacute; vị, độc đ&aacute;o của từng quốc gia cũng được con mắt tinh tế của Phạm Thị V&acirc;n &ldquo;xới tung&rdquo; v&agrave; b&agrave;y ra trước mặt độc giả: như việc sơn m&oacute;ng kiểu UAE vừa thỏa m&atilde;n đam m&ecirc; đẹp của chị em phụ nữ vừa l&aacute;ch được giới luật khắt khe của đất nước Hồi gi&aacute;o, hay sự t&ocirc;n s&ugrave;ng đến cuồng t&iacute;n của người d&acirc;n một l&agrave;ng nhỏ tại &Yacute; đối với ẩm thực qu&ecirc; hương qua c&acirc;u chuyện một củ tỏi hay chỉ l&agrave; những quả ớt tươi, gia vị kh&ocirc;ng thể thiếu trong c&aacute;c m&oacute;n ăn của Indonesia cũng cho người đọc biết được cơ sở hạ tầng qu&aacute; tải tại đất nước n&agrave;y đ&atilde; ảnh hưởng đến kinh tế như thế n&agrave;o.</p>\r\n\r\n<p>Những mẩu chuyện được th&ecirc;m v&agrave;o khiến độc giả trầm trồ v&igrave; ngạc nhi&ecirc;n, th&iacute;ch th&uacute; nhưng cũng gợi n&ecirc;n nhiều suy ngẫm như một nốt lặng sau một cuộc h&agrave;nh tr&igrave;nh đầy s&ocirc;i nổi. V&agrave; &ldquo;Quẳng g&aacute;nh băng đồng ra thế giới&rdquo; kh&ocirc;ng chỉ giới hạn th&ocirc;ng tin cho những ai muốn du lịch kh&aacute;m ph&aacute;, th&ocirc;ng điệp n&oacute; mang lại c&ograve;n chứa đựng nhiều b&agrave;i học hơn thế.</p>\r\n	Nguyễn Phi Vân	2019-04-06 15:01:41.831618	2019-09-27 12:17:35.168151	1	1	1_210514.jpg	image/jpeg	164036	2019-04-06 15:01:41.30051	image/upload/v1554625425/xbvgjsbjf2yi6v8bd41n.jpg
2	Cô giáo thảo	<p>T&ocirc;i l&agrave; một thanh ni&ecirc;n 17 tuổi đang theo học trung học tại S&agrave;i G&ograve;n.Tuy mới 17 tuổi nhưng th&acirc;n thể t&ocirc;i tr&ocirc;ng khỏe như 1 ch&agrave;ng trai 20, lứa tuổi m&agrave; c&aacute;c ch&agrave;ng trai bắt đầu t&ograve; m&ograve; về t&igrave;nh y&ecirc;u v&agrave; bị k&iacute;ch th&iacute;ch về dục t&iacute;nh v&agrave; thường xuy&ecirc;n xem phim sex v&agrave; đi t&igrave;m g&aacute;i gọi h&agrave; nội để thoải m&atilde;n.</p>\r\n\r\n<p>Tuy to con nhưng t&iacute;nh t&igrave;nh t&ocirc;i rất nh&uacute;t nh&aacute;t khi tiếp x&uacute;c gặp gỡ với ph&aacute;i nử nhưng ngược lại bản t&iacute;nh t&ocirc;i rất ham muốn &amp; th&iacute;ch th&uacute; khi ngắm nh&igrave;n những th&acirc;n thể nẩy nở &amp; căng đầy sức sống với cặp nhủ hoa tr&ograve;n trịa như c&aacute;c tr&aacute;i t&aacute;o của c&aacute;c c&ocirc; g&aacute;i dậy th&igrave;, những buổi tan học về đi ngang c&aacute;c trường nữ sinh nh&igrave;n những c&ocirc; g&aacute;i bận mini jupe ngắn ngủn để lộ cặp đ&ugrave;i trắng như b&ocirc;ng bưởi &amp; gi&oacute; thổi bay bay t&agrave; &aacute;o l&agrave;m phơi b&agrave;y trước mắt t&ocirc;i những đường cong tuyệt mỹ, những đ&ocirc;i mắt đen huyền, nụ cười trẻ trung tươi m&aacute;t, th&acirc;n h&igrave;nh cao r&aacute;o c&acirc;n đối tr&ocirc;ng rất gợi cảm &amp; hấp dẫn đ&atilde; l&agrave;m t&ocirc;i đỏ mặt bừng l&ecirc;n, tim đập mạnh &amp; l&ograve;ng t&ocirc;i sục s&ocirc;i l&ecirc;n của sự dục t&iacute;nh, t&ocirc;i muốn chồm tới để ăn tươi nuốt sống những tấm th&acirc;n ngọc ng&agrave; &amp; liếm hết những phấn son tr&ecirc;n tr&ecirc;n khu&ocirc;n mặt y&ecirc;u kiều t&igrave;nh tứ của họ ...</p>\r\n	Unknown	2019-04-06 11:04:53.927154	2019-10-13 05:08:02.814747	1	5	math-book-2.jpg	image/jpeg	67349	2019-04-06 14:55:06.953959	image/upload/v1554625614/wj6h9fkc5a54cpkv2dzw.jpg
24	How the Economy Works: Confidence, Crashes and Self-Fulfilling Prophecies	<p>&quot;Of all the <em><strong>economic bubbles</strong></em> that have been pricked,&quot; the editors of&nbsp;<em>The Economist&nbsp;</em>recently observed, &quot;few have burst more spectacularly than the reputation of economics itself.&quot; Indeed, the financial crisis that crested in 2008 destroyed the credibility of the economic thinking that had guided policymakers for a generation. But what will take its place?</p>\r\n\r\n<p><img alt="7272274" src="https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348763742l/7272274.jpg" /></p>\r\n\r\n<p><br />\r\nIn&nbsp;<em>How the Economy Works</em>, one of our leading economists provides a jargon-free exploration of the current crisis, offering a powerful argument for how economics must change to get us out of it. Roger E. A. Farmer traces the swings between classical and Keynesian economics since the early twentieth century, gracefully explaining the elements of both theories. During the Great Depression, Keynes challenged the longstanding idea that an economy was a self-correcting mechanism; but his school gave way to a resurgence of classical economics in the 1970s-a rise that ended with the current crisis. Rather than simply allowing the pendulum to swing back, Farmer writes, we must synthesize the two. From classical economics, he takes the idea that a sound theory must explain how individuals behave-how our collective choices shape the economy. From Keynesian economics, he adopts the principle that markets do not always work well, that capitalism needs some guidance. The goal, he writes, is to correct the excesses of a free-market economy without stifling entrepreneurship and instituting central planning.<br />\r\n<br />\r\nRecent events have shown that we cannot afford to treat economics as an ivory-tower abstraction. It has a direct impact on our lives by guiding regulators and policymakers as they make decisions with far-reaching practical consequences. Written in clear, accessible language,&nbsp;<em>How the Economy Works</em>&nbsp;makes an argument that no one should ignore.</p>\r\n	Roger E.A. Farmer	2020-02-22 11:33:11.849036	2020-02-28 02:40:02.396801	1	2	\N	\N	\N	\N	image/upload/v1582786410/u6xsbwkp9f8qghxhxjcc.jpg
6	Game Theory	<p>&quot;Both broad and deep, this book belongs on the shelf of every serious student of game theory.&quot; -- David Kreps, Graduate School of Business, Stanford University &quot;Fudenberg and Tirole&#39;s text will have an immediate and important impact on the way game theory is taught at the graduate level.</p>\r\n\r\n<p>Not only does it cover most of the central topics in noncooperative game theory, it is as up-to-date and complete as a book in this area could hope to be.&quot; -- Charles Wilson, Professor of Economics, New York University This text introduces the principles of noncooperative game theory -- including strategic form games.</p>\r\n\r\n<p>Nash equilibria, extensive-form games, subgame perfection, repeated games, and games of incomplete information -- in a direct and uncomplicated style that will acquaint students with the broad spectrum of the field while highlighting and explaining what they need to know at any given point.</p>\r\n\r\n<p>The analytic material is accompanied by many applications, examples, and exercises. Although game theory has been applied to many fields, Fudenberg and Tirole focus on the kinds of game theory that have been most useful in the study of economic problems.</p>\r\n\r\n<p>They also include some applications to political science. &quot;Game Theory&quot; can be used for a first or second course. It presents subgame perfection and Bayesian games with a minimum of detail with technical subtleties included in the advanced sections and uses markers to indicate the suitability of various sections to different audiences.</p>\r\n\r\n<p>The book is divided into five parts: static games of complete information, dynamic games of complete information, static games of incompleteinformation, dynamic games of incomplete information, and advanced topics.</p>\r\n	Drew Fudenberg,  Jean Tirole	2019-04-07 08:28:21.001902	2019-09-27 12:25:41.704341	1	6	\N	\N	\N	\N	image/upload/v1554625766/s6fuijcvv4fzkpirtloi.jpg
10	The Clockmaker's Daughter	<p>Prepare to lose yourself in the enchanting new novel from Kate Morton. &#39;My father called me Birdie; he said I was his little bird. Others knew me as his child, the clockmaker&#39;s daughter. Edward called me his muse, his destiny. I am remembered as a thief, an imposter, a girl who rose above her station, who was not chaste.</p>\r\n\r\n<p>My real name, no one remembers. The truth about that summer, no one else knows.&#39; In the summer of 1862, a group of young artists led by the passionate and talented Edward Radcliffe descends upon Birchwood Manor in rural Oxfordshire.</p>\r\n\r\n<p>Their plan: to spend a secluded summer month in a haze of inspiration and creativity. But by the time their stay is over, one woman has been shot dead while another has disappeared; a priceless heirloom is missing; and Edward Radcliffe&#39;s life is in ruins.</p>\r\n\r\n<p>Over 150 years later, Elodie Winslow, a young archivist in London, uncovers a leather satchel containing two seemingly unrelated items: a sepia photograph of an arresting-looking woman in Victorian clothing, and an artist&#39;s sketchbook containing the drawing of a twin-gabled house on the bend of a river.</p>\r\n\r\n<p>Why does Birchwood Manor feel so familiar to Elodie? And who is the beautiful woman in the photograph? Will she ever give up her secrets? Told by multiple voices across time, The Clockmaker&#39;s Daughter is a story of murder, mystery and thievery, of art, love and loss.</p>\r\n\r\n<p>And flowing through it like a river is the voice of a woman who stands outside time, whose name has been forgotten by history but who has watched it all unfold: Birdie Bell, the clockmaker&#39;s daughter.</p>\r\n	Kate Morton	2019-04-07 10:01:12.940858	2019-09-30 08:49:49.628022	1	7	\N	\N	\N	\N	image/upload/v1554631272/h5uy8zs8w5aid6yzr07b.jpg
12	Renegades: Expeditionary Force, Book 7	<p><strong>The battle-scarred </strong>star carrier Flying Dutchman is finally on her way back to Earth, after an exceptionally successful series of missions that have once again saved the world.</p>\r\n\r\n<p>The ship needs a serious refit, and her exhausted crew just wants a break from constant clandestine warfare against a vicious and superior enemy. Wishes come true, right? Not for the Merry Band of Pirates.</p>\r\n	Craig Alanson	2019-04-07 10:03:04.628928	2019-10-02 07:19:40.954069	1	7	\N	\N	\N	\N	image/upload/v1554631384/rxvr6uhtakgpmkl7hovh.jpg
13	Nudge: Improving Decisions About Health, Wealth, and Happiness	<p>From the winner of the 2017 Nobel Prize in Economics, Richard H. Thaler, and Cass R. Sunstein: a revelatory look at how we make decisions New York Times bestseller Named a Best Book of the Year by The Economist and the Financial Times Every day we make choices&mdash;about what to buy or eat, about financial investments or our children&rsquo;s health and education, even about the causes we champion or the planet itself. Unfortunately, we often choose poorly.</p>\r\n\r\n<p>Nudge is about how we make these choices and how we can make better ones. Using dozens of eye-opening examples and drawing on decades of behavioral science research, Nobel Prize winner Richard H. Thaler and Harvard Law School professor Cass R. Sunstein show that no choice is ever presented to us in a neutral way, and that we are all susceptible to biases that can lead us to make bad decisions.</p>\r\n\r\n<p>But by knowing how people think, we can use sensible &ldquo;choice architecture&rdquo; to nudge people toward the best decisions for ourselves, our families, and our society, without restricting our freedom of choice.</p>\r\n	Richard H. Thaler	2019-04-12 11:06:59.284847	2019-09-28 01:48:19.902199	1	6	\N	\N	\N	\N	image/upload/v1555067219/ukxgpnxfbu5y22aa1p5z.jpg
14	Superforecasting	<p>The most important book on decision making since Daniel Kahneman&#39;s Thinking, Fast and Slow.&quot; - Jason Zweig, The Wall Street Journal Everyone would benefit from seeing further into the future, whether buying stocks, crafting policy, launching a new product, or simply planning the week&rsquo;s meals. Unfortunately, people tend to be terrible forecasters.</p>\r\n\r\n<p>As Wharton professor Philip Tetlock showed in a landmark 2005 study, even experts&rsquo; predictions are only slightly better than chance. However, an important and underreported conclusion of that study was that some experts do have real foresight, and Tetlock has spent the past decade trying to figure out why. What makes some people so good? And can this talent be taught? In Superforecasting, Tetlock and coauthor Dan Gardner offer a masterwork on prediction, drawing on decades of research and the results of a massive, government-funded forecasting tournament.</p>\r\n\r\n<p>The Good Judgment Project involves tens of thousands of ordinary people&mdash;including a Brooklyn filmmaker, a retired pipe installer, and a former ballroom dancer&mdash;who set out to forecast global events. Some of the volunteers have turned out to be astonishingly good.</p>\r\n\r\n<p>They&rsquo;ve beaten other benchmarks, competitors, and prediction markets. They&rsquo;ve even beaten the collective judgment of intelligence analysts with access to classified information. They are &quot;superforecasters.&quot; In this groundbreaking and accessible book, Tetlock and Gardner show us how we can learn from this elite group. Weaving together stories of forecasting successes (the raid on Osama bin Laden&rsquo;s compound) and failures (the Bay of Pigs) and interviews with a range of high-level decision makers, from David Petraeus to Robert Rubin, they show that good forecasting doesn&rsquo;t require powerful computers or arcane methods.</p>\r\n\r\n<p>It involves gathering evidence from a variety of sources, thinking probabilistically, working in teams, keeping score, and being willing to admit error and change course.</p>\r\n\r\n<p>Superforecasting offers the first demonstrably effective way to improve our ability to predict the future&mdash;whether in business, finance, politics, international affairs, or daily life&mdash;and is destined to become a modern classic.</p>\r\n	Philip E. Tetlock, Dan Gardner	2019-04-30 12:14:30.976033	2019-09-30 08:48:15.930197	1	2	\N	\N	\N	\N	image/upload/v1556626471/ylrmvb3unthy6xw1fplr.jpg
17	Agile Web Development with Rails 5	<p>&quot;<strong>Rails 5 and Ruby 2.2 </strong>bring many improvements, including new APIs and substantial performance enhancements. Learn Rails the way the Rails core team recommends it, along with the tens of thousands of developers who have read this award-winning classic.</p>\r\n\r\n<p><img alt="" src="https://imagery.pragprog.com/products/457/rails5_xlargecover.jpg?1461337189" style="height:228px; width:190px" /></p>\r\n\r\n<p>Start with a step-by-step walkthrough of building a web-based store application and finish with in-depth chapters that cover key Rails features. Eliminate tedious configuration and housekeeping; internationalize your appplications; incorporate Ajas, REST, web serives, and e-mail handling; test your applications as you write them using the built-in testing frameworks; and deploy easily and securely.</p>\r\n\r\n<p>New in this edition is coverage of Action Cable, and completely updated code for Rails 5. If you&#39;re new to Rails, you&#39;ll get step-by-step guidance. If you&#39;re an experienced developer, this book will give you the comprehensive</p>\r\n	David Heinemeier Hansson, Dave Thomas, Sam Ruby	2019-09-24 03:12:45.039159	2019-10-02 07:20:02.886302	1	10	\N	\N	\N	\N	image/upload/v1569294765/odautmayoejoypur9bq3.jpg
9	The Murderer's Son: A Jackman and Evans Thriller	<p><strong>Crimebusting duo DI Jackman</strong> and <strong>DS Evans</strong> are back, solving another crime that will make your skin crawl. Twenty years ago: a farmer and his wife are cut to pieces by a ruthless serial killer.</p>\r\n\r\n<p>Now: a woman is viciously stabbed to death in the upmarket kitchen of her beautiful house on the edge of the marshes. Then a man called Daniel Kinder walks into Saltern police station and confesses to the murder. But DI Rowan Jackman and DS Marie Evans of the Fenland Constabulary soon discover that there is a lot more to Daniel than meets the eye.</p>\r\n\r\n<p>He has no memory of the first five years of his life and has a rather unusual obsession with his mother.... Full of twists and turns, this is a crime thriller that will keep you gripped until the shocking ending.</p>\r\n	Joy Ellis	2019-04-07 10:00:10.917507	2019-11-06 10:08:11.995567	1	7	\N	\N	\N	\N	image/upload/v1554631233/pdun7yvwba45am6zx9ml.jpg
21	Economics 101: From Consumer Behavior to Competitive Markets--Everything You Need to Know About Economics (Adams 101)	<p>A Crash Course in the Study of Production and Consumption!</p>\r\n\r\n<p><img alt="" src="https://images-na.ssl-images-amazon.com/images/I/51bAazRkTJL._SX366_BO1,204,203,200_.jpg" style="height:499px; width:368px" /></p>\r\n\r\n<p><br />\r\nToo often, textbooks turn the noteworthy details of economics into tedious discourse that would put even Joseph Stiglitz to sleep.&nbsp;<strong><em>Economics 101</em>&nbsp;</strong>cuts out the boring explanations, and instead provides a hands-on lesson that keeps you engaged as you explore how societies allocate their resources for maximum benefit.<br />\r\n<br />\r\nFrom quantitative easing to marginal utility, this primer is packed with hundreds of entertaining tidbits and concepts that you won&#39;t be able to get anywhere else.<br />\r\n<br />\r\nSo whether you&#39;re looking to master the major principles of finance, or just want to learn more about why money matters,&nbsp;<em>Economics 101</em>&nbsp;has all the answers--even the ones you didn&#39;t know you were looking for.</p>\r\n	Alfred Mill	2019-09-30 08:55:01.390658	2020-02-27 02:38:10.611975	1	2	\N	\N	\N	\N	image/upload/v1582771096/uvmrlndkyvmriwrf4tg5.jpg
23	FAKE: Fake Money, Fake Teachers, Fake Assets: How Lies Are Making the Poor and Middle Class Poorer	<p><strong>Robert Kiyosaki</strong> ― author of the #1 Personal Finance book of all time ― has built a legacy around simplifying complex and often-confusing subjects like money and investing. He continues to challenge conventional wisdom and asks the questions that will help readers sift through today&#39;s information overload to uncover ways to assess what&#39;s real&hellip; and what isn&#39;t. And use truth and facts as a foundation for taking control of their financial lives.<br />\r\n<br />\r\nIn this new book―that will be released, by chapter, online to invite reader feedback and questions that will be included in the print and e-book editions―Robert fights what&rsquo;s &lsquo;fake&rsquo; and helps readers differentiate between what&rsquo;s real&hellip;and what isn&rsquo;t.<br />\r\n<br />\r\nRobert pulls no punches in his assessment of what is passed off as &lsquo;fact&rsquo; or conventional wisdom and believes that a strong foundation―for anything we want to build―needs to start with solid, true information. In today&rsquo;s uncertain times, creating a secure financial future and the peace of mind that comes with it starts with taking action and taking control.<br />\r\n<br />\r\nIn FAKE: <strong>Fake Money, Fake Teachers, Fake Assets</strong>, Robert delivers insights and answers that help ordinary people―who probably haven&rsquo;t had a lot of financial education―determine what&rsquo;s &lsquo;real&rsquo; and relevant to their financial lives.</p>\r\n\r\n<p><br />\r\n<img src="https://images-na.ssl-images-amazon.com/images/I/41PPARPFqNL._SX331_BO1,204,203,200_.jpg" /></p>\r\n\r\n<p>Every day we are bombarded with news reports and information and opinions&hellip;<br />\r\nHow do we decipher fact from fiction? How do we differentiate between truth and lies? And determine what&rsquo;s real&hellip; from what isn&rsquo;t? Kiyosaki believes that it starts with education, financial education designed to make us smarter with our money―and able to fight what&rsquo;s fake and use what isn&rsquo;t to secure our financial future.</p>\r\n\r\n<p>amazon:&nbsp;<a href="https://www.amazon.com/gp/product/1612680844">https://www.amazon.com/gp/product/1612680844</a></p>\r\n	Robert T. Kiyosaki	2019-12-01 10:44:36.519028	2019-12-01 10:45:43.763426	1	2	\N	\N	\N	\N	\N
11	A Game of Thrones: A Song of Ice and Fire, Book 1	<p>Now the acclaimed HBO series <strong>Game of Thrones</strong> - the masterpiece that became a cultural phenomenon Winter is coming. Such is the stern motto of House Stark, the northernmost of the fiefdoms that owe allegiance to King Robert Baratheon in far-off King&#39;s Landing.</p>\r\n\r\n<p><img alt="Related image" src="https://i.pinimg.com/originals/4e/f7/17/4ef717960eda450be27c3961f7bbc15b.jpg" style="float:left; height:366px; width:650px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n\r\n<p>There Eddard Stark of Winterfell rules in Robert&#39;s name. There his family dwells in peace and comfort: his proud wife, Catelyn; his sons Robb, Brandon, and Rickon; his daughters Sansa and Arya; and his bastard son, Jon Snow.</p>\r\n\r\n<p>Far to the north, behind the towering Wall, lie savage Wildings and worse - unnatural things relegated to myth during the centuries-long summer, but proving all too real and all too deadly in the turning of the season. Yet a more immediate threat lurks to the south, where Jon Arryn, the Hand of the King, has died under mysterious circumstances.</p>\r\n\r\n<p>Now Robert is riding north to Winterfell, bringing his queen, the lovely but cold Cersei, his son, the cruel, vainglorious Prince Joffrey, and the queen&#39;s brothers Jaime and Tyrion of the powerful and wealthy House Lannister - the first a swordsman without equal, the second a dwarf whose stunted stature belies a brilliant mind.</p>\r\n\r\n<p>All are heading for Winterfell and a fateful encounter that will change the course of kingdoms. Meanwhile, across the Narrow Sea, Prince Viserys, heir of the fallen House Targaryen, which once ruled all of Westeros, schemes to reclaim the throne with an army of barbarian Dothraki - whose loyalty he will purchase in the only coin left to him: his beautiful yet innocent sister, Daenerys</p>\r\n	George R. R. Martin	2019-04-07 10:02:00.181222	2019-11-06 10:05:46.82682	1	7	\N	\N	\N	\N	image/upload/v1554631320/xlsl4qvclle2erbtsixz.jpg
3	The Rise and Fall of the Dinosaurs: A New History of a Lost World	<p>The dinosaurs. Sixty-six million years ago, the Earth&rsquo;s most fearsome creatures vanished. Today they remain one of our planet&rsquo;s great mysteries. Now The Rise and Fall of the Dinosaurs reveals their extraordinary, 200-million-year-long story as never before. In this captivating narrative (enlivened with more than seventy original illustrations and photographs).</p>\r\n\r\n<p>Steve Brusatte, a young American paleontologist who has emerged as one of the foremost stars of the field&mdash;naming fifteen new species and leading groundbreaking scientific studies and fieldwork&mdash;masterfully tells the complete, surprising, and new history of the dinosaurs, drawing on cutting-edge science to dramatically bring to life their lost world and illuminate their enigmatic origins, spectacular flourishing, astonishing diversity, cataclysmic extinction, and startling living legacy.</p>\r\n\r\n<p>Captivating and revelatory, The Rise and Fall of the Dinosaurs is a book for the ages. Brusatte traces the evolution of dinosaurs from their inauspicious start as small shadow dwellers&mdash;themselves the beneficiaries of a mass extinction caused by volcanic eruptions at the beginning of the Triassic period&mdash;into the dominant array of species every wide-eyed child memorizes today, T. rex,</p>\r\n\r\n<p>Triceratops, Brontosaurus, and more. This gifted scientist and writer re-creates the dinosaurs&rsquo; peak during the Jurassic and Cretaceous, when thousands of species thrived, and winged and feathered dinosaurs, the prehistoric ancestors of modern birds, emerged. The story continues to the end of the Cretaceous period, when a giant asteroid or comet struck the planet and nearly every dinosaur species (but not all) died out, in the most extraordinary extinction event in earth&rsquo;s history, one full of lessons for today as we confront a &ldquo;sixth extinction.&rdquo;</p>\r\n\r\n<p>Brusatte also recalls compelling stories from his globe-trotting expeditions during one of the most exciting eras in dinosaur research&mdash;which he calls &ldquo;a new golden age of discovery&rdquo;&mdash;and offers thrilling accounts of some of the remarkable findings he and his colleagues have made, including primitive human-sized tyrannosaurs; monstrous carnivores even larger than T. rex; and paradigm-shifting feathered raptors from China.</p>\r\n\r\n<p>An electrifying scientific history that unearths the dinosaurs&rsquo; epic saga, The Rise and Fall of the Dinosaurs will be a definitive and treasured account for decades to come.</p>\r\n	Stephen Brusatte	2019-04-06 11:07:51.600711	2019-11-06 10:07:49.571519	1	3	35820369.jpg	image/jpeg	27067	2019-04-06 14:54:53.984981	image/upload/v1554625530/tdldqgshsocucledu1va.jpg
16	Permanent Record	<p><strong>Edward Snowden</strong>, the man who risked everything to expose the US government&rsquo;s system of mass surveillance, reveals for the first time the story of his life, including how he helped to build that system and what motivated him to try to bring it down. In 2013, twenty-nine-year-old Edward Snowden shocked the world when he broke with the American intelligence establishment and revealed that the United States government was secretly pursuing the means to collect every single phone call, text message, and email.</p>\r\n\r\n<p><img alt="Image result for edward snowden" src="https://images-na.ssl-images-amazon.com/images/I/51m35ZFsIQL.jpg" /></p>\r\n\r\n<p>The result would be an unprecedented system of mass surveillance with the ability to pry into the private lives of every person on earth. Six years later, Snowden reveals for the very first time how he helped to build this system and why he was moved to expose it.</p>\r\n\r\n<p>Spanning the bucolic Beltway suburbs of his childhood and the clandestine CIA and NSA postings of his adulthood, Permanent Record is the extraordinary account of a bright young man who grew up online&mdash;a man who became a spy, a whistleblower, and, in exile, the Internet&rsquo;s conscience. Written with wit, grace, passion, and an unflinching candor, Permanent Record is a crucial memoir of our digital age and destined to be a classic.</p>\r\n	Edward Snowden	2019-09-19 08:11:50.201513	2020-02-27 06:51:04.406094	1	3	\N	\N	\N	\N	image/upload/v1582786272/yvowsjcmfs2xabpldnja.jpg
25	Sourdough: A Beginner's Guide For Vegans (Vegan In The Wilderness Book 1)	<p>Everyone says that sourdough is too hard to figure out. No way, not with this quick, easy-to-read book. Iris Blume turns complex cooking techniques into simple steps with her new series:&nbsp;Vegan In The Wilderness Mini-Series. You don&rsquo;t even have to be vegan to learn how to make healthy, home-cooked essentials.</p>\r\n\r\n<p>Say goodbye to pre-packaged bread&nbsp;with unpronounceable ingredients. You can make your favorite foods. By following simple directions and deconstructing two basic recipes, you can create your own sourdough recipes featuring the ingredients that your family loves. You don&rsquo;t have to be a celebrity chef in a fancy kitchen.</p>\r\n\r\n<p>Once you complete the two recipes in Sourdough, A Beginner&rsquo;s Guide for Vegans, you can use the skills to either create your own recipes or use other complicated recipes with confidence.</p>\r\n\r\n<p><strong>What others are saying:</strong><br />\r\n<em>&ldquo;Short and sweet, easy to follow instructions.&rdquo;</em></p>\r\n\r\n<p><em>&ldquo;No hard-to-find ingredients, No odd tools.&rdquo;</em></p>\r\n\r\n<p><em>&ldquo;Excellent flavor!&rdquo;</em></p>\r\n\r\n<p><em>&ldquo;Long Overdue.&rdquo;</em></p>\r\n\r\n<p><em>Sourdough, A Beginner&rsquo;s Guide</em>&nbsp;is for the absolute beginner. The bread recipe is basic and uses only sourdough, flour, water, salt, and a pinch of sugar. That is it! Then take the recipe to new heights with variations that your family will love.</p>\r\n\r\n<p>Complex recipes overlook essential directions when using sourdough. This short guide bridges the gap. Keep it handy or take the basic recipes and variations to a new level. Two great recipes for pancakes and bread plus ideas for variations make this a guide that earns its place in the kitchen.</p>\r\n\r\n<p><strong>Pick up your copy today!</strong></p>\r\n\r\n<p><strong>Coming soon!&nbsp; Vegan in the Wilderness Mini-Series next book:</strong></p>\r\n\r\n<p><strong><em>Tofu From Scratch, A Beginner&rsquo;s Guide For Vegans</em></strong></p>\r\n	Iris Blume	2020-02-28 03:37:06.237712	2020-02-28 03:37:06.237712	1	12	\N	\N	\N	\N	image/upload/v1582861029/loxymfclmfmvyr5fsymr.jpg
26	Say Nothing: A True Story of Murder and Memory in Northern Ireland	<p><strong><strong><em>NEW YORK TIMES</em>&nbsp;BESTSELLER<br />\r\n<br />\r\n&quot;A masterful history of the Troubles. . . Extraordinary. . .As in the most ingenious crime stories, Keefe unveils a revelation &mdash; lying, so to speak, in plain sight.&quot;<strong><strong><strong>&mdash;</strong></strong></strong>Maureen Corrigan, NPR<br />\r\n<br />\r\nFrom award-winning&nbsp;</strong><strong><em>New Yorker&nbsp;</em></strong><strong>staff writer Patrick Radden Keefe, a stunning, intricate narrative about a notorious killing in Northern Ireland and its devastating repercussions</strong></strong><br />\r\n<br />\r\nIn December 1972, Jean McConville, a thirty-eight-year-old mother of ten, was dragged from her Belfast home by masked intruders, her children clinging to her legs. They never saw her again. Her abduction was one of the most notorious episodes of the vicious conflict known as The Troubles. Everyone in the neighborhood knew the I.R.A. was responsible. But in a climate of fear and paranoia, no one would speak of it. In 2003, five years after an accord brought an uneasy peace to Northern Ireland, a set of human bones was discovered on a beach. McConville&#39;s children knew it was their mother when they were told a blue safety pin was attached to the dress--with so many kids, she had always kept it handy for diapers or ripped clothes.<br />\r\n<br />\r\nPatrick Radden Keefe&#39;s mesmerizing book on the bitter conflict in Northern Ireland and its aftermath uses the McConville case as a starting point for the tale of a society wracked by a violent guerrilla war, a war whose consequences have never been reckoned with. The brutal violence seared not only people like the McConville children, but also I.R.A. members embittered by a peace that fell far short of the goal of a united Ireland, and left them wondering whether the killings they committed were not justified acts of war, but simple murders. From radical and impetuous I.R.A. terrorists such as Dolours Price, who, when she was barely out of her teens, was already planting bombs in London and targeting informers for execution, to the ferocious I.R.A. mastermind known as The Dark, to the spy games and dirty schemes of the British Army, to Gerry Adams, who negotiated the peace but betrayed his hardcore comrades by denying his I.R.A. past--<em>Say Nothing</em>&nbsp;conjures a world of passion, betrayal, vengeance, and anguish.</p>\r\n	Patrick Radden Keefe	2020-02-28 03:39:50.265777	2020-02-28 03:39:50.265777	1	13	\N	\N	\N	\N	image/upload/v1582861192/lcxelhj3pyxuyjmgiwpp.jpg
27	The Last Wish: Introducing the Witcher	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>Geralt the Witcher -- revered and hated -- holds the line against the monsters plaguing humanity in this collection of adventures in the&nbsp;<em>NYT&nbsp;</em>bestselling series that inspired the blockbuster video games.</strong><br />\r\nGeralt is a Witcher, a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent.<br />\r\nBut not everything monstrous-looking is evil and not everything fair is good...and in every fairy tale there is a grain of truth.<br />\r\n<strong>Andrzej Sapkowski, winner of the World Fantasy Lifetime Achievement award, started an international phenomenon with his Witcher series.&nbsp;<em>The Last Wish&nbsp;</em>short story collection is the perfect introduction to this one of a kind fantasy world.</strong><br />\r\n<br />\r\n<strong>Witcher collections</strong><em>The Last Wish</em><em>Sword of Destiny</em><br />\r\n<strong>Witcher novels</strong><em>Blood of Elves<br />\r\nThe Time of Contempt<br />\r\nBaptism of Fire&nbsp;</em><em>The Tower of Swallows</em><em>Lady of the Lake</em><em>Season of Storms</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler (</em>e-only)<br />\r\n<br />\r\nTranslated from original Polish by Danusia Stok</p>\r\n	Andrzej Sapkowski	2020-02-28 03:42:34.142763	2020-02-28 03:42:34.142763	1	14	\N	\N	\N	\N	image/upload/v1582861355/bxukfh40qltsv9evuc8e.jpg
28	Blood of Elves (The Witcher)	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>The Witcher, Geralt of Rivia, becomes the guardian of Ciri, surviving heiress of a bloody revolution and prophesied savior of the world, in the first novel of the&nbsp;<em>New York Times</em>&nbsp;bestselling series that inspired the Netflix series and the blockbuster video games.</strong><br />\r\nFor over a century, humans, dwarves, gnomes, and elves have lived together in relative peace. But times have changed, the uneasy peace is over, and now the races are fighting once again. The only good elf, it seems, is a dead elf.<br />\r\nGeralt of Rivia, the cunning assassin known as the Witcher, has been waiting for the birth of a prophesied child. This child has the power to change the world -- for good, or for evil.<br />\r\nAs the threat of war hangs over the land and the child is hunted for her extraordinary powers, it will become Geralt&#39;s responsibility to protect them all. And the Witcher never accepts defeat.<br />\r\n<u>Witcher novels</u>&nbsp;<em>Blood of Elves</em>&nbsp;<em>The Time of Contempt</em>&nbsp;<em>Baptism of Fire</em>&nbsp;<em>The Tower of Swallows</em>&nbsp;<em>Lady of the Lake</em>&nbsp;<em>Season of Storms</em><br />\r\n<u>Witcher collections</u>&nbsp;<em>The Last Wish</em>&nbsp;<em>Sword of Destiny</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler</em>&nbsp;(e-only)<br />\r\nTranslated from original Polish by Danusia Stok.</p>\r\n	Andrzej Sapkowski	2020-02-28 03:43:44.583765	2020-02-28 03:43:44.583765	1	14	\N	\N	\N	\N	image/upload/v1582861426/sokmyy42ph45cswq21qs.jpg
29	Baptism of Fire (The Witcher)	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>A deadly coup within the Wizard&#39;s Guild leaves the Witcher, Geralt of Rivia, gravely injured, and his ward Ciri missing in the third book of the&nbsp;<em>NYT</em>&nbsp;bestselling series that inspired the blockbuster video games.</strong><br />\r\nThe Wizards Guild has been shattered by a coup and, in the uproar, Geralt was seriously injured. The Witcher is supposed to be a guardian of the innocent, a protector of those in need, a defender against powerful and dangerous monsters that prey on men in dark times.<br />\r\nBut now that dark times have fallen upon the world, Geralt is helpless until he has recovered from his injuries.<br />\r\nWhile war rages across all of the lands, the future of magic is under threat and those sorcerers who survive are determined to protect it. It&#39;s an impossible situation in which to find one girl -- Ciri, the heiress to the throne of Cintra -- until a rumor places her in the Niflgaard court, preparing to marry the Emperor.<br />\r\nInjured or not, Geralt has a rescue mission on his hands.<br />\r\n<strong>Andrzej Sapkowski, winner of the World Fantasy Lifetime Achievement award, started an international phenomenon with his Witcher series:</strong><br />\r\n<strong>Witcher novels</strong><em>Blood of Elves<br />\r\nThe Time of Contempt<br />\r\nBaptism of Fire&nbsp;</em><em>The Tower of Swallows</em><em>Lady of the Lake</em><em>Season of Storms</em><br />\r\n<strong>Witcher collections</strong><em>The Last Wish</em><em>Sword of Destiny</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler</em>&nbsp;(e-only)<br />\r\nTranslated from original Polish by David French</p>\r\n	Andrzej Sapkowski	2020-02-28 03:45:34.692137	2020-02-28 03:45:34.692137	1	14	\N	\N	\N	\N	image/upload/v1582861538/sg3ntbvmt4kq9ykhpif0.jpg
30	The Time of Contempt (The Witcher)	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>To protect his ward, Ciri, Geralt of Rivia sends her away from the home of the Witchers to train with the sorceress Yennefer. But all is not well within the Wizard&#39;s Guild in the second book of the&nbsp;<em>NYT</em>&nbsp;bestselling series that inspired the blockbuster video games.</strong><br />\r\nGeralt is a witcher: guardian of the innocent; protector of those in need; a defender, in dark times, against some of the most frightening creatures of myth and legend. His task, now, is to protect Ciri. A child of prophecy, she will have the power to change the world for good or for ill -- but only if she lives to use it.<br />\r\n<strong>Andrzej Sapkowski, winner of the World Fantasy Lifetime Achievement award, started an international phenomenon with his Witcher series:</strong><br />\r\n<strong>Witcher novels</strong><em>Blood of Elves<br />\r\nThe Time of Contempt<br />\r\nBaptism of Fire&nbsp;</em><em>The Tower of Swallows</em><em>Lady of the Lake</em><em>Season of Storms</em><br />\r\n<strong>Witcher collections</strong><em>The Last Wish</em><em>Sword of Destiny</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler</em>&nbsp;(e-only)<br />\r\nTranslated from original Polish by David French</p>\r\n	Andrzej Sapkowski	2020-02-28 03:45:42.205732	2020-02-28 03:45:54.569272	1	14	\N	\N	\N	\N	image/upload/v1582861556/qrqlisucysrhjpvtqfo5.jpg
31	Sword of Destiny (The Witcher Book 4)	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>Geralt the Witcher -- revered and hated -- holds the line against the monsters plaguing humanity in this second collection of adventures in the&nbsp;<em>NYT</em>&nbsp;bestselling series that inspired the blockbuster video games.</strong><br />\r\nGeralt is a witcher, a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent.<br />\r\n<br />\r\nThis is a collection of short stories, following the adventures of the&nbsp;<em>New York Time</em>s bestseller,&nbsp;<em>The Last Wish.</em>&nbsp;Join Geralt as he battles monsters, demons and prejudices alike...<br />\r\n<strong>Witcher collections</strong><em>The Last Wish</em><em>Sword of Destiny</em><br />\r\n<strong>Witcher novels</strong><em>Blood of Elves<br />\r\nThe Time of Contempt<br />\r\nBaptism of Fire&nbsp;</em><em>The Tower of Swallows</em><em>Lady of the Lake</em><em>Season of Storms</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler</em>&nbsp;(e-only)<br />\r\n<br />\r\nTranslated from original Polish by David French</p>\r\n	Andrzej Sapkowski	2020-02-28 03:47:05.325716	2020-02-28 03:47:05.325716	1	14	\N	\N	\N	\N	image/upload/v1582861627/do39w7af0kosihulzjrz.jpg
32	The Tower of Swallows (The Witcher)	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>The world is at war and the prophesied savior is nowhere to be found. The Witcher, Geralt of Rivia, races to find her -- but time is short, and an army is on his heels in the fourth book of the NYT bestselling series that inspired the blockbuster video games.</strong><br />\r\nThe world has fallen into war. Ciri, the child of prophecy, has vanished. Hunted by friends and foes alike, she has taken on the guise of a petty bandit and lives free for the first time in her life.<br />\r\n<br />\r\nBut the net around her is closing. Geralt, the Witcher, has assembled a group of allies including Dandelion, Milva, Regis, and Cahir, to rescue her. Both sides of the war have sent brutal mercenaries to hunt her down. Her crimes have made her famous.<br />\r\n<br />\r\nThere is only one place left to run. The tower of the swallow is waiting...<br />\r\n<br />\r\n<strong>Andrzej Sapkowski, winner of the World Fantasy Lifetime Achievement award, started an international phenomenon with his Witcher series:</strong><br />\r\n<strong>Witcher novels</strong><em>Blood of Elves<br />\r\nThe Time of Contempt<br />\r\nBaptism of Fire&nbsp;</em><em>The Tower of Swallows</em><em>Lady of the Lake</em><em>Season of Storms</em><br />\r\n<strong>Witcher collections</strong><em>The Last Wish</em><em>Sword of Destiny</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler</em>&nbsp;(e-only)<br />\r\nTranslated from original Polish by David French</p>\r\n	Andrzej Sapkowski	2020-02-28 03:47:48.364032	2020-02-28 03:47:48.364032	1	14	\N	\N	\N	\N	image/upload/v1582861670/ndr05gjrr4edlcysutml.jpg
33	Season of Storms (The Witcher)	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>Before he was the guardian of Ciri, the child of destiny, Geralt of Rivia was a legendary swordsman. Join the Witcher as he undertakes a deadly mission in this stand-alone adventure set in the world that inspired the blockbuster video games.</strong><br />\r\nGeralt of Rivia is a Witcher, one of the few capable of hunting the monsters that prey on humanity. A mutant who is tasked with killing unnatural beings. He uses magical signs, potions, and the pride of every Witcher - two swords, steel and silver.<br />\r\nBut a contract has gone wrong, and Geralt finds himself without his signature weapons. Now he needs them back, because sorcerers are scheming, and across the world clouds are gathering.<br />\r\nThe season of storms is coming...<br />\r\n<br />\r\n<strong>Witcher novels</strong><em>Blood of Elves&nbsp;</em><em>The Time of Contempt</em><em>Baptism of Fire</em><em>The Tower of Swallows</em><em>Lady of the Lake</em><em>Season of Storms</em><br />\r\n<strong>Witcher collections</strong><em>The Last Wish</em><em>Sword of Destiny</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler</em>(e-only)<br />\r\nTranslated from original Polish by David French</p>\r\n	Andrzej Sapkowski	2020-02-28 03:48:47.651716	2020-02-28 03:48:47.651716	1	14	\N	\N	\N	\N	image/upload/v1582861731/i51fz0ofor2i8s1txhfo.jpg
34	The Lady of the Lake (The Witcher Book 5)	<p><strong>Now a Netflix original series!</strong><br />\r\n<strong>Trapped in a world ruled by the Elves, separated from Geralt and her destiny, Ciri will need all her training as a fighter and sorceress to return to her own time in the fifth book of the&nbsp;<em>NYT</em>&nbsp;bestselling series.</strong><br />\r\nAfter walking through the portal in the Tower of Swallows while narrowly escaping death, Ciri finds herself in a completely different world... an Elven world. She is trapped with no way out. Time does not seem to exist and there are no obvious borders or portals to cross back into her home world.<br />\r\n<br />\r\nBut this is Ciri, the child of prophecy, and she will not be defeated. She knows she must escape to finally rejoin the Witcher and his companions - and also to try to conquer her worst nightmare. Leo Bonhart, the man who chased, wounded and tortured Ciri, is still on her trail. And the world is still at war.<br />\r\n<strong>Andrzej Sapkowski, winner of the World Fantasy Lifetime Achievement award, started an international phenomenon with his Witcher series:</strong><br />\r\n<strong>Witcher novels</strong><em>Blood of Elves</em><em>The Time of Contempt</em><em>Baptism of Fire</em><em>The Tower of Swallows</em><em>Lady of the Lake</em><em>Season of Storms</em><br />\r\n<strong>Witcher collections</strong><em>The Last Wish</em><em>Sword of Destiny</em><br />\r\n<em>The Malady and Other Stories: An Andrzej Sapkowski Sampler&nbsp;</em>(e-only)<br />\r\nTranslated from original Polish by David French</p>\r\n	Andrzej Sapkowski	2020-02-28 03:49:18.371279	2020-02-28 03:49:18.371279	1	14	\N	\N	\N	\N	image/upload/v1582861761/hn2ldiqf6wpxpijyhoxp.jpg
35	Thief River Falls	<p><strong>Harrowing loss, psychological trauma, and a deadly mystery test the human will to survive in this electrifying novel from award-winning author Brian Freeman.</strong></p>\r\n\r\n<p>Lisa Power is a tortured ghost of her former self. The author of a bestselling thriller called&nbsp;<em>Thief River Falls</em>, named after her rural Minnesota hometown, Lisa is secluded in her remote house as she struggles with the loss of her entire family: a series of tragedies she calls the &ldquo;Dark Star.&rdquo;</p>\r\n\r\n<p>Then a nameless runaway boy shows up at her door with a terrifying story: he&rsquo;s just escaped death after witnessing a brutal murder&mdash;a crime the police want to cover up. Obsessed with the boy&rsquo;s safety, Lisa resolves to expose this crime, but powerful men in Thief River Falls are desperate to get the boy back, and now they want her too.</p>\r\n\r\n<p>Lisa and her young visitor have nowhere to go as the trap closes around them. Still under the strange, unforgiving threat of the Dark Star, Lisa must find a way to save them both, or they&rsquo;ll become the victims of another shocking tragedy she can&rsquo;t foresee.</p>\r\n	Brian Freeman	2020-02-28 03:51:10.305236	2020-02-28 03:51:19.134481	1	15	\N	\N	\N	\N	image/upload/v1582861873/fksalor7idsfdikujlxz.jpg
36	The Giver	<p>Twelve-year-old Jonas lives in a seemingly ideal world. Not until he is given his life assignment as the Receiver does he begin to understand the dark secrets behind this fragile community.</p>\r\n	Lois Lowry	2020-02-28 03:53:38.523955	2020-02-28 03:53:38.523955	1	6	\N	\N	\N	\N	image/upload/v1582862022/hbh4mizoq3lwjxo7x9hp.jpg
22	The Art of Scalability: Scalable Web Architecture, Processes, and Organizations for the Modern Enterprise(2nd Edition)	<p><strong>A Comprehensive, Proven Approach to IT Scalability from Two Veteran Software, Technology, and Business Executives</strong><br />\r\n<br />\r\n&nbsp;<img alt="" src="https://images-na.ssl-images-amazon.com/images/I/51TU%2BztIcbL._SX382_BO1,204,203,200_.jpg" style="height:499px; width:384px" /><br />\r\n<br />\r\nIn&nbsp;<strong><em>The Art of Scalability,</em></strong>&nbsp;AKF Partners cofounders Martin L. Abbott and Michael T. Fisher cover everything IT and business leaders must know to build technology infrastructures that can scale smoothly to meet any business requirement. Drawing on their unparalleled experience managing some of the worlds highest-transaction-volume Web sites, the authors provide detailed models and best-practice approaches available in no other book.<br />\r\n<br />\r\nUnlike previous books on scalability,&nbsp;<strong><em>The Art of Scalability</em></strong>&nbsp;doesnt limit its coverage to technology. Writing for both technical and nontechnical decision-makers, this book covers everything that impacts scalability, including architecture, processes, people, and organizations.</p>\r\n	Martin L. Abbott, Michael T. Fisher	2019-11-21 09:03:04.269185	2020-02-28 03:54:37.893125	1	10	\N	\N	\N	\N	image/upload/v1582862081/tiy0vxflpqv4oxj5pvh8.jpg
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at, description) FROM stdin;
1	Finance	2019-04-06 10:58:24.697256	2019-04-06 10:58:24.697256	\N
3	Technology	2019-04-06 10:58:41.072269	2019-04-06 10:58:41.072269	\N
4	Psychology	2019-04-06 10:58:49.343092	2019-04-06 10:58:49.343092	\N
5	Sex	2019-04-06 10:58:55.874122	2019-04-06 10:58:55.874122	\N
6	Novel	2019-04-06 10:59:01.640306	2019-04-06 10:59:01.640306	\N
7	Audiobook	2019-04-07 10:00:03.149094	2019-04-07 10:00:03.149094	
9	FANTASY	2019-07-08 10:52:16.301638	2019-07-08 10:52:16.301638	
10	PROGRAMMING	2019-09-24 03:10:32.861605	2019-09-24 03:10:32.861605	PROGRAMMING BOOKS
11	MARKETING	2019-09-24 03:56:39.43508	2019-09-24 03:56:39.43508	
8		2019-04-09 04:57:55.306554	2019-09-27 10:36:02.794369	hgfhgfh
2	Economic	2019-04-06 10:58:31.432469	2019-12-01 10:46:27.938295	Economic books
12	FOOD	2020-02-28 03:35:29.708218	2020-02-28 03:35:29.708218	
13	HISTORY	2020-02-28 03:38:20.152749	2020-02-28 03:38:20.152749	
14	The Witcher Saga 	2020-02-28 03:41:58.672862	2020-02-28 03:41:58.672862	
15	Mystery, Thriller & Suspense	2020-02-28 03:50:53.933997	2020-02-28 03:50:53.933997	
\.


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ckeditor_assets (id, data_file_name, data_content_type, data_file_size, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, rating, comment, created_at, updated_at, user_id, book_id) FROM stdin;
2	5	Cách dẫn truyện cuốn hút, tạo cảm giác phê pha cho người đọc!	2019-04-06 11:05:25.862445	2019-04-06 14:58:01.02852	1	2
3	4	Exciting!	2019-04-06 14:23:50.702827	2019-04-06 14:58:32.710067	1	4
6	\N	Best book	2019-09-30 08:47:34.151954	2019-09-30 08:47:34.151954	1	14
4	3	Exciting	2019-04-09 04:57:23.070615	2019-04-09 04:57:23.070615	1	1
7	\N	5*	2019-10-13 05:05:16.00138	2019-10-13 05:05:16.00138	1	9
9	\N	5*	2020-02-26 09:34:35.440612	2020-02-26 09:34:35.440612	1	8
11	\N	ww	2020-02-27 02:59:36.056124	2020-02-27 02:59:36.056124	1	10
10	4	123	2020-02-27 02:41:17.30264	2020-02-27 05:33:21.982768	1	11
5	4	a valuable Rails book	2019-09-27 10:33:35.861816	2020-02-27 05:33:37.061271	1	17
12	4	hf	2020-02-27 05:32:20.181525	2020-02-27 05:39:25.221452	1	16
13	5	AWESOME	2020-02-27 05:40:21.952125	2020-02-27 05:40:35.136109	1	17
14	3	vote	2020-02-27 05:41:36.451953	2020-02-27 05:41:36.451953	1	3
8	2	!	2019-11-06 10:06:47.815074	2020-02-28 01:51:22.288652	1	12
16	4	Best book	2020-02-28 01:51:56.997081	2020-02-28 01:51:56.997081	1	24
15	3	xx	2020-02-28 01:51:40.199472	2020-02-28 02:40:57.835758	1	21
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20190330075033
20190330094437
20190330104837
20190331025214
20190331025413
20190331064010
20190331073134
20190331073314
20190331073430
20190404123627
20190404130152
20190407050406
20190407070236
20190407074617
20190408132219
20190409124310
20190927080732
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name, description, created_at, updated_at, book_id) FROM stdin;
1	sex	\N	2019-04-06 11:01:45.086666	2019-04-06 11:01:45.086666	1
2	cowboy	\N	2019-07-08 10:53:48.634779	2019-07-08 10:53:48.634779	15
3	food	\N	2020-02-28 03:37:06.241089	2020-02-28 03:37:06.241089	25
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, avatar, provider, uid, name, auth_token) FROM stdin;
1	thai.itplus@gmail.com	$2a$11$Cu6GohTXZ2nwb8ni.3dFUumJhLhQyR9rpVhBmICs2NwuNMubTG9nK	\N	\N	2020-02-27 05:39:08.102882	2019-04-06 10:59:43.785227	2020-02-27 05:39:08.104521	\N	\N	\N	\N	\N
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 36, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 15, true);


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ckeditor_assets_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 16, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: ckeditor_assets ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_ckeditor_assets_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ckeditor_assets_on_type ON public.ckeditor_assets USING btree (type);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM postgres;


--
-- PostgreSQL database dump complete
--

