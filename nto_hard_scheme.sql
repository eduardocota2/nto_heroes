-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-07-2023 a las 07:51:48
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_ENGINE_SUBSTITUTION";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nto_hard_test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `backup_points` int(11) NOT NULL DEFAULT '0',
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `vip_time` int(15) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `page_lastday` int(11) NOT NULL,
  `page_access` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `last_post` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `email`, `premium_points`, `backup_points`, `guild_points`, `guild_points_stats`, `password`, `salt`, `premdays`, `lastday`, `key`, `blocked`, `warnings`, `group_id`, `vip_time`, `email_new`, `email_new_time`, `email_code`, `next_email`, `created`, `page_lastday`, `page_access`, `rlname`, `location`, `flag`, `last_post`, `create_date`, `create_ip`, `vote`) VALUES
(1, '1', '', 0, 0, 0, 0, 'ds68tf6fd65216wey9y63d23303r949ef656es32sr', '', 65548, 0, '', 0, 0, 1, 0, '', 0, '0', 0, 0, 1299890479, 0, '', '', 'unknown', 0, 0, 0, 0),
(2, 'adm', 'adm@adm.com', 510, 0, 100, 0, 'b4a118522ce3d40568fbe4bc8243863e7f8ade3d', '', 0, 0, '', 0, 0, 1, 0, '', 0, '', 0, 0, 0, 999, '', '', 'unknown', 0, 1411663270, 2130706433, 0),
(2740, '714055', 'last_8_20@hotmail.com', 0, 0, 0, 0, '2eb736f0ab2bc9350d989fafdf993216a9c5e6ba', '', 0, 0, '', 0, 0, 1, 0, '', 0, '', 0, 0, 0, 0, '', '', 'unknown', 0, 1688418226, 0, 0);

--
-- Disparadores `accounts`
--
DELIMITER $$
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auction_system`
--

CREATE TABLE `auction_system` (
  `id` int(11) NOT NULL,
  `player` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) UNSIGNED NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `environment_killers`
--

CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL DEFAULT '0',
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `global_storage`
--

INSERT INTO `global_storage` (`key`, `world_id`, `value`) VALUES
('140120', 0, '0'),
('140121', 0, '0'),
('180400', 0, '0'),
('23211', 0, '1688594329'),
('23212', 0, '1688594589'),
('23213', 0, '1688594823'),
('23214', 0, '1688594801'),
('23215', 0, '1688594826');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL,
  `last_execute_points` int(11) NOT NULL DEFAULT '0',
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `guilds`
--

INSERT INTO `guilds` (`id`, `world_id`, `name`, `ownerid`, `creationdata`, `checkdata`, `motd`, `balance`, `description`, `logo_gfx_name`, `last_execute_points`, `guild_logo`, `create_ip`) VALUES
(1, 0, 'Deluxe', 2375, 1688597675, 0, '', 0, 'New guild. Leader must edit this text :)', '', 0, 0x313638383539373637353b646174613a696d6167652f6769663b6261736536342c52306c474f446c68514142414150634141414141414167414142414141426741414267494143454941436b494144454941446b4941446b514145495141456f514146495141466f5141466f5941474d5941474e6a556d73594147744b4147746a556d746a576d7472576e4d5941484e5341484e72576e4e72593373594148736841487453414874614148747a5933747a6134516841495261414952614349526a4349523761345237633477684149786a434979456334794565355168414a5272434a534d65357770414a7872434a787a434a794d6535794d684a7955684b5570414b567a434b5637434b5755684b57636a4b3070414b3137434b32636a4c5570414c5637434c5745434c576c6c4c57746c4c3078414c3245434c324d434c32316e4d5978414d614d434d6155434d613170633478414d3655434d363972645978414e5935414e6155434e6163434e3435414f2f657876666e7a762f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f79483542414541414645414c414141414142414145414141416a2b414b4e4543514367494d454143424d614e4b6a774945494143523832584168526f734f43416a4e7144494345434a4b50486b4d7943596c6b704567695445717137496753704d6d534b564e2b424e6b785a514162476a554347466d795a63715750556b7947597079364a4f6951486c366a456c7a4a70475141456a677a446c514a644759517a753672506b7861396169566e334b354e6e314b63696f55334d475942717a3645696c4d4a64794e5174544a6b69554872757964456b4567496359564b75614841757a37744359543868364e566f54373958446b4c4d69415a4342525741414d346d7566496c334a52496749427759534a444167516f634d7a305870706c334a6d584c5644482f334e454368496b574c585a6b3172736a41634944466d3672734a424167414146514754694a644969416f4d45437851343244446a4b5a4d416c533854595641516749414443784c2b474341674945414243302b424741415141516752484245576a485a674167675142774149754e39517675427842632b743939414f324d4757303034426e4a424545556b306d4951525267685278417348454151414345793051414242423051414167675062426a41427570565a454551437a375949494d4e42684641424156656c6d45424434366741476b5858464144697755454145514c454946515630307041516c52424431495749515251627777516764516a6c4145677744733846706761303357517848486d61444341777751304a304354437751514163416243415a5351514738494345456c37775541476c4d6141414141636b55634e615638615730674d4a4f464744624a6b5a344141537667584234414836465561454351416b30454f456778365558463432695a4445416739636c78315657524952774b5146624a425a4241596755594143437844775942482b4b775267416c356d4b696745445155416f4943504368786746334d4154426b41536a474343744a7a547651416746764450724157456230426b494f4542546841684a67354a424845726970305a4d4777736e34567741704a4d4c4341545a3865364251414c7851686751456a4b624242437a36715249514b4144516f78486f4353446a6f41756c35564a715653346c57684c4974466175755376516d4b59414451484145774b78443968564145454c514b63514a41594241524849647565646a41685a6b43454151526e53386c4d493639545153615577574641472b4c6d7631314b364b356864416456725a2b3441434f46514a41413146524b41415633327136785954424851675951414f455042415479795a42536b4151675278595770504c53633041437641796c4856536266383030635232316f65616e6c5a39786b4133795a51524137444f70575a714276594b55542b724343666c65354776336f5573616237476f42443132574e31304d5043536278674146306d51567441515759454d41494146545847684e6c5a3751543155516346664544443536416d585650425a3244455865654c4951414d365132457043354267324143707131314c6c416d4b56476b374d4739494379413141443052486c526777365177494b4643464333552f4e414941424b7942634a56746d73657a35556b546c746344304147697137613553427a427474522b6258775141755431515541634d756944415a46687078766e666e6e2f464642494f4641426a414161676752416b4e49494148454149644a7542416774676743496b4a41453779747175647249736c78786d4d766754534a597959784956794b6f41524141425175416e4241433449416c30497739434b4865434771424d4344333458674677344b4e6c59636f3948646c64464862696b5365774a43582b45597459567a62676e32414a5956525453704b454d4559445a786c514e797049414c3161307a4d4d476b676e5a6c6e5453495a56706377416759467a4330434f4c694343437a43675277525267417263746f41494f4941425a45456345725448753851677759655355785549456843426c6a7846616b5777674147494978344437476f466739494c536741514d5a37465a535a303347486b674149457930305264514b676752454b344b69524145423477364b4c42794f47756a6836366f716549354a71356a6944414a53736136344c35534d4c4d49496b464541334c4e6c5a4168696746636241524965396f31705969436739397a776c5830666b79646c6f756138574c4d55434d78795763694a6a52537a31386965646d654d4469476566566a5a6f4c5639425351474d554951446d43416c725153434145716d484c64395249636349556c5a56424b304670514843506a2b61684142756b615763526242415267436b676f59634143364b4b55316b6253682f727a794759486d4b674c42536f493073556d45635a5a724178343067625069346a596677695368636c466b46596b49417535674c5a6c5753596b2f665a4f3537786e76626b785a436a7a74395a4b7274415249426d68426a7867774e73574d4d77674530413842447443567439776c6d7a506c7a503532383858623351636942466a5665416f4349664f6f7a4334586c4d785051496f7059626154595242355147356134494146744c4668367a4f41653743796c634b38425a3559736335536c374b554135545651674567674145535567535552693473512f6f4956307543522b57416a69576f4d6b494f436c436244637a4c41766e71774c6d415971386668724f61666a724b543635694c7a2b2b6255474d564934424c6d444c47627a454b596954584662676d553348644d576a7167332b514c735530456367427141494c68714c5a4f7a326c74346d315732516f577732475743416d49586b63556b514151502b537357694a6957536f5451713934424c555341594d56787a66427262376c6931754a416c4e5343747246587531726152464f424e4c786957644a4b77676752383569324f79654e6a33706e4248536f46767463384446412b64744c79584f78314f78694b38654a344e77344b747236395178316656684936716a48426b4e6f53514e6a736c4a53754f63596b46393569666366576b614e4d6c79316e49347130466d5345463152517158495662336354366a764e37455a794b456e4d6f774a67684353556349337a50416c58636b7866565049756342656379335342306a2b674c74646c2b6c506b56316547344b2b6f3248647553773451453643724b7562596a2b46306d366732544b547039704a37527430746a724d595a674f7a465373363347482b5948736231386a6f5679357370534a6b65676d3641464441417a49496a4833745674546473466b7839514f4c522b66363353315367415133304c4d6b6434766b42644f454a35716c4d354b7a367061455461432b47564843546e436f573077742b596339477a4347645473586d3041414134685774454347554a436c787457796b705a6e46532f59747134555a414b6f7a724f71567932445545355356424b70794c496b45784749474b544459706b6a4243695141524c6f65746572766b477847554942436d416741396a4f64743275732b774b5a44766233566b495169685167512b6b494e4851316f675366434344456e6a6732786e7741416c5177494a363235734645694f33422b68393733716a674154762f72594853694144483651374d45505167517a364c514e30553855484151413443525474677873732f4e3479304d48424e773774496477414d4277507563674c566533774b45426835496f4f434141414f773d3d, 0);

--
-- Disparadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN
        UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_kills`
--

CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `guild_ranks`
--

INSERT INTO `guild_ranks` (`id`, `guild_id`, `name`, `level`) VALUES
(1, 1, 'Leader', 3),
(2, 1, 'Vice-Leader', 2),
(3, 1, 'Member', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `payment` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guild_kills` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `enemy_kills` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `doors` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `beds` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tiles` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `guild` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `clear` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 0, 0, 0, 0, 'Flat #1', 1, 19, 900000, 900000, 1, 1, 34, 0, 0),
(2, 0, 0, 0, 0, 0, 'Flat #2', 1, 19, 900000, 900000, 2, 1, 30, 0, 0),
(3, 0, 0, 0, 0, 0, 'Flat #3', 1, 20, 945000, 945000, 2, 1, 31, 0, 0),
(9, 0, 0, 0, 0, 0, 'Flat #9', 1, 19, 900000, 900000, 2, 1, 35, 0, 0),
(10, 0, 0, 0, 0, 0, 'Flat #10', 1, 12, 585000, 585000, 2, 1, 19, 0, 0),
(11, 0, 0, 0, 0, 0, 'Flat  #11', 1, 15, 720000, 720000, 3, 1, 27, 0, 0),
(12, 0, 0, 0, 0, 0, 'Flat  #12', 1, 42, 1935000, 1935000, 7, 1, 77, 0, 0),
(13, 0, 0, 0, 0, 0, 'Flat  #13', 1, 38, 1800000, 1800000, 3, 2, 73, 0, 0),
(14, 0, 0, 0, 0, 0, 'Flat  #14', 1, 19, 900000, 900000, 3, 1, 37, 0, 0),
(15, 0, 0, 0, 0, 0, 'Flat #15', 1, 19, 900000, 900000, 5, 1, 45, 0, 0),
(16, 0, 0, 0, 0, 0, 'Flat  #16', 1, 16, 765000, 765000, 4, 1, 39, 0, 0),
(17, 0, 0, 0, 0, 0, 'Flat  #17', 1, 19, 900000, 900000, 5, 1, 43, 0, 0),
(18, 0, 0, 0, 0, 0, 'Flat  #18', 1, 19, 900000, 900000, 4, 1, 46, 0, 0),
(19, 0, 0, 0, 0, 0, 'Flat  #19', 1, 13, 630000, 630000, 3, 1, 29, 0, 0),
(20, 0, 0, 0, 0, 0, 'Flat  #20', 1, 13, 630000, 630000, 3, 1, 29, 0, 0),
(21, 0, 0, 0, 0, 0, 'Flat  #21', 1, 13, 630000, 630000, 2, 1, 24, 0, 0),
(22, 0, 0, 0, 0, 0, 'Flat #22', 1, 13, 630000, 630000, 4, 1, 35, 0, 0),
(23, 0, 0, 0, 0, 0, 'Flat  #23', 1, 13, 630000, 630000, 3, 1, 35, 0, 0),
(24, 0, 0, 0, 0, 0, 'Flat #24', 1, 13, 630000, 630000, 3, 1, 35, 0, 0),
(25, 0, 0, 0, 0, 0, 'Flat #25', 1, 6, 315000, 315000, 3, 1, 24, 0, 0),
(26, 0, 0, 0, 0, 0, 'Flat #26', 1, 26, 1215000, 1215000, 4, 1, 55, 0, 0),
(27, 0, 0, 0, 0, 0, 'Flat  #27', 1, 21, 990000, 990000, 4, 1, 48, 0, 0),
(28, 0, 0, 0, 0, 0, 'Flat #28', 1, 30, 1395000, 1395000, 1, 1, 47, 0, 0),
(29, 0, 0, 0, 0, 0, 'Flat #29', 1, 95, 4320000, 4320000, 8, 1, 170, 0, 0),
(30, 0, 0, 0, 0, 0, 'Flat  #30', 1, 12, 585000, 585000, 1, 1, 27, 0, 0),
(31, 0, 0, 0, 0, 0, 'Flat #31', 1, 23, 1080000, 1080000, 4, 1, 53, 0, 0),
(32, 0, 0, 0, 0, 0, 'Flat #32', 1, 25, 1170000, 1170000, 3, 1, 41, 0, 0),
(33, 0, 0, 0, 0, 0, 'Flat  #33', 1, 23, 1080000, 1080000, 3, 1, 44, 0, 0),
(34, 0, 0, 0, 0, 0, 'Flat  #34', 1, 23, 1080000, 1080000, 3, 1, 37, 0, 0),
(35, 0, 0, 0, 0, 0, 'Flat #35', 1, 23, 1080000, 1080000, 5, 1, 52, 0, 0),
(36, 0, 0, 0, 0, 0, 'Flat #36', 1, 23, 1080000, 1080000, 4, 1, 47, 0, 0),
(37, 0, 0, 0, 0, 0, 'Flat  #37', 1, 39, 1800000, 1800000, 3, 1, 62, 0, 0),
(38, 0, 0, 0, 0, 0, 'Flat #38', 1, 33, 1530000, 1530000, 4, 1, 48, 0, 0),
(39, 0, 0, 0, 0, 0, 'Flat #39', 1, 39, 1800000, 1800000, 3, 1, 71, 0, 0),
(40, 0, 0, 0, 0, 0, 'Flat  #40', 1, 33, 1530000, 1530000, 4, 1, 55, 0, 0),
(41, 0, 0, 0, 0, 0, 'Flat  #41', 1, 39, 1800000, 1800000, 3, 1, 71, 0, 0),
(42, 0, 0, 0, 0, 0, 'Flat #42', 1, 33, 1530000, 1530000, 4, 1, 62, 0, 0),
(43, 0, 0, 0, 0, 0, 'Flat  #43', 1, 12, 585000, 585000, 1, 1, 19, 0, 0),
(44, 0, 0, 0, 0, 0, 'Flat  #44', 1, 20, 945000, 945000, 5, 1, 44, 0, 0),
(45, 0, 0, 0, 0, 0, 'Flat  #45', 1, 25, 1170000, 1170000, 5, 1, 50, 0, 0),
(46, 0, 0, 0, 0, 0, 'Flat  #46', 1, 25, 1170000, 1170000, 7, 1, 47, 0, 0),
(47, 0, 0, 0, 0, 0, 'Flat  #47', 1, 25, 1170000, 1170000, 5, 1, 50, 0, 0),
(48, 0, 0, 0, 0, 0, 'Flat #48', 1, 25, 1170000, 1170000, 5, 1, 52, 0, 0),
(49, 0, 0, 0, 0, 0, 'Flat  #49', 1, 24, 1125000, 1125000, 3, 1, 47, 0, 0),
(50, 0, 0, 0, 0, 0, 'Flat #50', 1, 24, 1125000, 1125000, 3, 1, 47, 0, 0),
(51, 0, 0, 0, 0, 0, 'Flat #51', 1, 24, 1125000, 1125000, 2, 1, 48, 0, 0),
(52, 0, 0, 0, 0, 0, 'Flat  #52', 1, 24, 1125000, 1125000, 2, 1, 38, 0, 0),
(53, 0, 0, 0, 0, 0, 'Flat #53', 1, 19, 900000, 900000, 2, 1, 34, 0, 0),
(54, 0, 0, 0, 0, 0, 'Flat  #54', 1, 12, 585000, 585000, 1, 1, 23, 0, 0),
(55, 0, 0, 0, 0, 0, 'Flat #55', 1, 12, 585000, 585000, 3, 1, 23, 0, 0),
(56, 0, 0, 0, 0, 0, 'AP #01', 2, 0, 0, 0, 0, 0, 3, 0, 0),
(57, 0, 0, 0, 0, 0, 'AP #02', 2, 22, 990000, 990000, 1, 0, 27, 0, 0),
(58, 0, 0, 0, 0, 0, 'AP #03', 2, 23, 1035000, 1035000, 1, 0, 35, 0, 0),
(59, 0, 0, 0, 0, 0, 'AP #04', 2, 19, 855000, 855000, 1, 0, 24, 0, 0),
(60, 0, 0, 0, 0, 0, 'AP #05', 2, 31, 1395000, 1395000, 1, 0, 46, 0, 0),
(61, 0, 0, 0, 0, 0, 'AP #06', 2, 15, 675000, 675000, 1, 0, 30, 0, 0),
(62, 0, 0, 0, 0, 0, 'AP #07', 2, 10, 450000, 450000, 1, 0, 19, 0, 0),
(63, 0, 0, 0, 0, 0, 'AP #08', 2, 15, 675000, 675000, 1, 0, 20, 0, 0),
(64, 0, 0, 0, 0, 0, 'AP #09', 2, 14, 630000, 630000, 1, 0, 19, 0, 0),
(65, 0, 0, 0, 0, 0, 'AP #10', 2, 23, 1035000, 1035000, 1, 0, 33, 0, 0),
(66, 0, 0, 0, 0, 0, 'AP #11', 2, 11, 495000, 495000, 1, 0, 16, 0, 0),
(67, 0, 0, 0, 0, 0, 'AP #12', 2, 55, 2475000, 2475000, 1, 0, 63, 0, 0),
(68, 0, 0, 0, 0, 0, 'AP #13', 2, 48, 2160000, 2160000, 1, 0, 55, 0, 0),
(69, 0, 0, 0, 0, 0, 'AP #14', 2, 59, 2655000, 2655000, 1, 0, 70, 0, 0),
(70, 0, 0, 0, 0, 0, 'AP #15', 2, 27, 1215000, 1215000, 1, 0, 40, 0, 0),
(71, 0, 0, 0, 0, 0, 'AP #16', 2, 23, 1035000, 1035000, 1, 0, 29, 0, 0),
(72, 0, 0, 0, 0, 0, 'AP #17', 2, 29, 1305000, 1305000, 1, 0, 41, 0, 0),
(117, 0, 0, 0, 0, 0, 'Unnamed House #117', 3, 222, 10125000, 10125000, 1, 3, 286, 1, 0),
(118, 0, 0, 0, 0, 0, 'Unnamed House #118', 3, 222, 10125000, 10125000, 1, 3, 287, 1, 0),
(119, 0, 0, 0, 0, 0, 'Unnamed House #119', 3, 444, 20250000, 20250000, 2, 6, 576, 1, 0),
(120, 0, 0, 0, 0, 0, 'Unnamed House #120', 3, 219, 9990000, 9990000, 1, 3, 287, 1, 0),
(121, 0, 0, 0, 0, 0, 'Unnamed House #121', 3, 215, 9810000, 9810000, 1, 3, 318, 1, 0),
(122, 0, 0, 0, 0, 0, 'Unnamed House #122', 3, 222, 10125000, 10125000, 1, 3, 287, 1, 0),
(123, 0, 0, 0, 0, 0, 'Unnamed House #123', 3, 211, 9630000, 9630000, 1, 3, 289, 1, 0),
(124, 0, 0, 0, 0, 0, 'Unnamed House #124', 3, 219, 9990000, 9990000, 1, 3, 294, 1, 0),
(125, 0, 0, 0, 0, 0, 'Unnamed House #125', 3, 219, 9990000, 9990000, 1, 3, 302, 1, 0),
(127, 0, 0, 0, 0, 0, 'Unnamed House #127', 3, 222, 10125000, 10125000, 1, 3, 308, 0, 0),
(128, 0, 0, 0, 0, 0, 'Flat #128', 1, 13, 630000, 630000, 3, 1, 23, 0, 0),
(1418, 0, 0, 0, 0, 0, 'Suna 1', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1419, 0, 0, 0, 0, 0, 'Suna 2', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1421, 0, 0, 0, 0, 0, 'Suna 4', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1422, 0, 0, 0, 0, 0, 'Suna 5', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1423, 0, 0, 0, 0, 0, 'Suna 6', 2, 6, 6000, 70000, 1, 0, 12, 0, 0),
(1424, 0, 0, 0, 0, 0, 'Suna 7', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1425, 0, 0, 0, 0, 0, 'Suna 8', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1427, 0, 0, 0, 0, 0, 'Suna 10', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1428, 0, 0, 0, 0, 0, 'Suna 11', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1429, 0, 0, 0, 0, 0, 'Suna 12', 2, 6, 6000, 70000, 0, 0, 9, 0, 0),
(1430, 0, 0, 0, 0, 0, 'Suna 13', 2, 42, 43000, 70000, 0, 1, 59, 0, 0),
(1431, 0, 0, 0, 0, 0, 'Suna 14', 2, 42, 43000, 70000, 0, 1, 66, 0, 0),
(1432, 0, 0, 0, 0, 0, 'Suna 15', 2, 42, 43000, 70000, 0, 1, 69, 0, 0),
(1433, 0, 0, 0, 0, 0, 'Suna 16', 2, 42, 43000, 70000, 0, 1, 58, 0, 0),
(1434, 0, 0, 0, 0, 0, 'Suna 17', 2, 42, 43000, 70000, 0, 1, 56, 0, 0),
(1435, 0, 0, 0, 0, 0, 'Suna 18', 2, 42, 43000, 70000, 1, 1, 58, 0, 0),
(1436, 0, 0, 0, 0, 0, 'Suna 19', 2, 38, 39000, 70000, 0, 1, 50, 0, 0),
(1437, 0, 0, 0, 0, 0, 'Suna 20', 2, 39, 40000, 70000, 0, 1, 44, 0, 0),
(1438, 0, 0, 0, 0, 0, 'Suna 21', 2, 38, 39000, 70000, 0, 1, 61, 0, 0),
(1439, 0, 0, 0, 0, 0, 'Suna 22', 2, 39, 40000, 70000, 0, 1, 52, 0, 0),
(1440, 0, 0, 0, 0, 0, 'Suna 23', 2, 77, 79000, 70000, 0, 2, 113, 0, 0),
(1441, 0, 0, 0, 0, 0, 'Suna 24', 2, 48, 50000, 70000, 1, 2, 70, 0, 0),
(1442, 0, 0, 0, 0, 0, 'Suna 25', 2, 48, 50000, 70000, 0, 2, 84, 0, 0),
(1656, 0, 0, 0, 0, 0, 'Sub House Kusagakure', 7, 68, 71000, 0, 4, 3, 126, 0, 0),
(1659, 0, 0, 0, 0, 0, 'Kusagakure Flat I', 7, 6, 7000, 0, 1, 1, 16, 0, 0),
(1660, 0, 0, 0, 0, 0, 'Kusagakure Flat II', 7, 6, 7000, 0, 1, 1, 16, 0, 0),
(1661, 0, 0, 0, 0, 0, 'Kusagakure Flat III', 7, 6, 7000, 0, 0, 1, 15, 0, 0),
(1662, 0, 0, 0, 0, 0, 'Kusagakure Flat IIII', 7, 8, 9000, 0, 1, 1, 19, 0, 0),
(1663, 0, 0, 0, 0, 0, 'Kusagakure Flat V', 7, 6, 7000, 0, 1, 1, 16, 0, 0),
(1664, 0, 0, 0, 0, 0, 'Kusagakure Flat VI', 7, 6, 7000, 0, 1, 1, 16, 0, 0),
(1665, 0, 0, 0, 0, 0, 'Kusagakure Flat VII', 7, 10, 11000, 0, 0, 1, 20, 0, 0),
(1666, 0, 0, 0, 0, 0, 'Kusagakure Flat VIII', 7, 8, 9000, 0, 1, 1, 19, 0, 0),
(1667, 0, 0, 0, 0, 0, 'Kusagakure Nort House I', 7, 9, 9000, 0, 0, 0, 16, 0, 0),
(1668, 0, 0, 0, 0, 0, 'Kusagakure Nort House II', 7, 9, 9000, 0, 0, 0, 16, 0, 0),
(1669, 0, 0, 0, 0, 0, 'Kusagakure Nort House III', 7, 9, 9000, 0, 0, 0, 16, 0, 0),
(1670, 0, 0, 0, 0, 0, 'Kusagakure Private House I', 7, 8, 9000, 0, 1, 1, 18, 0, 0),
(1671, 0, 0, 0, 0, 0, 'Kusagakure Private House II', 7, 28, 29000, 0, 1, 1, 47, 0, 0),
(1672, 0, 0, 0, 0, 0, 'Kusagakure Private House III', 7, 28, 29000, 0, 1, 1, 48, 0, 0),
(1673, 0, 0, 0, 0, 0, 'Kusagakure Private House IIII', 7, 21, 22000, 0, 2, 1, 37, 0, 0),
(1674, 0, 0, 0, 0, 0, 'Kusagakure Private House V', 7, 23, 24000, 0, 2, 1, 40, 0, 0),
(1675, 0, 0, 0, 0, 0, 'Kusagakure Depo House I', 7, 26, 27000, 0, 1, 1, 48, 0, 0),
(1676, 0, 0, 0, 0, 0, 'Kusagakure Depo House II', 7, 28, 29000, 0, 1, 1, 48, 0, 0),
(1677, 0, 0, 0, 0, 0, 'Kusagakure Depo House III', 7, 19, 20000, 0, 2, 1, 36, 0, 0),
(1678, 0, 0, 0, 0, 0, 'Vale Kusagakure I', 7, 22, 23000, 0, 0, 1, 35, 0, 0),
(1679, 0, 0, 0, 0, 0, 'Vale Kusagakure II', 7, 10, 11000, 0, 0, 1, 20, 0, 0),
(1680, 0, 0, 0, 0, 0, 'Vale Kusagakure III', 7, 26, 27000, 0, 0, 1, 45, 0, 0),
(1681, 0, 0, 0, 0, 0, 'Vale Kusagakure IIII', 7, 30, 31000, 0, 1, 1, 50, 0, 0),
(1682, 0, 0, 0, 0, 0, 'Flat Vale Kusagakure I', 7, 6, 7000, 0, 1, 1, 15, 0, 0),
(1683, 0, 0, 0, 0, 0, 'Flat Vale Kusagakure II', 7, 6, 6000, 0, 1, 0, 12, 0, 0),
(1684, 0, 0, 0, 0, 0, 'Flat Vale Kusagakure III', 7, 2, 3000, 0, 1, 1, 9, 0, 0),
(1685, 0, 0, 0, 0, 0, 'Flat Vale Kusagakure IIII', 7, 4, 4000, 0, 1, 0, 9, 0, 0),
(1686, 0, 0, 0, 0, 0, 'Flat Vale Kusagakure V', 7, 2, 3000, 0, 1, 1, 9, 0, 0),
(1687, 0, 0, 0, 0, 0, 'Vale Kusagakure V', 7, 28, 29000, 0, 0, 1, 48, 0, 0),
(1688, 0, 0, 0, 0, 0, 'Apart Kusagakure I', 7, 2, 3000, 0, 1, 1, 9, 0, 0),
(1689, 0, 0, 0, 0, 0, 'Apart Kusagakure II', 7, 4, 4000, 0, 1, 0, 9, 0, 0),
(1690, 0, 0, 0, 0, 0, 'Apart Kusagakure III', 7, 4, 5000, 0, 1, 1, 12, 0, 0),
(1692, 0, 0, 0, 0, 0, 'Apart Kusagakure IIII', 7, 6, 7000, 0, 1, 1, 15, 0, 0),
(1693, 0, 0, 0, 0, 0, 'Apart Kusagakure V', 7, 6, 7000, 0, 1, 1, 15, 0, 0),
(1695, 0, 0, 0, 0, 0, 'Vale Kusagakure Simple', 7, 13, 14000, 0, 0, 1, 24, 0, 0),
(1696, 0, 0, 0, 0, 0, 'Vale Kusagakure Apart', 7, 7, 8000, 0, 1, 1, 17, 0, 0),
(1697, 0, 0, 0, 0, 0, 'Vale Kusagakure Apart I', 7, 7, 8000, 0, 1, 1, 17, 0, 0),
(1698, 0, 0, 0, 0, 0, 'Kusagakure House I', 7, 14, 15000, 0, 0, 1, 26, 0, 0),
(1699, 0, 0, 0, 0, 0, 'Kusagakure House II', 7, 10, 10000, 0, 0, 0, 18, 0, 0),
(1700, 0, 0, 0, 0, 0, 'Kusagakure House III', 7, 13, 14000, 0, 1, 1, 24, 0, 0),
(1701, 0, 0, 0, 0, 0, 'Kusagakure House IIII', 7, 28, 29000, 0, 0, 1, 48, 0, 0),
(1702, 0, 0, 0, 0, 0, 'Kusagakure House V', 7, 15, 16000, 0, 1, 1, 31, 0, 0),
(1703, 0, 0, 0, 0, 0, 'Kusagakure House VI', 7, 16, 17000, 0, 0, 1, 28, 0, 0),
(1704, 0, 0, 0, 0, 0, 'Kusagakure House VII', 7, 17, 18000, 0, 2, 1, 33, 0, 0),
(1705, 0, 0, 0, 0, 0, 'Kusagakure House VIII', 7, 14, 15000, 0, 2, 1, 28, 0, 0),
(1706, 0, 0, 0, 0, 0, 'Kusagakure House VIIII', 7, 10, 11000, 0, 1, 1, 20, 0, 0),
(1707, 0, 0, 0, 0, 0, 'Kusagakure House X', 7, 10, 11000, 0, 1, 1, 20, 0, 0),
(1738, 0, 0, 0, 0, 0, 'Takumi Depo House I', 8, 38, 39000, 0, 2, 1, 64, 0, 0),
(1740, 0, 0, 0, 0, 0, 'Takumi Depo House II', 8, 39, 40000, 0, 2, 1, 64, 0, 0),
(1741, 0, 0, 0, 0, 0, 'Takumi Depo House III', 8, 33, 35000, 0, 3, 2, 64, 0, 0),
(1742, 0, 0, 0, 0, 0, 'Takumi Depo House IIII', 8, 26, 27000, 0, 1, 1, 39, 0, 0),
(1743, 0, 0, 0, 0, 0, 'Takumi Depo House V', 8, 14, 14000, 0, 1, 0, 24, 0, 0),
(1744, 0, 0, 0, 0, 0, 'Takumi Depo House VI', 8, 33, 35000, 0, 3, 2, 65, 0, 0),
(1745, 0, 0, 0, 0, 0, 'Takumi Depo House VII', 8, 38, 40000, 0, 2, 2, 65, 0, 0),
(1746, 0, 0, 0, 0, 0, 'Takumi Depo House VIII', 8, 35, 37000, 0, 3, 2, 64, 0, 0),
(1747, 0, 0, 0, 0, 0, 'Takumi House I', 8, 21, 21000, 0, 1, 0, 33, 0, 0),
(1748, 0, 0, 0, 0, 0, 'Takumi House II', 8, 14, 14000, 0, 1, 0, 25, 0, 0),
(1749, 0, 0, 0, 0, 0, 'Takumi House III', 8, 21, 21000, 0, 1, 0, 32, 0, 0),
(1750, 0, 0, 0, 0, 0, 'Takumi House IIII', 8, 33, 34000, 0, 2, 1, 56, 0, 0),
(1751, 0, 0, 0, 0, 0, 'Takumi House V', 8, 21, 21000, 0, 1, 0, 33, 0, 0),
(1752, 0, 0, 0, 0, 0, 'Takumi House VI', 8, 52, 54000, 0, 1, 2, 80, 0, 0),
(1753, 0, 0, 0, 0, 0, 'Takumi House VII', 8, 52, 54000, 0, 1, 2, 81, 0, 0),
(1754, 0, 0, 0, 0, 0, 'Takumi House VIII', 8, 46, 47000, 0, 1, 1, 70, 0, 0),
(1755, 0, 0, 0, 0, 0, 'Takumi House VIIII', 8, 33, 36000, 0, 3, 3, 65, 0, 0),
(1756, 0, 0, 0, 0, 0, 'Takumi Vilarejo I', 8, 33, 36000, 0, 4, 3, 66, 0, 0),
(1757, 0, 0, 0, 0, 0, 'Takumi Vilarejo II', 8, 21, 23000, 0, 3, 2, 48, 0, 0),
(1758, 0, 0, 0, 0, 0, 'Vilarejo Takumi House I', 8, 16, 17000, 0, 2, 1, 32, 0, 0),
(1759, 0, 0, 0, 0, 0, 'Vilarejo Takumi House II', 8, 16, 17000, 0, 2, 1, 32, 0, 0),
(1760, 0, 0, 0, 0, 0, 'Vilarejo Takumi House III', 8, 34, 35000, 0, 2, 1, 56, 0, 0),
(1761, 0, 0, 0, 0, 0, 'Vilarejo Takumi House IIII', 8, 14, 14000, 0, 1, 0, 24, 0, 0),
(1762, 0, 0, 0, 0, 0, 'Vilarejo Takumi House V', 8, 16, 17000, 0, 2, 1, 32, 0, 0),
(1763, 0, 0, 0, 0, 0, 'Vilarejo Takumi House VI', 8, 40, 41000, 0, 2, 1, 64, 0, 0),
(1764, 0, 0, 0, 0, 0, 'Vilarejo Takumi House VII', 8, 36, 37000, 0, 3, 1, 65, 0, 0),
(1765, 0, 0, 0, 0, 0, 'Vilarejo Takumi House VIII', 8, 26, 28000, 0, 2, 2, 49, 0, 0),
(1766, 0, 0, 0, 0, 0, 'Vilarejo Takumi House VIIII', 8, 16, 17000, 0, 2, 1, 33, 0, 0),
(1767, 0, 0, 0, 0, 0, 'Vilarejo Takumi House X', 8, 16, 17000, 0, 2, 1, 33, 0, 0),
(1768, 0, 0, 0, 0, 0, 'Vilarejo Takumi House XI', 8, 34, 35000, 0, 2, 1, 57, 0, 0),
(1769, 0, 0, 0, 0, 0, 'Vilarejo Takumi House XII', 8, 38, 40000, 0, 3, 2, 65, 0, 0),
(1770, 0, 0, 0, 0, 0, 'Takumi South House I', 8, 38, 40000, 0, 2, 2, 64, 0, 0),
(1771, 0, 0, 0, 0, 0, 'Takumi North  House I', 8, 28, 29000, 0, 1, 1, 42, 0, 0),
(1772, 0, 0, 0, 0, 0, 'Takumi North  House II', 8, 22, 23000, 0, 1, 1, 35, 0, 0),
(1773, 0, 0, 0, 0, 0, 'Takumi North  House III', 8, 22, 23000, 0, 1, 1, 35, 0, 0),
(1775, 0, 0, 0, 0, 0, 'Takumi North  House IIII', 8, 28, 29000, 0, 1, 1, 42, 0, 0),
(1776, 0, 0, 0, 0, 0, 'Takumi North  House V', 8, 23, 25000, 0, 2, 2, 48, 0, 0),
(1777, 0, 0, 0, 0, 0, 'Takumi North  House VI', 8, 26, 27000, 0, 2, 1, 48, 0, 0),
(1778, 0, 0, 0, 0, 0, 'House Taku', 8, 6, 7000, 0, 1, 1, 16, 0, 0),
(1885, 0, 0, 0, 0, 0, 'Konoha Guild House', 1, 529, 538000, 0, 10, 9, 745, 1, 0),
(1887, 0, 0, 0, 0, 0, 'Suna Gakure Guild House', 2, 472, 480000, 70000, 8, 8, 618, 1, 0),
(1888, 0, 0, 0, 0, 0, 'Depo House Suna I', 2, 23, 24000, 0, 1, 1, 36, 0, 0),
(1889, 0, 0, 0, 0, 0, 'Depo House Suna II', 2, 19, 20000, 0, 1, 1, 30, 0, 0),
(1890, 0, 0, 0, 0, 0, 'Depo House Suna III', 2, 15, 15000, 0, 1, 0, 24, 0, 0),
(1891, 0, 0, 0, 0, 0, 'Depo House Suna IIII', 2, 12, 12000, 0, 1, 0, 20, 0, 0),
(1892, 0, 0, 0, 0, 0, 'Konoha Gakure I', 1, 22, 22000, 0, 1, 0, 38, 0, 0),
(1893, 0, 0, 0, 0, 0, 'Konoha Gakure II', 1, 21, 21000, 0, 1, 0, 36, 0, 0),
(1894, 0, 0, 0, 0, 0, 'Konoha Gakure III', 1, 21, 21000, 0, 1, 0, 36, 0, 0),
(1895, 0, 0, 0, 0, 0, 'Konoha Gakure IIII', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(1896, 0, 0, 0, 0, 0, 'Konoha Gakure V', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(1897, 0, 0, 0, 0, 0, 'Konoha Gakure VI', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(1898, 0, 0, 0, 0, 0, 'Templo House I', 1, 12, 12000, 0, 1, 0, 21, 0, 0),
(1899, 0, 0, 0, 0, 0, 'Templo House II', 1, 13, 14000, 0, 2, 1, 28, 0, 0),
(1901, 0, 0, 0, 0, 0, 'Templo House IIII', 1, 6, 7000, 0, 0, 1, 15, 0, 0),
(1902, 0, 0, 0, 0, 0, 'Templo House V', 1, 12, 13000, 0, 0, 1, 23, 0, 0),
(1904, 0, 0, 0, 0, 0, 'Konoha House II', 1, 14, 15000, 0, 1, 1, 30, 0, 0),
(1909, 0, 0, 0, 0, 0, 'Uchiha House I', 1, 27, 28000, 0, 2, 1, 49, 0, 0),
(1911, 0, 0, 0, 0, 0, 'Uchiha House III', 1, 18, 20000, 0, 3, 2, 42, 0, 0),
(1912, 0, 0, 0, 0, 0, 'Uchiha (SUB) I', 1, 30, 31000, 0, 2, 1, 56, 0, 0),
(1913, 0, 0, 0, 0, 0, 'Uchiha (SUB) II', 1, 30, 31000, 0, 2, 1, 56, 0, 0),
(1914, 0, 0, 0, 0, 0, 'Uchiha (APART) I', 1, 14, 15000, 0, 1, 1, 25, 0, 0),
(1915, 0, 0, 0, 0, 0, 'Uchiha (APART) II', 1, 14, 15000, 0, 1, 1, 25, 0, 0),
(1916, 0, 0, 0, 0, 0, 'Uchiha (APART) III', 1, 6, 7000, 0, 1, 1, 14, 0, 0),
(1917, 0, 0, 0, 0, 0, 'Uchiha (APART) IIII', 1, 6, 7000, 0, 1, 1, 15, 0, 0),
(1918, 0, 0, 0, 0, 0, 'Uchiha CLAN I', 1, 14, 15000, 0, 1, 1, 26, 0, 0),
(1919, 0, 0, 0, 0, 0, 'Uchiha CLAN II', 1, 14, 15000, 0, 1, 1, 26, 0, 0),
(1920, 0, 0, 0, 0, 0, 'Uchiha CLAN III', 1, 6, 7000, 0, 1, 1, 15, 0, 0),
(1921, 0, 0, 0, 0, 0, 'Uchiha CLAN IIII', 1, 6, 7000, 0, 1, 1, 15, 0, 0),
(1922, 0, 0, 0, 0, 0, 'Uchiha SOUTH 2', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(1923, 0, 0, 0, 0, 0, 'Uchiha SOUTH 1', 1, 8, 8000, 0, 1, 0, 16, 0, 0),
(1924, 0, 0, 0, 0, 0, 'Uchiha SOUTH', 1, 6, 7000, 0, 0, 1, 11, 0, 0),
(1925, 0, 0, 0, 0, 0, 'House SOUTH I', 1, 8, 8000, 0, 0, 0, 16, 0, 0),
(1926, 0, 0, 0, 0, 0, 'House SOUTH II', 1, 6, 7000, 0, 0, 1, 16, 0, 0),
(1927, 0, 0, 0, 0, 0, 'House Konoha Gakure I', 1, 12, 13000, 0, 2, 1, 27, 0, 0),
(1928, 0, 0, 0, 0, 0, 'House Konoha Gakure Ii', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(1936, 0, 0, 0, 0, 0, 'DEPO House III', 1, 7, 8000, 0, 1, 1, 16, 0, 0),
(1937, 0, 0, 0, 0, 0, 'DEPO House IIII', 1, 4, 5000, 0, 1, 1, 13, 0, 0),
(1938, 0, 0, 0, 0, 0, 'DEPO House', 1, 10, 11000, 0, 0, 1, 19, 0, 0),
(1939, 0, 0, 0, 0, 0, 'Suna Center House I', 2, 13, 14000, 0, 0, 1, 23, 0, 0),
(1940, 0, 0, 0, 0, 0, 'Suna Center House II', 2, 7, 8000, 0, 0, 1, 16, 0, 0),
(1941, 0, 0, 0, 0, 0, 'Suna Center House III', 2, 18, 18000, 0, 0, 0, 32, 0, 0),
(1942, 0, 0, 0, 0, 0, 'Suna Center House IIII', 2, 7, 8000, 0, 0, 1, 16, 0, 0),
(1943, 0, 0, 0, 0, 0, 'Suna Center House V', 2, 32, 33000, 0, 2, 1, 63, 0, 0),
(1944, 0, 0, 0, 0, 0, 'Suna ( CENTER) I', 2, 56, 58000, 0, 2, 2, 101, 0, 0),
(1945, 0, 0, 0, 0, 0, 'Suna ( NORTH) I', 2, 13, 14000, 0, 1, 1, 24, 0, 0),
(1946, 0, 0, 0, 0, 0, 'Suna ( NORTH) II', 2, 16, 17000, 0, 1, 1, 28, 0, 0),
(1947, 0, 0, 0, 0, 0, 'House Center ( BIG )', 1, 23, 24000, 0, 3, 1, 47, 0, 0),
(1948, 0, 0, 0, 0, 0, 'House Center I', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(1949, 0, 0, 0, 0, 0, 'House Center II', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(1950, 0, 0, 0, 0, 0, 'House Center III', 1, 6, 6000, 0, 1, 0, 12, 0, 0),
(1951, 0, 0, 0, 0, 0, 'House Center IIII', 1, 6, 6000, 0, 1, 0, 12, 0, 0),
(1952, 0, 0, 0, 0, 0, 'Uzumaki House I', 1, 10, 11000, 0, 2, 1, 25, 0, 0),
(1953, 0, 0, 0, 0, 0, 'Uzumaki House II', 1, 4, 5000, 0, 1, 1, 12, 0, 0),
(1954, 0, 0, 0, 0, 0, 'Uzumaki House III', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(1955, 0, 0, 0, 0, 0, 'Uzumaki House IIII', 1, 6, 6000, 0, 1, 0, 12, 0, 0),
(1956, 0, 0, 0, 0, 0, 'Uzumaki ( DEPO ) I', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(1957, 0, 0, 0, 0, 0, 'Uzumaki ( DEPO ) II', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(1958, 0, 0, 0, 0, 0, 'Uzumaki Clan H III', 1, 12, 13000, 0, 1, 1, 24, 0, 0),
(1959, 0, 0, 0, 0, 0, 'Uzumaki ( DEPO ) III', 1, 6, 6000, 0, 1, 0, 12, 0, 0),
(1961, 0, 0, 0, 0, 0, 'Uzumaki ( DEPO ) IIII', 1, 6, 6000, 0, 1, 0, 12, 0, 0),
(1964, 0, 0, 0, 0, 0, 'DEPO House Uzumaki ( NORTH )', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(1965, 0, 0, 0, 0, 0, 'DEPO House Uzumaki II', 1, 8, 8000, 0, 1, 0, 15, 0, 0),
(1966, 0, 0, 0, 0, 0, 'DEPO House Uzumaki III', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(1967, 0, 0, 0, 0, 0, 'Uzumaki Clan H I', 1, 8, 8000, 0, 1, 0, 16, 0, 0),
(1968, 0, 0, 0, 0, 0, 'Uzumaki Clan H II', 1, 6, 7000, 0, 1, 1, 16, 0, 0),
(1970, 0, 0, 0, 0, 0, 'Uzumaki Clan ( SUB ) I', 1, 10, 11000, 0, 0, 1, 21, 0, 0),
(1971, 0, 0, 0, 0, 0, 'Uzumaki Clan ( SUB ) II', 1, 10, 11000, 0, 0, 1, 21, 0, 0),
(1972, 0, 0, 0, 0, 0, 'Uzumaki Clan ( MASTER )', 1, 14, 15000, 0, 2, 1, 30, 0, 0),
(1973, 0, 0, 0, 0, 0, 'Uzumaki Clan ( APART )', 1, 6, 6000, 0, 1, 0, 13, 0, 0),
(1974, 0, 0, 0, 0, 0, ' Clan Uzumaki House I', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(1975, 0, 0, 0, 0, 0, ' Clan Uzumaki House II', 1, 12, 12000, 0, 1, 0, 20, 0, 0),
(1976, 0, 0, 0, 0, 0, ' Clan Uzumaki House III', 1, 10, 11000, 0, 0, 1, 21, 0, 0),
(1977, 0, 0, 0, 0, 0, ' Clan Uzumaki ( MASTER )', 1, 13, 14000, 0, 2, 1, 28, 0, 0),
(1978, 0, 0, 0, 0, 0, ' Clan Uzumaki House ( I )', 1, 13, 14000, 0, 1, 1, 29, 0, 0),
(1980, 0, 0, 0, 0, 0, ' Clan Uzumaki House ( III )', 1, 20, 22000, 0, 2, 2, 42, 0, 0),
(1981, 0, 0, 0, 0, 0, ' Clan Uzumaki House ( MASTER )', 1, 16, 17000, 0, 1, 1, 32, 0, 0),
(1986, 0, 0, 0, 0, 0, 'House Uzumaki ( CENTER ) I', 1, 10, 10000, 0, 1, 0, 18, 0, 0),
(1987, 0, 0, 0, 0, 0, 'House Uzumaki ( CENTER ) II', 1, 13, 14000, 0, 1, 1, 25, 0, 0),
(1988, 0, 0, 0, 0, 0, 'House Uzumaki ( CENTER ) III', 1, 13, 14000, 0, 1, 1, 24, 0, 0),
(1991, 0, 0, 0, 0, 0, 'House Uzumaki ( SUB ) I', 1, 14, 14000, 0, 2, 0, 27, 0, 0),
(1992, 0, 0, 0, 0, 0, 'House Uzumaki ( SUB ) II', 1, 19, 20000, 0, 2, 1, 36, 0, 0),
(1993, 0, 0, 0, 0, 0, 'House Uzumaki ( SUB ) III', 1, 13, 14000, 0, 1, 1, 28, 0, 0),
(1994, 0, 0, 0, 0, 0, 'House Uzumaki ( SUPER H )', 1, 28, 29000, 0, 3, 1, 54, 0, 0),
(1995, 0, 0, 0, 0, 0, 'House Uzumaki ( SUPER H ) I', 1, 19, 20000, 0, 2, 1, 38, 0, 0),
(1996, 0, 0, 0, 0, 0, 'House Center ( DEPO ) I', 1, 13, 14000, 0, 2, 1, 28, 0, 0),
(1997, 0, 0, 0, 0, 0, 'House Center ( DEPO ) II', 1, 12, 12000, 0, 1, 0, 22, 0, 0),
(1998, 0, 0, 0, 0, 0, 'House Center ( DEPO ) III', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(1999, 0, 0, 0, 0, 0, ' House Center ( DEPO ) IIII', 1, 8, 8000, 0, 1, 0, 15, 0, 0),
(2000, 0, 0, 0, 0, 0, 'House Center ( NORTH ) I', 1, 13, 14000, 0, 2, 1, 29, 0, 0),
(2002, 0, 0, 0, 0, 0, 'House Center ( NORTH ) III', 1, 13, 14000, 0, 2, 1, 28, 0, 0),
(2003, 0, 0, 0, 0, 0, 'House Center ( NORTH ) IIII', 1, 8, 9000, 0, 2, 1, 21, 0, 0),
(2004, 0, 0, 0, 0, 0, 'House Center ( UP ) I', 1, 14, 15000, 0, 1, 1, 30, 0, 0),
(2005, 0, 0, 0, 0, 0, 'House Center ( UP ) II', 1, 14, 15000, 0, 1, 1, 30, 0, 0),
(2006, 0, 0, 0, 0, 0, 'House ( TEMPLE ) I', 1, 22, 23000, 0, 1, 1, 39, 0, 0),
(2007, 0, 0, 0, 0, 0, 'House ( TEMPLE ) II', 1, 22, 23000, 0, 1, 1, 40, 0, 0),
(2008, 0, 0, 0, 0, 0, ' House Konoha I', 1, 10, 11000, 0, 1, 1, 21, 0, 0),
(2009, 0, 0, 0, 0, 0, ' House Konoha II', 1, 14, 15000, 0, 1, 1, 26, 0, 0),
(2010, 0, 0, 0, 0, 0, ' House Konoha ( BIG )', 1, 16, 18000, 0, 2, 2, 35, 0, 0),
(2013, 0, 0, 0, 0, 0, ' House NORTH III', 1, 6, 7000, 0, 1, 1, 15, 0, 0),
(2015, 0, 0, 0, 0, 0, ' House ( APART ) I', 1, 10, 11000, 0, 2, 1, 24, 0, 0),
(2017, 0, 0, 0, 0, 0, 'House ( Gakure ) I', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(2018, 0, 0, 0, 0, 0, 'House ( Gakure ) II', 1, 8, 8000, 0, 1, 0, 16, 0, 0),
(2019, 0, 0, 0, 0, 0, 'House ( Gakure ) III', 1, 8, 8000, 0, 1, 0, 16, 0, 0),
(2020, 0, 0, 0, 0, 0, 'House ( Gakure ) IIII', 1, 10, 11000, 0, 1, 1, 20, 0, 0),
(2021, 0, 0, 0, 0, 0, 'House ( UP ) I', 1, 14, 15000, 0, 1, 1, 25, 0, 0),
(2022, 0, 0, 0, 0, 0, 'House ( UP ) II', 1, 12, 13000, 0, 2, 1, 27, 0, 0),
(2023, 0, 0, 0, 0, 0, 'Amegakure House ( DEPO ) I', 4, 22, 23000, 0, 2, 1, 43, 0, 0),
(2024, 0, 0, 0, 0, 0, 'Amegakure House I', 4, 13, 14000, 0, 1, 1, 25, 0, 0),
(2025, 0, 0, 0, 0, 0, 'Amegakure House II', 4, 14, 14000, 0, 1, 0, 24, 0, 0),
(2026, 0, 0, 0, 0, 0, 'Amegakure House III', 4, 22, 23000, 0, 2, 1, 42, 0, 0),
(2027, 0, 0, 0, 0, 0, 'Amegakure House ( DEPO ) II', 4, 22, 23000, 0, 2, 1, 40, 0, 0),
(2028, 0, 0, 0, 0, 0, 'Amegakure House ( DEPO ) III', 4, 15, 15000, 0, 1, 0, 25, 0, 0),
(2029, 0, 0, 0, 0, 0, 'Amegakure House ( DEPO ) IIII', 4, 15, 15000, 0, 1, 0, 24, 0, 0),
(2030, 0, 0, 0, 0, 0, 'House ( DEPO) I', 4, 24, 24000, 0, 2, 0, 41, 0, 0),
(2031, 0, 0, 0, 0, 0, 'House ( DEPO) II', 4, 18, 19000, 0, 1, 1, 30, 0, 0),
(2032, 0, 0, 0, 0, 0, 'House ( DEPO) III', 4, 19, 20000, 0, 1, 1, 32, 0, 0),
(2033, 0, 0, 0, 0, 0, 'House BIG ( DEPO)', 4, 25, 27000, 0, 2, 2, 48, 0, 0),
(2034, 0, 0, 0, 0, 0, 'House BIG ( DEPO) I', 4, 38, 39000, 0, 1, 1, 61, 0, 0),
(2036, 0, 0, 0, 0, 0, 'House BIG ( DEPO) II', 4, 38, 39000, 0, 1, 1, 61, 0, 0),
(2037, 0, 0, 0, 0, 0, 'House BIG ( DEPO) III', 4, 31, 31000, 0, 2, 0, 50, 0, 0),
(2038, 0, 0, 0, 0, 0, 'Amegakure House ( SOUTH ) I', 4, 26, 27000, 0, 1, 1, 41, 0, 0),
(2039, 0, 0, 0, 0, 0, 'Amegakure House ( SOUTH ) II', 4, 34, 35000, 0, 3, 1, 65, 0, 0),
(2040, 0, 0, 0, 0, 0, 'Amegakure House ( SOUTH ) III', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2041, 0, 0, 0, 0, 0, 'Amegakure House ( SOUTH ) IIII', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2042, 0, 0, 0, 0, 0, 'House ( APART ) I', 4, 20, 20000, 0, 1, 0, 30, 0, 0),
(2043, 0, 0, 0, 0, 0, 'House ( APART ) II', 4, 20, 20000, 0, 1, 0, 30, 0, 0),
(2044, 0, 0, 0, 0, 0, 'House ( APART ) III', 4, 6, 6000, 0, 1, 0, 12, 0, 0),
(2045, 0, 0, 0, 0, 0, 'House ( APART ) IIII', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2046, 0, 0, 0, 0, 0, 'House ( APART ) V', 4, 14, 15000, 0, 1, 1, 26, 0, 0),
(2047, 0, 0, 0, 0, 0, 'No Sato House I', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2048, 0, 0, 0, 0, 0, 'No Sato House II', 4, 16, 16000, 0, 1, 0, 25, 0, 0),
(2049, 0, 0, 0, 0, 0, 'No Sato House III', 4, 16, 16000, 0, 1, 0, 26, 0, 0),
(2050, 0, 0, 0, 0, 0, 'No Sato House IIII', 4, 12, 12000, 0, 1, 0, 20, 0, 0),
(2051, 0, 0, 0, 0, 0, 'No Sato House V', 4, 9, 9000, 0, 1, 0, 17, 0, 0),
(2052, 0, 0, 0, 0, 0, 'No Sato House VI', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2053, 0, 0, 0, 0, 0, 'No Sato ( APART ) I', 4, 16, 16000, 0, 1, 0, 25, 0, 0),
(2054, 0, 0, 0, 0, 0, 'No Sato ( APART ) II', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2056, 0, 0, 0, 0, 0, 'No Sato ( APART ) III', 4, 20, 20000, 0, 1, 0, 32, 0, 0),
(2057, 0, 0, 0, 0, 0, 'No Sato ( APART ) IIII', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2058, 0, 0, 0, 0, 0, 'No Sato ( APART ) V', 4, 16, 16000, 0, 1, 0, 25, 0, 0),
(2059, 0, 0, 0, 0, 0, 'No Sato ( APART ) VI', 4, 12, 12000, 0, 1, 0, 21, 0, 0),
(2060, 0, 0, 0, 0, 0, 'No Sato ( APART ) VII', 4, 18, 19000, 0, 1, 1, 31, 0, 0),
(2061, 0, 0, 0, 0, 0, 'No Sato ( APART ) VIII', 4, 14, 15000, 0, 1, 1, 25, 0, 0),
(2063, 0, 0, 0, 0, 0, 'No Sato ( APART ) VIIII', 4, 16, 16000, 0, 1, 0, 25, 0, 0),
(2065, 0, 0, 0, 0, 0, 'No Sato ( APART ) X', 4, 12, 12000, 0, 1, 0, 20, 0, 0),
(2066, 0, 0, 0, 0, 0, 'No Sato ( BIG ) I', 4, 15, 15000, 0, 2, 0, 28, 0, 0),
(2067, 0, 0, 0, 0, 0, 'No Sato ( BIG ) II', 4, 20, 20000, 0, 2, 0, 35, 0, 0),
(2068, 0, 0, 0, 0, 0, 'No Sato ( BIG ) III', 4, 16, 16000, 0, 2, 0, 28, 0, 0),
(2069, 0, 0, 0, 0, 0, 'No Sato ( MINI ) I', 4, 6, 6000, 0, 1, 0, 12, 0, 0),
(2070, 0, 0, 0, 0, 0, 'No Sato ( MINI ) II', 4, 9, 9000, 0, 1, 0, 16, 0, 0),
(2071, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) I', 4, 8, 8000, 0, 1, 0, 16, 0, 0),
(2072, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) II', 4, 6, 6000, 0, 1, 0, 13, 0, 0),
(2073, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) III', 4, 6, 6000, 0, 1, 0, 13, 0, 0),
(2074, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) IIII', 4, 6, 6000, 0, 1, 0, 13, 0, 0),
(2075, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) V', 4, 13, 14000, 0, 1, 1, 24, 0, 0),
(2076, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) VI', 4, 14, 15000, 0, 1, 1, 26, 0, 0),
(2077, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) VII', 4, 13, 14000, 0, 1, 1, 24, 0, 0),
(2078, 0, 0, 0, 0, 0, 'House No Sato  ( APART ) VIII', 4, 14, 15000, 0, 1, 1, 26, 0, 0),
(2079, 0, 0, 0, 0, 0, 'House No Sato  ( BIG ) I', 4, 32, 33000, 0, 2, 1, 57, 0, 0),
(2080, 0, 0, 0, 0, 0, 'House No Sato  ( BIG ) II', 4, 26, 28000, 0, 2, 2, 48, 0, 0),
(2081, 0, 0, 0, 0, 0, 'House No Sato I', 4, 15, 15000, 0, 0, 0, 23, 0, 0),
(2082, 0, 0, 0, 0, 0, 'House No Sato II', 4, 18, 18000, 0, 1, 0, 28, 0, 0),
(2083, 0, 0, 0, 0, 0, 'House No Sato III', 4, 20, 21000, 0, 2, 1, 40, 0, 0),
(2084, 0, 0, 0, 0, 0, 'House No Sato IIII', 4, 15, 16000, 0, 1, 1, 28, 0, 0),
(2085, 0, 0, 0, 0, 0, 'House No Sato V', 4, 8, 8000, 0, 1, 0, 16, 0, 0),
(2086, 0, 0, 0, 0, 0, 'House No Sato VI', 4, 8, 8000, 0, 1, 0, 16, 0, 0),
(2087, 0, 0, 0, 0, 0, 'House ( SATO ) I', 4, 22, 23000, 0, 1, 1, 40, 0, 0),
(2088, 0, 0, 0, 0, 0, 'House ( SATO ) II', 4, 22, 23000, 0, 1, 1, 40, 0, 0),
(2089, 0, 0, 0, 0, 0, 'House BIG ( SATO )', 4, 22, 23000, 0, 2, 1, 40, 0, 0),
(2090, 0, 0, 0, 0, 0, 'House ( SATO ) III', 4, 21, 21000, 0, 1, 0, 31, 0, 0),
(2091, 0, 0, 0, 0, 0, 'House ( SATO ) IIII', 4, 19, 19000, 0, 1, 0, 33, 0, 0),
(2092, 0, 0, 0, 0, 0, 'House ( COPIE ) I', 4, 22, 23000, 0, 1, 1, 43, 0, 0),
(2093, 0, 0, 0, 0, 0, 'House ( COPIE ) II', 4, 22, 23000, 0, 1, 1, 42, 0, 0),
(2094, 0, 0, 0, 0, 0, 'House CENTER ( COPIE ) ', 4, 35, 37000, 0, 1, 2, 60, 0, 0),
(2095, 0, 0, 0, 0, 0, 'Yukigakure no Sato I', 11, 27, 28000, 0, 2, 1, 45, 0, 0),
(2096, 0, 0, 0, 0, 0, 'Yukigakure no Sato II', 11, 19, 20000, 0, 1, 1, 30, 0, 0),
(2097, 0, 0, 0, 0, 0, 'Yukigakure no Sato III', 11, 28, 29000, 0, 1, 1, 49, 0, 0),
(2098, 0, 0, 0, 0, 0, 'Yukigakure no Sato IIII', 11, 28, 29000, 0, 0, 1, 49, 0, 0),
(2099, 0, 0, 0, 0, 0, 'Yukigakure no Sato V', 11, 22, 23000, 0, 1, 1, 36, 0, 0),
(2100, 0, 0, 0, 0, 0, 'Yukigakure no Sato VI', 11, 28, 29000, 0, 1, 1, 43, 0, 0),
(2101, 0, 0, 0, 0, 0, 'Yukigakure no Sato VII', 11, 27, 29000, 0, 1, 2, 42, 0, 0),
(2102, 0, 0, 0, 0, 0, 'Yukigakure ( HOUSE ) I', 11, 10, 10000, 0, 1, 0, 17, 0, 0),
(2103, 0, 0, 0, 0, 0, 'Yukigakure ( HOUSE ) II', 11, 10, 10000, 0, 1, 0, 17, 0, 0),
(2104, 0, 0, 0, 0, 0, 'Yukigakure ( HOUSE ) III', 11, 10, 10000, 0, 1, 0, 17, 0, 0),
(2105, 0, 0, 0, 0, 0, 'Yukigakure House ( DEPO ) I', 11, 22, 23000, 0, 1, 1, 41, 0, 0),
(2106, 0, 0, 0, 0, 0, 'Yukigakure House ( DEPO ) II', 11, 14, 15000, 0, 1, 1, 24, 0, 0),
(2107, 0, 0, 0, 0, 0, 'Yukigakure House ( DEPO ) III', 11, 23, 24000, 0, 0, 1, 42, 0, 0),
(2108, 0, 0, 0, 0, 0, 'Yukigakure House ( DEPO ) IIII', 11, 12, 12000, 0, 1, 0, 20, 0, 0),
(2109, 0, 0, 0, 0, 0, 'Yukigakure House ( DEPO ) V', 11, 12, 12000, 0, 1, 0, 20, 0, 0),
(2112, 0, 0, 0, 0, 0, 'Yukigakure House ( DEPO ) VI', 11, 16, 17000, 0, 1, 1, 28, 0, 0),
(2113, 0, 0, 0, 0, 0, 'Yukigakure House ( DEPO ) VII', 11, 18, 18000, 0, 1, 0, 28, 0, 0),
(2114, 0, 0, 0, 0, 0, 'Yukigakure House ( SATO ) I', 11, 22, 23000, 0, 1, 1, 34, 0, 0),
(2115, 0, 0, 0, 0, 0, 'Yukigakure House ( SATO ) II', 11, 16, 17000, 0, 1, 1, 28, 0, 0),
(2116, 0, 0, 0, 0, 0, 'Yukigakure House ( SATO ) III', 11, 20, 20000, 0, 1, 0, 31, 0, 0),
(2117, 0, 0, 0, 0, 0, 'Yukigakure House ( SATO ) IIII', 11, 22, 23000, 0, 0, 1, 35, 0, 0),
(2118, 0, 0, 0, 0, 0, 'Yukigakure House ( SATO ) V', 11, 12, 12000, 0, 1, 0, 20, 0, 0),
(2119, 0, 0, 0, 0, 0, 'Yukigakure House ( SATO ) VI', 11, 14, 15000, 0, 1, 1, 25, 0, 0),
(2132, 0, 0, 0, 0, 0, 'Suna Imperio House I', 2, 22, 24000, 0, 1, 2, 36, 0, 0),
(2133, 0, 0, 0, 0, 0, 'Suna Imperio House II', 2, 27, 28000, 0, 1, 1, 40, 0, 0),
(2138, 0, 0, 0, 0, 0, 'House [CENTER I]', 1, 14, 15000, 0, 2, 1, 31, 0, 0),
(2139, 0, 0, 0, 0, 0, 'House [CENTER II]', 1, 12, 13000, 0, 1, 1, 24, 0, 0),
(2140, 0, 0, 0, 0, 0, 'House [CENTER III]', 1, 27, 28000, 0, 1, 1, 50, 0, 0),
(2141, 0, 0, 0, 0, 0, 'House [CENTER IIII]', 1, 30, 31000, 0, 1, 1, 50, 0, 0),
(2142, 0, 0, 0, 0, 0, 'Takumi House ATM I', 8, 11, 12000, 0, 1, 1, 23, 0, 0),
(2143, 0, 0, 0, 0, 0, 'Takumi House ATM II', 8, 10, 11000, 0, 1, 1, 22, 0, 0),
(2144, 0, 0, 0, 0, 0, 'Takumi House ATM III', 8, 15, 16000, 0, 1, 1, 29, 0, 0),
(2145, 0, 0, 0, 0, 0, 'Takumi House ATM IIII', 8, 9, 10000, 0, 1, 1, 21, 0, 0),
(2146, 0, 0, 0, 0, 0, 'Takumi House ATM V', 8, 13, 14000, 0, 1, 1, 24, 0, 0),
(2147, 0, 0, 0, 0, 0, 'Uzumaki [PRINCE] House', 1, 25, 26000, 0, 2, 1, 47, 0, 0),
(2148, 0, 0, 0, 0, 0, 'Hoshigakure House I', 10, 18, 19000, 0, 2, 1, 33, 0, 0),
(2149, 0, 0, 0, 0, 0, 'Hoshigakure House II', 10, 17, 18000, 0, 2, 1, 33, 0, 0),
(2150, 0, 0, 0, 0, 0, 'Hoshigakure House III', 10, 18, 19000, 0, 2, 1, 33, 0, 0),
(2151, 0, 0, 0, 0, 0, 'Hoshigakure House IIII', 10, 17, 18000, 0, 1, 1, 33, 0, 0),
(2152, 0, 0, 0, 0, 0, 'Hoshigakure House V', 10, 18, 19000, 0, 2, 1, 33, 0, 0),
(2153, 0, 0, 0, 0, 0, 'Hoshigakure House VI', 10, 17, 18000, 0, 1, 1, 33, 0, 0),
(2154, 0, 0, 0, 0, 0, 'Hoshigakure House [PRINCE] I', 10, 51, 52000, 0, 1, 1, 77, 0, 0),
(2155, 0, 0, 0, 0, 0, 'Hoshigakure House [PRINCE] II', 10, 50, 51000, 0, 0, 1, 77, 0, 0),
(2156, 0, 0, 0, 0, 0, 'Hoshigakure [CENTER] I', 10, 16, 17000, 0, 1, 1, 30, 0, 0),
(2157, 0, 0, 0, 0, 0, 'Hoshigakure [CENTER] II', 10, 12, 13000, 0, 1, 1, 27, 0, 0),
(2158, 0, 0, 0, 0, 0, 'Hoshigakure [CENTER] III', 10, 16, 17000, 0, 1, 1, 30, 0, 0),
(2159, 0, 0, 0, 0, 0, 'Hoshigakure [CENTER] IIII', 10, 12, 13000, 0, 1, 1, 27, 0, 0),
(2160, 0, 0, 0, 0, 0, 'Hoshigakure [CENTER] V', 10, 16, 17000, 0, 2, 1, 30, 0, 0),
(2161, 0, 0, 0, 0, 0, 'Hoshigakure [CENTER] VI', 10, 12, 13000, 0, 1, 1, 27, 0, 0),
(2162, 0, 0, 0, 0, 0, 'Hoshigakure [EASTH] I', 10, 30, 31000, 0, 1, 1, 51, 0, 0),
(2163, 0, 0, 0, 0, 0, 'Hoshigakure [EASTH] II', 10, 12, 12000, 0, 1, 0, 21, 0, 0),
(2164, 0, 0, 0, 0, 0, 'Hoshigakure [EASTH] III', 10, 18, 18000, 0, 1, 0, 33, 0, 0),
(2165, 0, 0, 0, 0, 0, 'Konoha North House', 1, 14, 15000, 0, 1, 1, 25, 0, 0),
(2167, 0, 0, 0, 0, 0, 'Takigakure House I', 12, 47, 49000, 0, 2, 2, 85, 0, 0),
(2168, 0, 0, 0, 0, 0, 'Takigakure House II', 12, 63, 66000, 0, 2, 3, 112, 0, 0),
(2169, 0, 0, 0, 0, 0, 'Takigakure House III', 12, 26, 27000, 0, 1, 1, 44, 0, 0),
(2171, 0, 0, 0, 0, 0, 'Takigakure House V', 12, 46, 48000, 0, 2, 2, 78, 0, 0),
(2172, 0, 0, 0, 0, 0, 'Takigakure House VI', 12, 13, 14000, 0, 1, 1, 25, 0, 0),
(2173, 0, 0, 0, 0, 0, 'Takigakure House VII', 12, 17, 18000, 0, 1, 1, 29, 0, 0),
(2174, 0, 0, 0, 0, 0, 'Takigakure Hotel I', 12, 29, 30000, 0, 1, 1, 48, 0, 0),
(2175, 0, 0, 0, 0, 0, 'Takigakure Hotel II', 12, 28, 29000, 0, 0, 1, 48, 0, 0),
(2176, 0, 0, 0, 0, 0, 'Takigakure MassHouse I', 12, 66, 67000, 0, 2, 1, 101, 0, 0),
(2177, 0, 0, 0, 0, 0, 'Takigakure MassHouse II', 12, 66, 67000, 0, 2, 1, 101, 0, 0),
(2178, 0, 0, 0, 0, 0, 'Takigakure MassHouse III', 12, 66, 67000, 0, 2, 1, 101, 0, 0),
(2179, 0, 0, 0, 0, 0, 'Takigakure MiniHotel', 12, 13, 14000, 0, 0, 1, 25, 0, 0),
(2180, 0, 0, 0, 0, 0, 'Takigakure MiniHotel I', 12, 40, 42000, 0, 0, 2, 71, 0, 0),
(2181, 0, 0, 0, 0, 0, 'Takigakure Shef-Hotel', 12, 16, 17000, 0, 1, 1, 29, 0, 0),
(2182, 0, 0, 0, 0, 0, 'Takigakure Shef-Hotel I', 12, 16, 17000, 0, 1, 1, 29, 0, 0),
(2183, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure I', 12, 10, 11000, 0, 1, 1, 20, 0, 0),
(2184, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure II', 12, 10, 11000, 0, 1, 1, 20, 0, 0),
(2185, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure III', 12, 8, 8000, 0, 1, 0, 15, 0, 0),
(2186, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure IIII', 12, 14, 15000, 0, 0, 1, 25, 0, 0),
(2187, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure V', 12, 14, 15000, 0, 0, 1, 25, 0, 0),
(2188, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure VI', 12, 10, 11000, 0, 0, 1, 20, 0, 0),
(2189, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure VII', 12, 14, 15000, 0, 0, 1, 25, 0, 0),
(2190, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure VIII', 12, 14, 15000, 0, 0, 1, 25, 0, 0),
(2191, 0, 0, 0, 0, 0, 'Grand Hotel Takigakure VIIII', 12, 10, 11000, 0, 0, 1, 20, 0, 0),
(2192, 0, 0, 0, 0, 0, 'Grand House Takigakure', 12, 42, 43000, 0, 2, 1, 69, 0, 0),
(2193, 0, 0, 0, 0, 0, 'Steel House Takigakure I', 12, 40, 41000, 0, 1, 1, 64, 0, 0),
(2194, 0, 0, 0, 0, 0, 'Steel House Takigakure II', 12, 40, 41000, 0, 1, 1, 64, 0, 0),
(2195, 0, 0, 0, 0, 0, 'Steel House Takigakure III', 12, 40, 41000, 0, 0, 1, 64, 0, 0),
(2196, 0, 0, 0, 0, 0, 'Steel House Takigakure IIII', 12, 16, 17000, 0, 0, 1, 29, 0, 0),
(2197, 0, 0, 0, 0, 0, 'Steel House Takigakure V', 12, 34, 35000, 0, 0, 1, 57, 0, 0),
(2198, 0, 0, 0, 0, 0, 'Steel House Takigakure VI', 12, 16, 17000, 0, 0, 1, 29, 0, 0),
(2199, 0, 0, 0, 0, 0, 'Lost House Taki ', 12, 24, 24000, 0, 1, 0, 40, 0, 0),
(2200, 0, 0, 0, 0, 0, 'Lost House Taki I', 12, 24, 24000, 0, 1, 0, 40, 0, 0),
(2201, 0, 0, 0, 0, 0, 'Lost House Taki II', 12, 24, 24000, 0, 1, 0, 40, 0, 0),
(2202, 0, 0, 0, 0, 0, 'Teen  House Taki', 12, 16, 17000, 0, 1, 1, 28, 0, 0),
(2203, 0, 0, 0, 0, 0, 'Teen  House Taki I', 12, 42, 43000, 0, 1, 1, 66, 0, 0),
(2204, 0, 0, 0, 0, 0, 'Teen  House Taki II', 12, 10, 11000, 0, 1, 1, 21, 0, 0),
(2205, 0, 0, 0, 0, 0, 'Teen  House Taki III', 12, 10, 11000, 0, 1, 1, 21, 0, 0),
(2206, 0, 0, 0, 0, 0, 'Teen  House Taki IIII', 12, 10, 11000, 0, 1, 1, 21, 0, 0),
(2207, 0, 0, 0, 0, 0, 'Teen  House Taki V', 12, 10, 11000, 0, 1, 1, 21, 0, 0),
(2208, 0, 0, 0, 0, 0, 'Teen  House Taki VI', 12, 10, 11000, 0, 1, 1, 22, 0, 0),
(2209, 0, 0, 0, 0, 0, 'Takigakure Ancient House ', 12, 29, 30000, 0, 0, 1, 51, 0, 0),
(2210, 0, 0, 0, 0, 0, 'Takigakure Ancient House I', 12, 67, 69000, 0, 1, 2, 108, 0, 0),
(2211, 0, 0, 0, 0, 0, 'Takigakure Ancient House II', 12, 24, 25000, 0, 2, 1, 42, 0, 0),
(2212, 0, 0, 0, 0, 0, 'Takigakure Ancient I', 12, 6, 7000, 0, 0, 1, 15, 0, 0),
(2213, 0, 0, 0, 0, 0, 'Takigakure Ancient House III', 12, 30, 32000, 0, 2, 2, 55, 0, 0),
(2214, 0, 0, 0, 0, 0, ' Ancient Taki MassHotel I', 12, 14, 15000, 0, 0, 1, 25, 0, 0),
(2215, 0, 0, 0, 0, 0, ' Ancient Taki MassHotel II', 12, 32, 34000, 0, 2, 2, 56, 0, 0),
(2216, 0, 0, 0, 0, 0, ' Ancient Taki MassHotel III', 12, 7, 8000, 0, 0, 1, 16, 0, 0),
(2217, 0, 0, 0, 0, 0, ' Ancient Taki MassHotel IIII', 12, 7, 8000, 0, 0, 1, 16, 0, 0),
(2218, 0, 0, 0, 0, 0, 'Depo House I', 1, 17, 19000, 0, 2, 2, 41, 0, 0),
(2219, 0, 0, 0, 0, 0, 'Depo House II', 1, 14, 15000, 0, 2, 1, 30, 0, 0),
(2222, 0, 0, 0, 0, 0, 'House Confection', 1, 10, 11000, 0, 1, 1, 20, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `house_auctions`
--

CREATE TABLE `house_auctions` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `limit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `endtime` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `house_data`
--

CREATE TABLE `house_data` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `house_data`
--

INSERT INTO `house_data` (`house_id`, `world_id`, `data`, `serial`) VALUES
(1, 0, 0x250421040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00250422040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002704210407010000008e07002b0422040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002704250407010000002a198001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(2, 0, 0x250417040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00250418040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0027041b0407010000002a198001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002b0418040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(3, 0, 0x25040d040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0025040e040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002b040e040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e002704110407010000002a198001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00, ''),
(9, 0, 0x250403040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00250404040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002704070407010000002a198001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002b0404040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027466c6174202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(10, 0, 0x320402040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00320403040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00340405040701000000bc048001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e003504050407010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e00, ''),
(11, 0, 0x31040d040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0031040e040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0037040e0407010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037323030303020676f6c6420636f696e732e003204100407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037323030303020676f6c6420636f696e732e00340410040701000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037323030303020676f6c6420636f696e732e00, ''),
(12, 0, 0x310417040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003604160407010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139333530303020676f6c6420636f696e732e00310418040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003704180406010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139333530303020676f6c6420636f696e732e0037041b0406010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139333530303020676f6c6420636f696e732e00360419040701000000200a80010007006465706f74696402010000001700000000003704180407010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139333530303020676f6c6420636f696e732e0037041b0407010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139333530303020676f6c6420636f696e732e0032041c040601000000bc048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139333530303020676f6c6420636f696e732e0035041c0406010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139333530303020676f6c6420636f696e732e00, ''),
(13, 0, 0xde03f20307010000001e0a80010007006465706f7469640201000000170000000000de03fb0307010000001e0a80010007006465706f7469640201000000170000000000ed03f50305010000001e0a80010007006465706f7469640201000000170000000000ed03f50306010000001e0a80010007006465706f7469640201000000170000000000de03040407010000001e0a80010007006465706f7469640201000000170000000000de030d0407010000001e0a80010007006465706f7469640201000000170000000000de03160407010000001e0a80010007006465706f74696402010000001700000000003c0417040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003c041a0405010000001e0a80010007006465706f74696402010000001700000000003c0418040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003c041a0406010000001e0a80010007006465706f74696402010000001700000000003f041b0407010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e003e041c0406010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00400417040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00400418040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0040041c040601000000bc048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00, ''),
(14, 0, 0x25040d040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0025040e040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002b040e040601000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002904110406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002a04100406010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(15, 0, 0x250403040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002604020406010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002804020406010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00250404040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002704070406010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002a04060406010000002b198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002b0404040601000000b9048001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(16, 0, 0x30040e0406010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363530303020676f6c6420636f696e732e0031040d040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0031040e040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0034040c0406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363530303020676f6c6420636f696e732e00320410040601000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363530303020676f6c6420636f696e732e003404100406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363530303020676f6c6420636f696e732e00, ''),
(17, 0, 0x250417040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002904160406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00250418040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0026041b0406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e0029041b0406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002a041a0406010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002b0418040601000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(18, 0, 0x250421040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00250422040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e002904200406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002b0422040601000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002904250406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e002a04240406010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(19, 0, 0x3d0403040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003c04050407010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003d0404040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003e04070407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003f0407040701000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e00, ''),
(20, 0, 0x3d040f040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003e040c0407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003f040c040701000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003d0410040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003e04110407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e00, ''),
(21, 0, 0x3d0403040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003d0404040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003e04070406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003f0407040601000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e00, ''),
(22, 0, 0x3c040f0406010000002b198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003e040c0406010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003f040c040601000000bc048001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003e04110406010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e0040040f040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00400410040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(23, 0, 0x3c040404050100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003c04060405010000001a07003e04070405010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003f0407040501000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e00400403040501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00400404040501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(24, 0, 0x3c040f04050100000029198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003f040c040501000000bc048001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003f04110405010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e0040040f040501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00400410040501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(25, 0, 0x33040e040501000000b9048001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313530303020676f6c6420636f696e732e0036040d040501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0036040e040501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0037040e04050100000029198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313530303020676f6c6420636f696e732e003504100405010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313530303020676f6c6420636f696e732e00, ''),
(26, 0, 0x360417040501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0030041a0405010000001a0700360418040501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0037041804050100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203132313530303020676f6c6420636f696e732e0037041a04050100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203132313530303020676f6c6420636f696e732e0032041c040501000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203132313530303020676f6c6420636f696e732e0034041c0405010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203132313530303020676f6c6420636f696e732e00, ''),
(27, 0, 0x3c0417040501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003b041804050100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393030303020676f6c6420636f696e732e003b041a04050100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393030303020676f6c6420636f696e732e003c0418040501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003f041c0405010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393030303020676f6c6420636f696e732e0040041c040501000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393030303020676f6c6420636f696e732e00, ''),
(28, 0, 0x0d04f5030701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e000e04f5030701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e001304f2030701000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133393530303020676f6c6420636f696e732e00, ''),
(29, 0, 0xfb03f10306100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f0700fb03f10307100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f0700fc03f10306010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e00fd03f10306100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f0700fe03f10307100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f0700ff03f00307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e00fa03f40306010000002b1900fb03f6030701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00fc03f70306010000002a1900fc03f6030701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e000004f0030701000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e000204f10307100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07000304f10307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e000404f10306100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07000604f10306100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07000504f10307100000003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07003f07000604f30307010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e000004f70306010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e000004f70307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e000504f70306010000002a19000604f50306010000002b19000604f60307010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e00, ''),
(30, 0, 0xed03f1030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00ed03f2030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f003f3030701000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e00, ''),
(31, 0, 0xec0309040701000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00f003070407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00f2030b040701000000e0068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f3030b040701000000e1068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f4030a0407010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00f0030c0407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00, ''),
(32, 0, 0xec03fd0307010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00ec03fe030701000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00f203fd030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f203fe030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f003020407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00, ''),
(33, 0, 0x1b04e3030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e001b04e4030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e001d04e7030701000000bc048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e002104e60307010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e002304e40307010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00, ''),
(34, 0, 0x0f04e3030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e000f04e4030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e001104e7030701000000bc048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e001504e60307010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e001704e40307010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00, ''),
(35, 0, 0x0304e3030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e000604e20307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e000804e20307100000005107005107005107005107005107005107005107005107005107005107005107005107005107005107005107005107000204e40307010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e000304e4030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e000504e7030701000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e000804e60307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e000b04e40307010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00, ''),
(36, 0, 0xf703e3030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00fa03e20307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00fc03e2030710000000510700510700510700510700510700510700510700510700510700510700510700510700510700510700510700510700f703e4030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f903e7030701000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00fc03e60307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00ff03e40307010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e00, ''),
(37, 0, 0xec03e6030701000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00ec03e803070100000029198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00f303e3030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f303e4030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f003e90307010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00, ''),
(38, 0, 0xdd03e3030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00dd03e4030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e303e403070100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e303e6030701000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e003e90307010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e303e803070100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00, ''),
(39, 0, 0xec03e6030601000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00ec03e803060100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00f303e3030601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f303e4030601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f003e90306010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00, ''),
(40, 0, 0xdd03e3030601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00dd03e4030601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e303e403060100000029198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e303e6030601000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e003e90306010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e303e803060100000029198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00, ''),
(41, 0, 0xec03e6030501000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00ec03e803050100000029198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00f303e3030501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f303e4030501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f003e90305010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e00, ''),
(42, 0, 0xdd03e3030501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00dd03e4030501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e303e403050100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e303e6030501000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e003e90305010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00e303e803050100000029198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e00, ''),
(43, 0, 0xed03f1030601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00ed03f2030601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f003f3030601000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e00, ''),
(44, 0, 0xde03ef030601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00df03ee0306010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00e103ee0306010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00de03f0030601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e003f30306010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00e303f20306010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00e403f0030601000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343530303020676f6c6420636f696e732e00, ''),
(45, 0, 0xdf03f60306010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00de03f8030601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00de03f9030601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e103f60306010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e303fb0306010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e403f9030601000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e003fc0306010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00, ''),
(46, 0, 0xdf03ff0306020000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e103ff0306020000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00de0301040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00de0302040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e40302040601000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e003050406010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e303040406010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00, ''),
(47, 0, 0xde030a040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00de030b040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00df03080406010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e103080406010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e4030b040601000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e0030e0406010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e3030d0406010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00, ''),
(48, 0, 0xde0313040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00df03110406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00de0314040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e103110406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e003170406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e303160406010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00e40314040601000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e00, ''),
(49, 0, 0xde0313040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00dd03150407010000002b198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00de0314040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e003170407010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00e40314040701000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00, '');
INSERT INTO `house_data` (`house_id`, `world_id`, `data`, `serial`) VALUES
(50, 0, 0xde030a040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00de030b040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00dd030c0407010000002b198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00e4030b040701000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00e0030e0407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00, ''),
(51, 0, 0xde0301040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00de0302040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e40302040701000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00e003050407010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c617420233531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00, ''),
(52, 0, 0xde03f8030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00de03f9030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e403f9030701000000b9048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00e003fc0307010000002a198001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f7573652027466c61742020233532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131323530303020676f6c6420636f696e732e00, ''),
(53, 0, 0xde03ef030701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00de03f0030701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00e003f30307010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00e403f0030701000000b9048001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303030303020676f6c6420636f696e732e00, ''),
(54, 0, 0xed03f1030501000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00ed03f2030501000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00f003f3030501000000b9048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742020233534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e00, ''),
(55, 0, 0x3b04230407010000002b198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e003b0424040701000000b9048001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e003f04250407010000002a198001000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027466c617420233535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383530303020676f6c6420636f696e732e00400422040701000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00400423040701000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(57, 0, 0x810683040701000000bc048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027415020233032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393030303020676f6c6420636f696e732e00, ''),
(58, 0, 0x880683040701000000bc048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(59, 0, 0x8e0683040701000000bc048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027415020233034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353530303020676f6c6420636f696e732e00, ''),
(60, 0, 0x930682040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133393530303020676f6c6420636f696e732e00, ''),
(61, 0, 0x93067f040701000000b9048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027415020233036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373530303020676f6c6420636f696e732e00, ''),
(62, 0, 0x93067a040701000000b9048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027415020233037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353030303020676f6c6420636f696e732e00, ''),
(63, 0, 0x930676040701000000b9048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027415020233038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373530303020676f6c6420636f696e732e00, ''),
(64, 0, 0x900676040701000000b9048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027415020233039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e00, ''),
(65, 0, 0x90067e040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(66, 0, 0x860680040701000000bc048001000b006465736372697074696f6e015100000049742062656c6f6e677320746f20686f7573652027415020233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393530303020676f6c6420636f696e732e00, ''),
(67, 0, 0x940668040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203234373530303020676f6c6420636f696e732e00, ''),
(68, 0, 0x94065e040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231363030303020676f6c6420636f696e732e00, ''),
(69, 0, 0x940656040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203236353530303020676f6c6420636f696e732e00, ''),
(70, 0, 0x870651040701000000bc048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203132313530303020676f6c6420636f696e732e00, ''),
(71, 0, 0x800651040701000000bc048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130333530303020676f6c6420636f696e732e00, ''),
(72, 0, 0x6f0678040701000000b9048001000b006465736372697074696f6e015200000049742062656c6f6e677320746f20686f7573652027415020233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133303530303020676f6c6420636f696e732e00, ''),
(117, 0, 0x970218020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00970219020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e009b0218020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e009b0219020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e009f0218020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e009f0219020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e009b0222020701000000d2048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313137272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f73747320313031323530303020676f6c6420636f696e732e00, ''),
(118, 0, 0xa5022e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00a5022f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00a9022e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00a9022f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00ad022e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00ad022f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00a30232020701000000cf048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313138272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f73747320313031323530303020676f6c6420636f696e732e00, ''),
(119, 0, 0xa30244020701000000cf048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313139272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f73747320323032353030303020676f6c6420636f696e732e00a50247020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00a90247020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00ad0247020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00a50248020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00a702490207010000001d0a80010007006465706f7469640201000000170000000000a90248020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00ab02490207010000001d0a80010007006465706f7469640201000000170000000000ad0248020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00990250020701000000d2048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313139272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f73747320323032353030303020676f6c6420636f696e732e00950259020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0095025a020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00990259020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0099025a020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e009d0259020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e009d025a020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(120, 0, 0x870251020701000000d2048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313230272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f737473203939393030303020676f6c6420636f696e732e0083025a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0083025b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0087025a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0087025b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e008b025a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e008b025b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(121, 0, 0x760254020701000000d2048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313231272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f737473203938313030303020676f6c6420636f696e732e0072025d020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0072025e020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0076025d020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0076025e020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e007a025d020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e007a025e020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(122, 0, 0x660251020701000000d2048001000b006465736372697074696f6e015d00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313232272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f73747320313031323530303020676f6c6420636f696e732e0062025a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0062025b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0066025a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0066025b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e006a025a020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e006a025b020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(123, 0, 0x3e023e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e003e023f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0048023b020701000000cf048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313233272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f737473203936333030303020676f6c6420636f696e732e0042023e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0042023f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0046023e020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0046023f020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(124, 0, 0x420224020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00420225020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00460224020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00460225020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e004a0224020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e004a0225020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e004c0228020701000000cf048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313234272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f737473203939393030303020676f6c6420636f696e732e00, ''),
(125, 0, 0x550219020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0055021a020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00590219020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e0059021a020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e005d0219020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e005d021a020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00590223020701000000d2048001000b006465736372697074696f6e015c00000049742062656c6f6e677320746f2068616c6c2027556e6e616d656420486f7573652023313235272e204e6f626f6479206f776e7320746869732068616c6c2e20497420636f737473203939393030303020676f6c6420636f696e732e00, ''),
(127, 0, 0x4f0249020701000000d2048001000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313031323530303020676f6c6420636f696e732e004b0252020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e004b0253020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e004f0252020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e004f0253020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00530252020701000000de068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00530253020701000000df068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00, ''),
(128, 0, 0x320402040601000000da068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00320403040601000000db068001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e00330405040601000000bc048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742023313238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003404050406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742023313238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e003604050406010000002a198001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027466c61742023313238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333030303020676f6c6420636f696e732e00, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `killers`
--

CREATE TABLE `killers` (
  `id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `killers`
--

INSERT INTO `killers` (`id`, `death_id`, `final_hit`, `unjustified`, `war`) VALUES
(5, 4, 0, 0, 0),
(10, 8, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_history`
--

CREATE TABLE `login_history` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lottery`
--

CREATE TABLE `lottery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL,
  `date` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marriage_system`
--

CREATE TABLE `marriage_system` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `partner` varchar(255) NOT NULL,
  `marriage_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagseguro_transactions`
--

INSERT INTO `pagseguro_transactions` (`transaction_code`, `name`, `payment_method`, `status`, `item_count`, `data`) VALUES
('4EA00C11-7D72-4EB1-A54D-8D91B1B6432E', 'cfx123', 'CREDIT_CARD', 'WAITING_PAYMENT', 35, '2019-11-02 18:54:57'),
('4EA00C11-7D72-4EB1-A54D-8D91B1B6432E', 'cfx123', 'CREDIT_CARD', 'CANCELLED', 35, '2019-11-04 19:01:10'),
('056248E4-0BAD-4C07-AE32-EB704F1B1930', '5548552', 'CREDIT_CARD', 'DELIVERED', 55, '2019-11-09 01:03:18'),
('C1432365-55B7-487C-868F-8762B9B2A476', 'Mininadir', 'CREDIT_CARD', 'DELIVERED', 60, '2019-11-09 13:03:32'),
('7C8E7F2A-77C2-44F5-B56A-EF4ACF3FFBD5', 'bidoreto2', 'CREDIT_CARD', 'DELIVERED', 10, '2019-11-11 02:46:21'),
('D2F3F227-450D-49E7-8E1B-92C7934BAB86', 'derley', 'BOLETO', 'WAITING_PAYMENT', 85, '2019-11-11 16:46:26'),
('D2F3F227-450D-49E7-8E1B-92C7934BAB86', 'derley', 'BOLETO', 'DELIVERED', 85, '2019-11-12 07:51:36'),
('97D4E81B-7A07-4090-B719-0297A4578720', 'lepnood', 'CREDIT_CARD', 'DELIVERED', 45, '2019-11-12 14:57:50'),
('6693622A-CF80-4AAF-A3B0-9624B2E546CE', 'saiard', 'BOLETO', 'WAITING_PAYMENT', 10, '2019-11-18 02:28:11'),
('9E6B3B26-975B-4996-B9CA-F62A90A641E1', 'derlei', 'BOLETO', 'WAITING_PAYMENT', 10, '2019-11-18 14:45:47'),
('9E6B3B26-975B-4996-B9CA-F62A90A641E1', 'derlei', 'BOLETO', 'DELIVERED', 10, '2019-11-19 07:29:09'),
('8C2A699F-1A00-40E2-85B7-CB0BD1B6A02A', 'lordpc', 'CREDIT_CARD', 'DELIVERED', 10, '2019-11-19 19:32:28'),
('F69A4A65-4EDA-4C4C-9265-AF6DDF5E3E90', 'diogo21', 'CREDIT_CARD', 'DELIVERED', 200, '2019-11-19 23:33:20'),
('1AA35875-4A52-41B1-A8C1-CC43D1056FAB', '8823798', 'CREDIT_CARD', 'DELIVERED', 130, '2019-11-20 02:22:46'),
('A71B83EC-9940-4236-8EE7-4CE663B36EC0', 'gabrieldss', 'CREDIT_CARD', 'DELIVERED', 40, '2019-11-20 12:33:53'),
('FB272989-79C1-491E-88CB-31D0E4A92F62', 'diogo21', 'CREDIT_CARD', 'DELIVERED', 100, '2019-11-20 14:18:27'),
('1026067C-F928-41FC-9851-338158B3EE73', 'diogo21', 'CREDIT_CARD', 'DELIVERED', 100, '2019-11-21 22:19:53'),
('0B67C914-9B7E-4B29-AF44-BAA9355543D4', 'diogo21', 'CREDIT_CARD', 'DELIVERED', 100, '2019-11-22 01:00:48'),
('056248E4-0BAD-4C07-AE32-EB704F1B1930', '5548552', 'CREDIT_CARD', 'AVAILABLE', 55, '2019-11-22 05:42:54'),
('86ACA9D4-DDA4-4DC6-8A80-57EFD6ECB8B4', '11906222', 'CREDIT_CARD', 'DELIVERED', 10, '2019-11-22 11:07:53'),
('9DB9188E-A11D-41EC-BD77-E5C425B12351', 'diegom1002', 'BOLETO', 'WAITING_PAYMENT', 9, '2019-11-22 21:09:33'),
('62E1F0CD-E7A5-4237-A4C2-E59AA8537413', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 25, '2019-11-22 21:13:44'),
('C1432365-55B7-487C-868F-8762B9B2A476', 'Mininadir', 'CREDIT_CARD', 'AVAILABLE', 60, '2019-11-23 07:34:19'),
('9171FAB5-E309-43BB-95F0-5B4E915781D5', 'duda159', 'BOLETO', 'WAITING_PAYMENT', 90, '2019-11-23 15:48:57'),
('80B5C853-C63D-47C1-8866-9869EF9F4AE8', 'yvesbr', 'CREDIT_CARD', 'WAITING_PAYMENT', 25, '2019-11-24 04:17:25'),
('7C8E7F2A-77C2-44F5-B56A-EF4ACF3FFBD5', 'bidoreto2', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-11-24 07:16:07'),
('F53A7D30-539D-452D-B59D-F898C8A3C4D7', 'kabom1000', 'CREDIT_CARD', 'WAITING_PAYMENT', 3, '2019-11-24 11:29:35'),
('A52F5D29-7010-4A9F-BFFC-72E4DE02A154', '8956396a', 'CREDIT_CARD', 'IN_ANALYSIS', 50, '2019-11-24 20:14:37'),
('F8E82C45-1C65-46F8-A9A8-FE603562605A', 'diogo21', 'CREDIT_CARD', 'DELIVERED', 10, '2019-11-24 20:18:53'),
('0A3763AE-B4E7-4E40-AFC3-FBD4424294E6', 'yvesbr', 'CREDIT_CARD', 'DELIVERED', 100, '2019-11-24 22:35:32'),
('8771200D-B7EB-45F7-A631-10D0EF926D16', 'yvesbr', 'CREDIT_CARD', 'DELIVERED', 30, '2019-11-24 23:00:36'),
('A52F5D29-7010-4A9F-BFFC-72E4DE02A154', '8956396a', 'CREDIT_CARD', 'DELIVERED', 50, '2019-11-25 12:55:05'),
('80B5C853-C63D-47C1-8866-9869EF9F4AE8', 'yvesbr', 'CREDIT_CARD', 'CANCELLED', 25, '2019-11-26 04:16:06'),
('97D4E81B-7A07-4090-B719-0297A4578720', 'lepnood', 'CREDIT_CARD', 'AVAILABLE', 45, '2019-11-26 04:22:05'),
('D2F3F227-450D-49E7-8E1B-92C7934BAB86', 'derley', 'BOLETO', 'AVAILABLE', 85, '2019-11-26 06:10:37'),
('F53A7D30-539D-452D-B59D-F898C8A3C4D7', 'kabom1000', 'CREDIT_CARD', 'CANCELLED', 3, '2019-11-26 11:31:03'),
('80CCB487-2730-4DCE-83F3-DA2E17A1D6BA', 'zeluismj', 'CREDIT_CARD', 'DELIVERED', 100, '2019-11-26 22:24:00'),
('E1261156-8806-4944-8FE3-76C1450BDABD', '8823798', 'CREDIT_CARD', 'DELIVERED', 30, '2019-11-26 23:05:21'),
('4C81D39D-5516-4860-9E91-97207842F207', 'zeluismj', 'CREDIT_CARD', 'DELIVERED', 100, '2019-11-27 13:49:54'),
('4240AA4E-CF7B-415C-B701-37DCDF11E6C7', 'rubyflow', 'CREDIT_CARD', 'DELIVERED', 20, '2019-11-27 16:32:42'),
('FC1954D1-2EF3-4382-9B30-7E73142666E1', 'zeluismj', 'CREDIT_CARD', 'DELIVERED', 47, '2019-11-28 10:29:18'),
('BD5D5E9D-067E-4B07-BFD3-F85A22D15179', 'bonanza', 'BOLETO', 'WAITING_PAYMENT', 19, '2019-11-28 16:37:29'),
('AB359986-FA61-4CF3-ACE0-431019E707DA', 'itamar', 'CREDIT_CARD', 'DELIVERED', 20, '2019-11-28 22:20:00'),
('BD5D5E9D-067E-4B07-BFD3-F85A22D15179', 'bonanza', 'BOLETO', 'DELIVERED', 19, '2019-11-29 06:01:16'),
('7B860A4E-D8AC-4DB9-ACC2-424269619C88', 'bonanza', 'BOLETO', 'WAITING_PAYMENT', 9, '2019-11-29 14:05:57'),
('A629D700-E8DE-4468-B3DD-A2F769343FB4', 'bonanza', 'BOLETO', 'WAITING_PAYMENT', 4, '2019-11-29 14:20:03'),
('3A351911-6E54-478E-A056-D3DD05CDA593', 'bonanza', 'BOLETO', 'WAITING_PAYMENT', 9, '2019-11-29 14:28:44'),
('C5934879-2345-4EA9-A0E3-C1A53E257134', 'bonanza', 'BOLETO', 'WAITING_PAYMENT', 19, '2019-11-29 15:29:21'),
('A629D700-E8DE-4468-B3DD-A2F769343FB4', 'bonanza', 'BOLETO', 'DELIVERED', 4, '2019-11-30 06:10:35'),
('3A351911-6E54-478E-A056-D3DD05CDA593', 'bonanza', 'BOLETO', 'DELIVERED', 9, '2019-11-30 06:11:08'),
('6693622A-CF80-4AAF-A3B0-9624B2E546CE', 'saiard', 'BOLETO', 'CANCELLED', 10, '2019-11-30 13:42:33'),
('F4C4F8B0-4798-4D73-8909-FEE433F43ABF', 'zeluismj', 'CREDIT_CARD', 'DELIVERED', 50, '2019-11-30 14:20:20'),
('30B6D215-277F-49CF-B0E3-EDA50F990C3C', 'igorjac', 'BOLETO', 'WAITING_PAYMENT', 25, '2019-12-02 19:25:14'),
('D4311697-F773-4417-AD34-CD8E26AF0C8D', 'zhadzer2', 'CREDIT_CARD', 'DELIVERED', 40, '2019-12-02 21:51:19'),
('CE4EE254-100C-4925-8473-4D199048C987', '11906222', 'CREDIT_CARD', 'DELIVERED', 70, '2019-12-02 22:09:25'),
('8C2A699F-1A00-40E2-85B7-CB0BD1B6A02A', 'lordpc', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-03 04:31:19'),
('1AA35875-4A52-41B1-A8C1-CC43D1056FAB', '8823798', 'CREDIT_CARD', 'AVAILABLE', 130, '2019-12-03 05:06:52'),
('9E6B3B26-975B-4996-B9CA-F62A90A641E1', 'derlei', 'BOLETO', 'AVAILABLE', 10, '2019-12-03 05:15:25'),
('F69A4A65-4EDA-4C4C-9265-AF6DDF5E3E90', 'diogo21', 'CREDIT_CARD', 'AVAILABLE', 200, '2019-12-03 05:28:11'),
('30B6D215-277F-49CF-B0E3-EDA50F990C3C', 'igorjac', 'BOLETO', 'DELIVERED', 25, '2019-12-03 10:16:57'),
('FB272989-79C1-491E-88CB-31D0E4A92F62', 'diogo21', 'CREDIT_CARD', 'AVAILABLE', 100, '2019-12-04 04:03:35'),
('A71B83EC-9940-4236-8EE7-4CE663B36EC0', 'gabrieldss', 'CREDIT_CARD', 'AVAILABLE', 40, '2019-12-04 04:36:19'),
('C7648D99-6D85-412D-8E75-6433687D3562', 'wellington', 'CREDIT_CARD', 'DELIVERED', 30, '2019-12-04 20:27:34'),
('0B67C914-9B7E-4B29-AF44-BAA9355543D4', 'diogo21', 'CREDIT_CARD', 'AVAILABLE', 100, '2019-12-05 04:34:28'),
('1026067C-F928-41FC-9851-338158B3EE73', 'diogo21', 'CREDIT_CARD', 'AVAILABLE', 100, '2019-12-05 09:22:15'),
('55C40CBB-FF31-47B9-96A7-045405888D2E', 'italobb', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-05 11:05:13'),
('4E16E68A-C4D0-4F43-AADB-10F9ECA2F09F', 'igorjac', 'BOLETO', 'WAITING_PAYMENT', 10, '2019-12-05 12:18:02'),
('D3F487DF-5181-4FED-9D9F-1403C2B0C72B', 'italobb', 'CREDIT_CARD', 'CANCELLED', 35, '2019-12-05 21:23:17'),
('57AAED59-DDDD-490B-AE5E-313F939F9D6A', 'italobb', 'CREDIT_CARD', 'CANCELLED', 35, '2019-12-05 21:26:15'),
('9878DC00-2730-40CA-A0C2-6EE164BE9467', 'francis', 'BOLETO', 'WAITING_PAYMENT', 55, '2019-12-05 21:30:38'),
('5E64F0C0-8B61-4D9A-833F-C3D06EEA177E', 'italobb', 'CREDIT_CARD', 'CANCELLED', 35, '2019-12-05 21:31:06'),
('C98D9586-46FE-4E41-A929-84866019ABB9', 'italobb', 'CREDIT_CARD', 'DELIVERED', 35, '2019-12-05 21:37:40'),
('E40C7B94-0441-44D8-ACFE-8A41999857BC', 'lordpc', 'BOLETO', 'WAITING_PAYMENT', 70, '2019-12-06 02:57:42'),
('62E1F0CD-E7A5-4237-A4C2-E59AA8537413', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 25, '2019-12-06 04:49:25'),
('4E16E68A-C4D0-4F43-AADB-10F9ECA2F09F', 'igorjac', 'BOLETO', 'DELIVERED', 10, '2019-12-06 06:27:27'),
('9878DC00-2730-40CA-A0C2-6EE164BE9467', 'francis', 'BOLETO', 'DELIVERED', 55, '2019-12-06 06:38:39'),
('86ACA9D4-DDA4-4DC6-8A80-57EFD6ECB8B4', '11906222', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-06 07:06:23'),
('4FBC6CB6-B5F1-42C5-8DD1-0AE618E8E41B', 'dragao9090', 'BOLETO', 'CANCELLED', 80, '2019-12-06 11:37:59'),
('C2760B2D-9020-462E-B035-8B8377B2FB8E', 'kikabr', 'BOLETO', 'WAITING_PAYMENT', 50, '2019-12-06 16:24:29'),
('AED1251A-795A-479E-A471-6C3930B236D8', 'zeluismj', 'CREDIT_CARD', 'DELIVERED', 100, '2019-12-06 16:53:37'),
('29EF2372-5DE0-4096-A90A-19C3A8C5481E', 'mateusreis', 'CREDIT_CARD', 'CANCELLED', 35, '2019-12-06 17:23:57'),
('8287A595-F424-46B4-BEED-81A0675CEADF', 'mateusreis', 'CREDIT_CARD', 'CANCELLED', 35, '2019-12-06 17:30:30'),
('EA14A317-E04B-4D3F-99D9-12B7DCFAC026', 'itamar', 'CREDIT_CARD', 'DELIVERED', 20, '2019-12-06 19:07:53'),
('4F6A8BD8-36AD-4171-9A57-6B44F17DCB7E', 'itamar', 'CREDIT_CARD', 'DELIVERED', 5, '2019-12-06 19:10:14'),
('70725A39-4B1D-4FF7-AC46-6491208C2682', 'lordpc', 'CREDIT_CARD', 'DELIVERED', 50, '2019-12-06 23:12:44'),
('286C4BB7-D430-42C3-90C5-945C3EF7C0F2', 'lordpc', 'CREDIT_CARD', 'DELIVERED', 50, '2019-12-07 00:48:18'),
('632649BE-DAF5-40B9-8644-3A013B3313CF', 'lipark', 'BOLETO', 'WAITING_PAYMENT', 80, '2019-12-07 01:18:55'),
('7DCF1EE2-17A2-4DAB-8438-886C6D58D40C', '5548552', 'CREDIT_CARD', 'DELIVERED', 75, '2019-12-07 02:50:44'),
('E40C7B94-0441-44D8-ACFE-8A41999857BC', 'lordpc', 'BOLETO', 'DELIVERED', 70, '2019-12-07 06:14:19'),
('C2760B2D-9020-462E-B035-8B8377B2FB8E', 'kikabr', 'BOLETO', 'DELIVERED', 50, '2019-12-07 06:24:44'),
('9DB9188E-A11D-41EC-BD77-E5C425B12351', 'diegom1002', 'BOLETO', 'CANCELLED', 9, '2019-12-07 11:13:27'),
('9171FAB5-E309-43BB-95F0-5B4E915781D5', 'duda159', 'BOLETO', 'CANCELLED', 90, '2019-12-07 11:46:44'),
('A5DE134B-0242-45CB-9BF4-9D611BE96352', 'diegom1002', 'BOLETO', 'WAITING_PAYMENT', 10, '2019-12-08 00:15:44'),
('46BC5080-2F65-4765-94A4-1C65589C9278', 'kikabr', 'BOLETO', 'WAITING_PAYMENT', 25, '2019-12-08 02:59:06'),
('39EF94E3-697A-433B-9152-956B463D906A', 'kikabr', 'BOLETO', 'WAITING_PAYMENT', 5, '2019-12-08 03:02:48'),
('0A3763AE-B4E7-4E40-AFC3-FBD4424294E6', 'yvesbr', 'CREDIT_CARD', 'AVAILABLE', 100, '2019-12-08 04:14:58'),
('F8E82C45-1C65-46F8-A9A8-FE603562605A', 'diogo21', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-08 05:24:40'),
('F20EF1C4-82A5-4FE4-A73C-A801637CA074', 'lordpc', 'CREDIT_CARD', 'DELIVERED', 10, '2019-12-08 06:05:26'),
('8771200D-B7EB-45F7-A631-10D0EF926D16', 'yvesbr', 'CREDIT_CARD', 'AVAILABLE', 30, '2019-12-08 08:16:48'),
('A08B1834-15EA-4B15-8DB6-443866671837', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 10, '2019-12-08 12:10:23'),
('0384DE5D-5D37-4E2F-A0A9-2D29C32FE4CA', '258225', 'CREDIT_CARD', 'DELIVERED', 5, '2019-12-08 14:57:25'),
('5120F3A7-6EC0-43D4-8E50-AA5857FFC4B3', 'wellington', 'CREDIT_CARD', 'DELIVERED', 30, '2019-12-08 16:05:46'),
('A52F5D29-7010-4A9F-BFFC-72E4DE02A154', '8956396a', 'CREDIT_CARD', 'AVAILABLE', 50, '2019-12-09 05:27:57'),
('5CA031BB-AA6F-4AED-B371-FC5048AF77A5', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 25, '2019-12-09 20:13:10'),
('F8DA7824-08A5-44CC-8B64-BE38D612717C', 'diogoharo', 'CREDIT_CARD', 'DELIVERED', 10, '2019-12-10 01:55:20'),
('E1261156-8806-4944-8FE3-76C1450BDABD', '8823798', 'CREDIT_CARD', 'AVAILABLE', 30, '2019-12-10 04:25:58'),
('80CCB487-2730-4DCE-83F3-DA2E17A1D6BA', 'zeluismj', 'CREDIT_CARD', 'AVAILABLE', 100, '2019-12-10 04:37:01'),
('39EF94E3-697A-433B-9152-956B463D906A', 'kikabr', 'BOLETO', 'DELIVERED', 5, '2019-12-10 07:56:44'),
('632649BE-DAF5-40B9-8644-3A013B3313CF', 'lipark', 'BOLETO', 'DELIVERED', 80, '2019-12-10 08:16:39'),
('84D5624D-7E0A-4456-8990-955F4EB6961B', '99135686', 'BOLETO', 'WAITING_PAYMENT', 10, '2019-12-10 18:00:45'),
('0C4B76BB-B49A-4A96-905F-FE64951A74C5', 'igorjac', 'CREDIT_CARD', 'DELIVERED', 23, '2019-12-10 19:16:10'),
('4DEF36E3-6627-42A6-B5CB-9D5144856965', 'wellington', 'CREDIT_CARD', 'DELIVERED', 50, '2019-12-10 19:16:47'),
('4240AA4E-CF7B-415C-B701-37DCDF11E6C7', 'rubyflow', 'CREDIT_CARD', 'AVAILABLE', 20, '2019-12-11 04:19:14'),
('4C81D39D-5516-4860-9E91-97207842F207', 'zeluismj', 'CREDIT_CARD', 'AVAILABLE', 100, '2019-12-11 05:34:20'),
('84D5624D-7E0A-4456-8990-955F4EB6961B', '99135686', 'BOLETO', 'DELIVERED', 10, '2019-12-11 06:26:20'),
('AB359986-FA61-4CF3-ACE0-431019E707DA', 'itamar', 'CREDIT_CARD', 'AVAILABLE', 20, '2019-12-12 07:16:33'),
('FC1954D1-2EF3-4382-9B30-7E73142666E1', 'zeluismj', 'CREDIT_CARD', 'AVAILABLE', 47, '2019-12-12 07:35:25'),
('2D2C4ACF-AB77-43C7-861D-37BF9B8D9C3C', '11906222', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-12 10:56:03'),
('667D55DA-DF14-48F2-8AF7-0C374136503D', '11906222', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-12 10:59:05'),
('A49C740B-241A-454E-BDBE-E6B36B566F7E', 'italobb', 'CREDIT_CARD', 'DELIVERED', 10, '2019-12-12 23:44:50'),
('917541AF-A684-4308-BC0F-3DD179CE9FAA', '11906222', 'CREDIT_CARD', 'DELIVERED', 10, '2019-12-12 23:55:35'),
('BD5D5E9D-067E-4B07-BFD3-F85A22D15179', 'bonanza', 'BOLETO', 'AVAILABLE', 19, '2019-12-13 05:37:19'),
('79D26C67-B5E2-469E-A5C7-C82F27688666', 'loower', 'BOLETO', 'WAITING_PAYMENT', 15, '2019-12-13 14:43:35'),
('13DAEE50-46A2-4F61-97A6-0996BF01CCBB', 'loower', 'BOLETO', 'WAITING_PAYMENT', 20, '2019-12-13 14:47:26'),
('3A351911-6E54-478E-A056-D3DD05CDA593', 'bonanza', 'BOLETO', 'AVAILABLE', 9, '2019-12-14 05:10:22'),
('A629D700-E8DE-4468-B3DD-A2F769343FB4', 'bonanza', 'BOLETO', 'AVAILABLE', 4, '2019-12-14 05:10:51'),
('F4C4F8B0-4798-4D73-8909-FEE433F43ABF', 'zeluismj', 'CREDIT_CARD', 'AVAILABLE', 50, '2019-12-14 06:19:04'),
('C5934879-2345-4EA9-A0E3-C1A53E257134', 'bonanza', 'BOLETO', 'CANCELLED', 19, '2019-12-14 10:47:50'),
('7B860A4E-D8AC-4DB9-ACC2-424269619C88', 'bonanza', 'BOLETO', 'CANCELLED', 9, '2019-12-14 10:49:34'),
('CE4EE254-100C-4925-8473-4D199048C987', '11906222', 'CREDIT_CARD', 'AVAILABLE', 70, '2019-12-16 05:42:24'),
('D4311697-F773-4417-AD34-CD8E26AF0C8D', 'zhadzer2', 'CREDIT_CARD', 'AVAILABLE', 40, '2019-12-16 05:46:07'),
('66F1B78B-EFA1-4AA5-AF8C-97285CD53EFE', 'italobb', 'CREDIT_CARD', 'DELIVERED', 10, '2019-12-16 13:43:35'),
('DF407714-E143-421C-AFC3-6C471AB2800B', '11906222', 'CREDIT_CARD', 'DELIVERED', 15, '2019-12-16 20:24:54'),
('30B6D215-277F-49CF-B0E3-EDA50F990C3C', 'igorjac', 'BOLETO', 'AVAILABLE', 25, '2019-12-17 04:48:20'),
('E9A78D15-B225-4B26-B9D5-B0704E764204', 'igorjac', 'CREDIT_CARD', 'DELIVERED', 50, '2019-12-18 00:30:26'),
('E648D24B-9B8D-429C-ACD8-399EC4A6BBC0', 'igorjac', 'CREDIT_CARD', 'DELIVERED', 5, '2019-12-18 00:40:54'),
('C7648D99-6D85-412D-8E75-6433687D3562', 'wellington', 'CREDIT_CARD', 'AVAILABLE', 30, '2019-12-18 05:28:09'),
('C98D9586-46FE-4E41-A929-84866019ABB9', 'italobb', 'CREDIT_CARD', 'AVAILABLE', 35, '2019-12-19 04:06:09'),
('5D11DC04-AB1C-49D7-BC82-7D200C616F0A', 'Gabrilll', 'BOLETO', 'WAITING_PAYMENT', 10, '2019-12-19 17:21:32'),
('63796BD5-223D-4D90-9300-6B1FB3E94E5D', 'wellington', 'CREDIT_CARD', 'DELIVERED', 5, '2019-12-19 18:25:10'),
('5D8F8DF3-F9B2-4E01-92A0-3F157FD4A50E', 'Gabrilll', 'BOLETO', 'WAITING_PAYMENT', 40, '2019-12-19 20:04:34'),
('9878DC00-2730-40CA-A0C2-6EE164BE9467', 'francis', 'BOLETO', 'AVAILABLE', 55, '2019-12-20 04:13:36'),
('4E16E68A-C4D0-4F43-AADB-10F9ECA2F09F', 'igorjac', 'BOLETO', 'AVAILABLE', 10, '2019-12-20 04:15:27'),
('AED1251A-795A-479E-A471-6C3930B236D8', 'zeluismj', 'CREDIT_CARD', 'AVAILABLE', 100, '2019-12-20 04:27:49'),
('7DCF1EE2-17A2-4DAB-8438-886C6D58D40C', '5548552', 'CREDIT_CARD', 'AVAILABLE', 75, '2019-12-20 05:13:15'),
('286C4BB7-D430-42C3-90C5-945C3EF7C0F2', 'lordpc', 'CREDIT_CARD', 'AVAILABLE', 50, '2019-12-20 05:39:31'),
('70725A39-4B1D-4FF7-AC46-6491208C2682', 'lordpc', 'CREDIT_CARD', 'AVAILABLE', 50, '2019-12-20 05:58:36'),
('5D8F8DF3-F9B2-4E01-92A0-3F157FD4A50E', 'Gabrilll', 'BOLETO', 'DELIVERED', 40, '2019-12-20 06:02:04'),
('5D11DC04-AB1C-49D7-BC82-7D200C616F0A', 'Gabrilll', 'BOLETO', 'DELIVERED', 10, '2019-12-20 06:04:55'),
('4F6A8BD8-36AD-4171-9A57-6B44F17DCB7E', 'itamar', 'CREDIT_CARD', 'AVAILABLE', 5, '2019-12-20 06:57:54'),
('EA14A317-E04B-4D3F-99D9-12B7DCFAC026', 'itamar', 'CREDIT_CARD', 'AVAILABLE', 20, '2019-12-20 06:58:18'),
('3C90A450-3045-4D71-B038-57D115A19E01', 'myzuru25', 'CREDIT_CARD', 'DELIVERED', 100, '2019-12-20 15:38:54'),
('9E94426B-C5D3-476E-A219-DF71F61026E4', 'azs1234567', 'CREDIT_CARD', 'DELIVERED', 20, '2019-12-20 15:49:46'),
('E33AF1E9-5822-41D8-AFD9-EA44BAD9ADBB', 'myzuru25', 'CREDIT_CARD', 'DELIVERED', 20, '2019-12-20 16:06:03'),
('0A251758-305A-4C86-ACCF-C279EDE9635D', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 40, '2019-12-20 16:19:13'),
('09822D6E-82D9-4C26-A0F0-3B1FD41C01A4', 'azs1234567', 'BOLETO', 'WAITING_PAYMENT', 15, '2019-12-20 16:48:27'),
('71F87C2A-7EE3-48D1-9D6D-B0FA07576688', 'azs1234567', 'BOLETO', 'WAITING_PAYMENT', 14, '2019-12-20 17:03:12'),
('9D56502C-FDD8-4610-A24D-C58B84946ABD', 'azs1234567', 'BOLETO', 'WAITING_PAYMENT', 14, '2019-12-20 17:05:04'),
('C2A1EDD7-D9AD-43AA-82BD-D601E7A2D8A5', 'wellington', 'CREDIT_CARD', 'DELIVERED', 20, '2019-12-20 17:30:33'),
('0837E8FB-F29A-49EF-8E76-CBCF4505BB32', 'bonanza', 'BOLETO', 'WAITING_PAYMENT', 19, '2019-12-20 19:32:31'),
('66250F21-AC2A-4D99-9A28-C4F896B135C6', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 50, '2019-12-20 21:06:16'),
('C2760B2D-9020-462E-B035-8B8377B2FB8E', 'kikabr', 'BOLETO', 'AVAILABLE', 50, '2019-12-21 04:44:18'),
('E40C7B94-0441-44D8-ACFE-8A41999857BC', 'lordpc', 'BOLETO', 'AVAILABLE', 70, '2019-12-21 04:46:02'),
('9D56502C-FDD8-4610-A24D-C58B84946ABD', 'azs1234567', 'BOLETO', 'DELIVERED', 14, '2019-12-21 06:26:37'),
('A5DE134B-0242-45CB-9BF4-9D611BE96352', 'diegom1002', 'BOLETO', 'CANCELLED', 10, '2019-12-21 12:25:52'),
('46BC5080-2F65-4765-94A4-1C65589C9278', 'kikabr', 'BOLETO', 'CANCELLED', 25, '2019-12-21 12:30:50'),
('053B26DB-3370-43FE-A87A-53BCA4C7D1C7', 'lipark', 'BOLETO', 'WAITING_PAYMENT', 80, '2019-12-21 12:55:53'),
('5120F3A7-6EC0-43D4-8E50-AA5857FFC4B3', 'wellington', 'CREDIT_CARD', 'AVAILABLE', 30, '2019-12-22 04:04:43'),
('0384DE5D-5D37-4E2F-A0A9-2D29C32FE4CA', '258225', 'CREDIT_CARD', 'AVAILABLE', 5, '2019-12-22 04:49:27'),
('A08B1834-15EA-4B15-8DB6-443866671837', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-22 06:21:59'),
('F20EF1C4-82A5-4FE4-A73C-A801637CA074', 'lordpc', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-22 06:48:12'),
('3DB90F3E-3303-4AD1-888D-160AEEE662A5', 'azs1234567', 'CREDIT_CARD', 'DELIVERED', 6, '2019-12-22 16:19:20'),
('4EBFFDA4-0F84-45DD-BF15-0B85831A7D83', '96198081mf', 'CREDIT_CARD', 'WAITING_PAYMENT', 100, '2019-12-22 20:29:55'),
('5CA031BB-AA6F-4AED-B371-FC5048AF77A5', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 25, '2019-12-23 04:43:31'),
('F8DA7824-08A5-44CC-8B64-BE38D612717C', 'diogoharo', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-23 05:45:16'),
('8163354D-A99D-4A0C-87AD-52A6D9107FEE', 'myzuru25', 'CREDIT_CARD', 'DELIVERED', 60, '2019-12-23 07:08:57'),
('0C4B76BB-B49A-4A96-905F-FE64951A74C5', 'igorjac', 'CREDIT_CARD', 'AVAILABLE', 23, '2019-12-24 04:28:07'),
('4DEF36E3-6627-42A6-B5CB-9D5144856965', 'wellington', 'CREDIT_CARD', 'AVAILABLE', 50, '2019-12-24 04:28:07'),
('632649BE-DAF5-40B9-8644-3A013B3313CF', 'lipark', 'BOLETO', 'AVAILABLE', 80, '2019-12-24 05:34:44'),
('39EF94E3-697A-433B-9152-956B463D906A', 'kikabr', 'BOLETO', 'AVAILABLE', 5, '2019-12-24 05:36:50'),
('053B26DB-3370-43FE-A87A-53BCA4C7D1C7', 'lipark', 'BOLETO', 'DELIVERED', 80, '2019-12-24 08:16:29'),
('0011DB21-8EBA-4A3F-9D41-CBF17017177E', 'italobb', 'CREDIT_CARD', 'CANCELLED', 30, '2019-12-24 08:49:16'),
('8EE1195E-DEF0-4097-9CC6-98924B3B416F', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 25, '2019-12-24 19:16:11'),
('4EBFFDA4-0F84-45DD-BF15-0B85831A7D83', '96198081mf', 'CREDIT_CARD', 'CANCELLED', 100, '2019-12-24 20:31:08'),
('A73E23B2-3571-4E2E-A741-D0515AB0E82C', 'brazom001', 'BOLETO', 'WAITING_PAYMENT', 20, '2019-12-25 03:06:25'),
('84D5624D-7E0A-4456-8990-955F4EB6961B', '99135686', 'BOLETO', 'AVAILABLE', 10, '2019-12-25 05:20:12'),
('A198B7C7-AF9E-4DAE-9A56-B339904EAF97', '180295', 'BOLETO', 'DELIVERED', 40, '2019-12-25 05:26:47'),
('754A4F55-FEA7-4CB7-AB66-84ACD3730AB6', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 10, '2019-12-25 12:33:15'),
('2E29CC38-E06B-4CF2-8F18-84E0C9BC9D80', 'myzuru25', 'CREDIT_CARD', 'DELIVERED', 30, '2019-12-25 14:31:42'),
('26B4697D-A60F-405B-A6FA-6615DAAB680A', '710338', 'BOLETO', 'WAITING_PAYMENT', 25, '2019-12-25 14:43:37'),
('917541AF-A684-4308-BC0F-3DD179CE9FAA', '11906222', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-26 05:19:13'),
('A49C740B-241A-454E-BDBE-E6B36B566F7E', 'italobb', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-26 05:21:45'),
('72A91A49-F659-4DCC-B681-21DE17B7312F', 'brazom001', 'BOLETO', 'WAITING_PAYMENT', 20, '2019-12-26 15:57:58'),
('5285C92C-A8EF-4DCF-93C8-8F5D1D0E64C7', 'brazom001', 'BOLETO', 'WAITING_PAYMENT', 20, '2019-12-26 16:02:36'),
('153342C7-9891-4934-B16C-5875CF353760', '88715861', 'BOLETO', 'WAITING_PAYMENT', 30, '2019-12-26 17:14:11'),
('E9B285BA-17AA-403F-928C-C246639C9F39', 'italobb', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-26 21:10:30'),
('37B15279-7A4B-4599-B948-381050CEA9FC', 'italobb', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-26 21:12:08'),
('2C919BB3-86D2-4E13-8945-26F2059FF679', 'italobb', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-26 21:14:15'),
('97B830D2-8335-4161-920D-D9FB2086E524', 'italobb', 'CREDIT_CARD', 'CANCELLED', 5, '2019-12-26 21:16:29'),
('6701928A-7FF5-4DB4-80BB-C876B14234DA', 'italobb', 'CREDIT_CARD', 'CANCELLED', 5, '2019-12-26 21:20:07'),
('280B5789-DEBC-443C-8A6C-E2AABD9327A2', 'italobb', 'CREDIT_CARD', 'WAITING_PAYMENT', 10, '2019-12-26 22:26:34'),
('280B5789-DEBC-443C-8A6C-E2AABD9327A2', 'italobb', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-26 22:36:37'),
('3EB1FABB-04E8-4D6E-A663-548026E8139A', 'italobb', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-26 23:12:45'),
('A9E166C8-4066-4792-A957-C69B58EE04A9', 'italobb', 'CREDIT_CARD', 'WAITING_PAYMENT', 20, '2019-12-26 23:28:32'),
('A9E166C8-4066-4792-A957-C69B58EE04A9', 'italobb', 'CREDIT_CARD', 'CANCELLED', 20, '2019-12-26 23:48:36'),
('36451C69-D0E6-45B4-9BBC-261C7041C2B2', 'chicol', 'ONLINE_TRANSFER', 'WAITING_PAYMENT', 30, '2019-12-27 00:06:32'),
('91928333-52A9-4784-BB62-BBA98E1B5BAC', 'chicola', 'ONLINE_TRANSFER', 'WAITING_PAYMENT', 30, '2019-12-27 00:07:32'),
('2683CD55-F2F0-4D65-9EDF-1CD9F9C82784', 'chicola', 'ONLINE_TRANSFER', 'WAITING_PAYMENT', 30, '2019-12-27 00:12:35'),
('FDD77F1D-A106-4BE1-A542-51FB079B50CA', 'chicola', 'ONLINE_TRANSFER', 'WAITING_PAYMENT', 30, '2019-12-27 00:22:23'),
('26B4697D-A60F-405B-A6FA-6615DAAB680A', '710338', 'BOLETO', 'DELIVERED', 25, '2019-12-27 07:01:11'),
('5285C92C-A8EF-4DCF-93C8-8F5D1D0E64C7', 'brazom001', 'BOLETO', 'DELIVERED', 20, '2019-12-27 07:25:54'),
('153342C7-9891-4934-B16C-5875CF353760', '88715861', 'BOLETO', 'DELIVERED', 30, '2019-12-27 07:28:08'),
('36451C69-D0E6-45B4-9BBC-261C7041C2B2', 'chicol', 'ONLINE_TRANSFER', 'CANCELLED', 30, '2019-12-27 10:11:32'),
('91928333-52A9-4784-BB62-BBA98E1B5BAC', 'chicola', 'ONLINE_TRANSFER', 'CANCELLED', 30, '2019-12-27 10:12:32'),
('2683CD55-F2F0-4D65-9EDF-1CD9F9C82784', 'chicola', 'ONLINE_TRANSFER', 'CANCELLED', 30, '2019-12-27 10:17:35'),
('FDD77F1D-A106-4BE1-A542-51FB079B50CA', 'chicola', 'ONLINE_TRANSFER', 'CANCELLED', 30, '2019-12-27 10:27:22'),
('9D9CA8E8-9F35-4589-8791-B5C434DC2E59', 'brazom001', 'BOLETO', 'WAITING_PAYMENT', 15, '2019-12-27 12:08:13'),
('8D696F0C-14A4-48E4-9F42-85DBD08C71B1', 'chicola', 'ONLINE_TRANSFER', 'WAITING_PAYMENT', 30, '2019-12-27 12:58:43'),
('4C50DDB7-0E87-4930-93EF-EE87E316A9AC', 'italobb', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-27 13:22:38'),
('3C7F1B6E-0EC9-4BAF-BFC7-D566A91A886E', '98801170', 'BOLETO', 'WAITING_PAYMENT', 30, '2019-12-27 17:00:00'),
('8D696F0C-14A4-48E4-9F42-85DBD08C71B1', 'chicola', 'ONLINE_TRANSFER', 'CANCELLED', 30, '2019-12-27 23:03:43'),
('65210C85-CD0F-49A8-A311-98050B644828', '180295', 'CREDIT_CARD', 'DELIVERED', 20, '2019-12-28 00:51:34'),
('EC785D75-A7DE-403B-9CC2-5BFD6BAA87FE', '96198081mf', 'CREDIT_CARD', 'DELIVERED', 100, '2019-12-28 00:56:39'),
('9D9CA8E8-9F35-4589-8791-B5C434DC2E59', 'brazom001', 'BOLETO', 'DELIVERED', 15, '2019-12-28 06:04:18'),
('D21C42B8-5BF2-4F7F-977A-5E52DD6F2F93', 'brazom001', 'BOLETO', 'WAITING_PAYMENT', 20, '2019-12-28 06:10:12'),
('79D26C67-B5E2-469E-A5C7-C82F27688666', 'loower', 'BOLETO', 'CANCELLED', 15, '2019-12-28 10:42:32'),
('13DAEE50-46A2-4F61-97A6-0996BF01CCBB', 'loower', 'BOLETO', 'CANCELLED', 20, '2019-12-28 10:42:50'),
('A9ED9CA5-9FDE-418A-BFAD-9613281B2E18', 'brazom001', 'BOLETO', 'WAITING_PAYMENT', 20, '2019-12-28 19:27:52'),
('27E9EAB6-41CE-4755-8D4B-111C89278F7F', 'kabom1000', 'CREDIT_CARD', 'DELIVERED', 50, '2019-12-28 20:20:52'),
('EB7CF30D-63AC-40BA-B2CC-F11EC297E0B6', 'p9unuero', 'CREDIT_CARD', 'DELIVERED', 25, '2019-12-28 21:05:32'),
('998BA1BF-4592-4521-A15F-DB09B341989A', 'leobaiano', 'CREDIT_CARD', 'DELIVERED', 30, '2019-12-29 14:25:11'),
('66F1B78B-EFA1-4AA5-AF8C-97285CD53EFE', 'italobb', 'CREDIT_CARD', 'AVAILABLE', 10, '2019-12-30 05:21:34'),
('DF407714-E143-421C-AFC3-6C471AB2800B', '11906222', 'CREDIT_CARD', 'AVAILABLE', 15, '2019-12-30 06:27:28'),
('F807D9E7-D19D-4A7D-86D6-C182EBAD9302', 'leobaiano', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-30 07:42:01'),
('33A65070-40BB-4BD3-836B-D7BC94C47CC6', 'leobaiano', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-30 07:44:07'),
('78AFD7BF-03B2-4BC2-AE90-030BD4D1737A', 'leobaiano', 'CREDIT_CARD', 'CANCELLED', 10, '2019-12-30 17:55:36'),
('E648D24B-9B8D-429C-ACD8-399EC4A6BBC0', 'igorjac', 'CREDIT_CARD', 'AVAILABLE', 5, '2019-12-31 05:39:39'),
('8B219F3A-D7C5-4DBB-87E3-0CDE4CB6507D', 'altdelt', 'BOLETO', 'WAITING_PAYMENT', 10, '2019-12-31 05:40:06'),
('E9A78D15-B225-4B26-B9D5-B0704E764204', 'igorjac', 'CREDIT_CARD', 'AVAILABLE', 50, '2019-12-31 05:42:59'),
('A9ED9CA5-9FDE-418A-BFAD-9613281B2E18', 'brazom001', 'BOLETO', 'DELIVERED', 20, '2019-12-31 07:47:50'),
('807B7E22-F777-4BEE-AD6F-602FE03442BA', 'zedeath', 'CREDIT_CARD', 'WAITING_PAYMENT', 60, '2019-12-31 12:29:58'),
('02C1B722-CD52-4471-9392-309271366F2A', 'zedeath', 'CREDIT_CARD', 'DELIVERED', 60, '2020-01-01 03:19:06'),
('8123DAF7-CC8F-4D43-BEA7-7FF083B76D95', '56199433', 'CREDIT_CARD', 'DELIVERED', 20, '2020-01-01 22:55:29'),
('63796BD5-223D-4D90-9300-6B1FB3E94E5D', 'wellington', 'CREDIT_CARD', 'AVAILABLE', 5, '2020-01-02 04:36:36'),
('556F6C54-344E-4CF2-92F7-EC465020336B', '121582', 'CREDIT_CARD', 'CANCELLED', 130, '2020-01-02 05:14:12'),
('67EF3F98-EBE2-4EEE-9B30-87BF63B0AE13', '121582', 'CREDIT_CARD', 'WAITING_PAYMENT', 130, '2020-01-02 05:28:24'),
('807B7E22-F777-4BEE-AD6F-602FE03442BA', 'zedeath', 'CREDIT_CARD', 'CANCELLED', 60, '2020-01-02 12:31:06'),
('E33AF1E9-5822-41D8-AFD9-EA44BAD9ADBB', 'myzuru25', 'CREDIT_CARD', 'AVAILABLE', 20, '2020-01-03 04:01:42'),
('9E94426B-C5D3-476E-A219-DF71F61026E4', 'azs1234567', 'CREDIT_CARD', 'AVAILABLE', 20, '2020-01-03 04:11:21'),
('3C90A450-3045-4D71-B038-57D115A19E01', 'myzuru25', 'CREDIT_CARD', 'AVAILABLE', 100, '2020-01-03 04:15:52'),
('66250F21-AC2A-4D99-9A28-C4F896B135C6', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 50, '2020-01-03 05:12:31'),
('5D11DC04-AB1C-49D7-BC82-7D200C616F0A', 'Gabrilll', 'BOLETO', 'AVAILABLE', 10, '2020-01-03 05:28:53'),
('5D8F8DF3-F9B2-4E01-92A0-3F157FD4A50E', 'Gabrilll', 'BOLETO', 'AVAILABLE', 40, '2020-01-03 05:30:09'),
('C2A1EDD7-D9AD-43AA-82BD-D601E7A2D8A5', 'wellington', 'CREDIT_CARD', 'AVAILABLE', 20, '2020-01-03 05:47:27'),
('0A251758-305A-4C86-ACCF-C279EDE9635D', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 40, '2020-01-03 06:10:25'),
('9D56502C-FDD8-4610-A24D-C58B84946ABD', 'azs1234567', 'BOLETO', 'AVAILABLE', 14, '2020-01-04 04:46:12'),
('67EF3F98-EBE2-4EEE-9B30-87BF63B0AE13', '121582', 'CREDIT_CARD', 'CANCELLED', 130, '2020-01-04 05:31:06'),
('BC48F690-E9EC-4E2F-BBEA-C833C9808F93', 'italobb', 'CREDIT_CARD', 'CANCELLED', 5, '2020-01-04 12:26:25'),
('3DB90F3E-3303-4AD1-888D-160AEEE662A5', 'azs1234567', 'CREDIT_CARD', 'AVAILABLE', 6, '2020-01-05 06:15:16'),
('09822D6E-82D9-4C26-A0F0-3B1FD41C01A4', 'azs1234567', 'BOLETO', 'CANCELLED', 15, '2020-01-05 10:40:38'),
('71F87C2A-7EE3-48D1-9D6D-B0FA07576688', 'azs1234567', 'BOLETO', 'CANCELLED', 14, '2020-01-05 10:41:16'),
('0837E8FB-F29A-49EF-8E76-CBCF4505BB32', 'bonanza', 'BOLETO', 'CANCELLED', 19, '2020-01-05 10:48:27'),
('8163354D-A99D-4A0C-87AD-52A6D9107FEE', 'myzuru25', 'CREDIT_CARD', 'AVAILABLE', 60, '2020-01-06 05:58:18'),
('8EE1195E-DEF0-4097-9CC6-98924B3B416F', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 25, '2020-01-07 03:07:26'),
('053B26DB-3370-43FE-A87A-53BCA4C7D1C7', 'lipark', 'BOLETO', 'AVAILABLE', 80, '2020-01-07 03:13:31'),
('2E29CC38-E06B-4CF2-8F18-84E0C9BC9D80', 'myzuru25', 'CREDIT_CARD', 'AVAILABLE', 30, '2020-01-08 02:54:39'),
('754A4F55-FEA7-4CB7-AB66-84ACD3730AB6', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 10, '2020-01-08 04:07:08'),
('CC5C1CD1-7076-4331-BCD4-39E55D3C4119', '56199433', 'CREDIT_CARD', 'DELIVERED', 40, '2020-01-08 06:52:49'),
('A198B7C7-AF9E-4DAE-9A56-B339904EAF97', '180295', 'BOLETO', 'AVAILABLE', 40, '2020-01-08 07:35:43'),
('8AA6EB49-4DB8-48E3-BACA-20409CEEC4A5', 'zedeath', 'CREDIT_CARD', 'DELIVERED', 50, '2020-01-08 09:37:28'),
('A73E23B2-3571-4E2E-A741-D0515AB0E82C', 'brazom001', 'BOLETO', 'CANCELLED', 20, '2020-01-09 08:58:27'),
('B83DE745-478E-47B0-8BBF-D70A8B0403E9', '88715861', 'BOLETO', 'WAITING_PAYMENT', 100, '2020-01-09 18:30:33'),
('EC785D75-A7DE-403B-9CC2-5BFD6BAA87FE', '96198081mf', 'CREDIT_CARD', 'AVAILABLE', 100, '2020-01-10 02:37:11'),
('65210C85-CD0F-49A8-A311-98050B644828', '180295', 'CREDIT_CARD', 'AVAILABLE', 20, '2020-01-10 02:39:52'),
('153342C7-9891-4934-B16C-5875CF353760', '88715861', 'BOLETO', 'AVAILABLE', 30, '2020-01-10 03:24:17'),
('5285C92C-A8EF-4DCF-93C8-8F5D1D0E64C7', 'brazom001', 'BOLETO', 'AVAILABLE', 20, '2020-01-10 03:24:27'),
('26B4697D-A60F-405B-A6FA-6615DAAB680A', '710338', 'BOLETO', 'AVAILABLE', 25, '2020-01-10 03:24:48'),
('B83DE745-478E-47B0-8BBF-D70A8B0403E9', '88715861', 'BOLETO', 'DELIVERED', 100, '2020-01-10 04:25:18'),
('72A91A49-F659-4DCC-B681-21DE17B7312F', 'brazom001', 'BOLETO', 'CANCELLED', 20, '2020-01-10 08:44:18'),
('EB7CF30D-63AC-40BA-B2CC-F11EC297E0B6', 'p9unuero', 'CREDIT_CARD', 'AVAILABLE', 25, '2020-01-11 02:00:35'),
('27E9EAB6-41CE-4755-8D4B-111C89278F7F', 'kabom1000', 'CREDIT_CARD', 'AVAILABLE', 50, '2020-01-11 02:13:24'),
('9D9CA8E8-9F35-4589-8791-B5C434DC2E59', 'brazom001', 'BOLETO', 'AVAILABLE', 15, '2020-01-11 05:09:08'),
('ADA23361-38CB-4FC9-82C6-065D2BF68ECE', 'coppet055', 'CREDIT_CARD', 'WAITING_PAYMENT', 10, '2020-01-11 16:04:18'),
('998BA1BF-4592-4521-A15F-DB09B341989A', 'leobaiano', 'CREDIT_CARD', 'AVAILABLE', 30, '2020-01-12 03:39:19'),
('3C7F1B6E-0EC9-4BAF-BFC7-D566A91A886E', '98801170', 'BOLETO', 'CANCELLED', 30, '2020-01-12 08:57:00'),
('D21C42B8-5BF2-4F7F-977A-5E52DD6F2F93', 'brazom001', 'BOLETO', 'CANCELLED', 20, '2020-01-12 09:21:05'),
('ADA23361-38CB-4FC9-82C6-065D2BF68ECE', 'coppet055', 'CREDIT_CARD', 'CANCELLED', 10, '2020-01-13 16:00:53'),
('A9ED9CA5-9FDE-418A-BFAD-9613281B2E18', 'brazom001', 'BOLETO', 'AVAILABLE', 20, '2020-01-14 02:04:08'),
('2656250A-56EB-436D-870F-4EA1937359F4', 'zedeath', 'CREDIT_CARD', 'DELIVERED', 60, '2020-01-14 15:03:37'),
('02C1B722-CD52-4471-9392-309271366F2A', 'zedeath', 'CREDIT_CARD', 'AVAILABLE', 60, '2020-01-15 02:41:57'),
('8123DAF7-CC8F-4D43-BEA7-7FF083B76D95', '56199433', 'CREDIT_CARD', 'AVAILABLE', 20, '2020-01-15 03:06:43'),
('2EA5C81C-D14E-498A-A02E-7A556F2B79E7', '11906222', 'CREDIT_CARD', 'DELIVERED', 5, '2020-01-15 09:16:16'),
('4D0B4997-998B-4A4F-A418-85AF7B7D7BBC', '11906222', 'CREDIT_CARD', 'DELIVERED', 5, '2020-01-15 09:17:15'),
('F1DA99AA-89E5-4F30-9BEA-84D74ED9E68C', '882569r', 'CREDIT_CARD', 'CANCELLED', 5, '2020-01-15 14:59:59'),
('D3B1B650-3899-4CF1-A9CF-75EBEFC4B43F', '882569r', 'CREDIT_CARD', 'CANCELLED', 5, '2020-01-15 15:01:08'),
('1624F700-D790-433D-81C0-E9244E8E1D7C', '882569r', 'CREDIT_CARD', 'CANCELLED', 40, '2020-01-15 15:18:52'),
('868630A9-A90D-4AE3-BB16-5C29630D1127', '882569r', 'CREDIT_CARD', 'CANCELLED', 5, '2020-01-15 17:21:41'),
('8B219F3A-D7C5-4DBB-87E3-0CDE4CB6507D', 'altdelt', 'BOLETO', 'CANCELLED', 10, '2020-01-16 09:26:39'),
('A73513F2-D538-4FC7-AABA-27C36F493F85', '7901cf55', 'CREDIT_CARD', 'DELIVERED', 10, '2020-01-16 21:55:06'),
('7BFCFC9F-82B5-47F1-B075-B1632CB1C9AE', 'diegom1002', 'CREDIT_CARD', 'DELIVERED', 5, '2020-01-20 23:59:54'),
('8AA6EB49-4DB8-48E3-BACA-20409CEEC4A5', 'zedeath', 'CREDIT_CARD', 'AVAILABLE', 50, '2020-01-22 04:15:10'),
('CC5C1CD1-7076-4331-BCD4-39E55D3C4119', '56199433', 'CREDIT_CARD', 'AVAILABLE', 40, '2020-01-22 04:21:38'),
('B83DE745-478E-47B0-8BBF-D70A8B0403E9', '88715861', 'BOLETO', 'AVAILABLE', 100, '2020-01-24 03:31:11'),
('2656250A-56EB-436D-870F-4EA1937359F4', 'zedeath', 'CREDIT_CARD', 'AVAILABLE', 60, '2020-01-28 02:33:24'),
('4D0B4997-998B-4A4F-A418-85AF7B7D7BBC', '11906222', 'CREDIT_CARD', 'AVAILABLE', 5, '2020-01-29 03:32:56'),
('2EA5C81C-D14E-498A-A02E-7A556F2B79E7', '11906222', 'CREDIT_CARD', 'AVAILABLE', 5, '2020-01-29 03:32:57'),
('A73513F2-D538-4FC7-AABA-27C36F493F85', '7901cf55', 'CREDIT_CARD', 'AVAILABLE', 10, '2020-01-30 03:08:36'),
('7BFCFC9F-82B5-47F1-B075-B1632CB1C9AE', 'diegom1002', 'CREDIT_CARD', 'AVAILABLE', 5, '2020-02-03 03:08:22'),
('0DB5E333-52CF-4DEA-B85C-7319BF4DC22D', '85311790', 'CREDIT_CARD', 'DELIVERED', 5, '2020-02-13 06:53:59'),
('0DB5E333-52CF-4DEA-B85C-7319BF4DC22D', '85311790', 'CREDIT_CARD', 'AVAILABLE', 5, '2020-02-28 01:16:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `lookmount` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `marrystatus` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `exphist_lastexp` bigint(255) NOT NULL DEFAULT '0',
  `exphist1` bigint(255) NOT NULL DEFAULT '0',
  `exphist2` bigint(255) NOT NULL DEFAULT '0',
  `exphist3` bigint(255) NOT NULL DEFAULT '0',
  `exphist4` bigint(255) NOT NULL DEFAULT '0',
  `exphist5` bigint(255) NOT NULL DEFAULT '0',
  `exphist6` bigint(255) NOT NULL DEFAULT '0',
  `exphist7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimetoday` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime1` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime2` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime3` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime4` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime5` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime6` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimeall` bigint(255) NOT NULL DEFAULT '0',
  `auction_balance` int(15) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `nick_verify` varchar(5) NOT NULL,
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `show_outfit` int(11) NOT NULL DEFAULT '0',
  `show_eq` int(11) NOT NULL DEFAULT '0',
  `show_bars` int(11) NOT NULL DEFAULT '0',
  `show_skills` int(11) NOT NULL DEFAULT '0',
  `show_quests` int(11) NOT NULL DEFAULT '0',
  `stars` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `signature` text NOT NULL,
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `broadcasting` tinyint(4) DEFAULT '0',
  `viewers` int(1) DEFAULT '0',
  `ip` varchar(17) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `lookmount`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `pvp_blessing`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `marrystatus`, `promotion`, `deleted`, `description`, `exphist_lastexp`, `exphist1`, `exphist2`, `exphist3`, `exphist4`, `exphist5`, `exphist6`, `exphist7`, `onlinetimetoday`, `onlinetime1`, `onlinetime2`, `onlinetime3`, `onlinetime4`, `onlinetime5`, `onlinetime6`, `onlinetime7`, `onlinetimeall`, `auction_balance`, `created`, `nick_verify`, `old_name`, `hide_char`, `comment`, `show_outfit`, `show_eq`, `show_bars`, `show_skills`, `show_quests`, `stars`, `create_ip`, `create_date`, `signature`, `cast`, `castViewers`, `castDescription`, `offlinetraining_time`, `offlinetraining_skill`, `broadcasting`, `viewers`, `ip`) VALUES
(3, 'Account Manager', 0, 1, 1, 1, 1, 100, 100, 0, 0, 88, 88, 0, 134, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 500, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890460, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(7, 'Pan Deluxe', 0, 6, 2740, 661, 0, 98970, 98970, 4769943000, 0, 0, 0, 0, 1704, 0, 0, 151, 80920, 80920, 0, 100, 1, 1023, 1064, 8, '', 40910, 1, 1689004441, 16777343, 1, 0, 0, 0, '', 1689004916, 63, 0, 0, 151200000, 0, 90, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 0, 0, 0, 2130706433, 1411663305, '', 0, 0, '', 43200, -1, 0, 0, '127.0.0.1'),
(16, 'Sasuke Sample', 0, 1, 1, 1, 2, 100, 100, 0, 0, 500, 500, 0, 2, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 1688581097, 16777343, 1, 0, 0, 0, '', 1688581106, 31, 0, 0, 151152666, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '127.0.0.1'),
(17, 'Sakura Sample', 0, 1, 1, 1, 3, 100, 100, 0, 0, 500, 500, 0, 173, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(18, 'Lee Sample', 0, 1, 1, 1, 4, 100, 100, 0, 0, 500, 500, 0, 83, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(19, 'Neji Sample', 0, 1, 1, 1, 5, 100, 100, 0, 0, 500, 500, 0, 102, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(20, 'Tenten Sample', 0, 1, 1, 1, 6, 100, 100, 0, 0, 500, 500, 0, 308, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(21, 'Gaara Sample', 0, 1, 1, 1, 7, 100, 100, 0, 0, 500, 500, 0, 67, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(22, 'Kiba Sample', 0, 1, 1, 1, 8, 100, 100, 0, 0, 500, 500, 0, 50, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(23, 'Shikamaru Sample', 0, 1, 1, 1, 9, 100, 100, 0, 0, 500, 500, 0, 424, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(24, 'Chouji Sample', 0, 1, 1, 1, 10, 100, 100, 0, 0, 500, 500, 0, 433, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(2371, 'Kisame Sample', 0, 1, 1, 1, 21, 100, 100, 0, 0, 500, 500, 0, 551, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(2372, 'Konan Sample', 0, 1, 1, 1, 22, 100, 100, 0, 0, 500, 500, 0, 1614, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(2373, 'Temari Sample', 0, 1, 1, 1, 23, 100, 100, 0, 0, 500, 500, 0, 578, 0, 0, 1, 100, 100, 0, 100, 1, 1043, 1049, 5, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(2374, 'Pam', 0, 1, 2740, 501, 2, 50006, 50100, 2070900000, 0, 244, 244, 0, 2, 0, 0, 1, 50100, 50100, 0, 100, 1, 1041, 1054, 7, 0x010004000002ffffffff03401f00001a000000001b00000000fe010000800002ffffffff03b88800001a000000001b00000000fe, 26000, 1, 1688811112, 16777343, 1, 0, 0, 0, '', 1688811126, 31, 0, 0, 151175000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '127.0.0.1'),
(2375, 'Lawliet', 0, 1, 2740, 501, 2, 50100, 50100, 2070900000, 0, 244, 244, 0, 2, 0, 0, 1, 50100, 50100, 0, 100, 1, 1042, 1050, 6, '', 26000, 1, 1689001136, 16777343, 1, 0, 0, 1, '', 1689001141, 31, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 1688585553, '', 0, 0, '', 43200, -1, 0, 0, '127.0.0.1'),
(2376, 'Rikobe', 0, 1, 2740, 9, 2, 900, 900, 7480, 0, 244, 244, 0, 2, 0, 0, 1, 900, 900, 0, 100, 1, 1041, 1084, 7, '', 1400, 1, 1689005041, 16777343, 1, 0, 0, 0, '', 1689005040, 31, 0, 0, 150028333, 0, 100, 100, 25, 0, 0, 0, 1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 1688585964, '', 0, 0, '', 43200, -1, 0, 0, '127.0.0.1'),
(2377, 'Sasuke Test', 0, 1, 2740, 6, 2, 600, 600, 2540, 0, 244, 244, 0, 2, 0, 0, 1, 600, 600, 0, 100, 1, 1042, 1093, 7, '', 1250, 1, 1689004418, 16777343, 1, 0, 0, 0, '', 1689004441, 31, 0, 0, 150838000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 1688586061, '', 0, 0, '', 43200, -1, 0, 0, '127.0.0.1'),
(2378, 'Sske', 0, 1, 2740, 1, 2, 100, 100, 0, 0, 500, 500, 0, 2, 0, 0, 1, 100, 100, 0, 100, 1, 0, 0, 0, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 31, 0, 0, 151152666, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 1689617445, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(2379, 'Sasasasa', 0, 1, 2740, 1, 2, 100, 100, 0, 0, 500, 500, 0, 2, 0, 0, 1, 100, 100, 0, 100, 1, 0, 0, 0, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 31, 0, 0, 151152666, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1689657021, '', '', 0, '', 0, 0, 0, 0, 0, 0, 1689657021, 1689657021, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(2380, 'Mysql Eight', 0, 1, 2740, 1, 5, 100, 100, 0, 0, 500, 500, 0, 102, 0, 0, 1, 100, 100, 0, 100, 1, 0, 0, 0, '', 1000, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 25, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1689657220, '', '', 0, '', 0, 0, 0, 0, 0, 0, 1689657220, 1689657220, '', 0, 0, '', 43200, -1, 0, 0, '0');

--
-- Disparadores `players`
--
DELIMITER $$
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `oncreate_players_default_values` BEFORE INSERT ON `players` FOR EACH ROW SET new.created = UNIX_TIMESTAMP(NOW()), new.create_ip = UNIX_TIMESTAMP(NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
        UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `player_deaths`
--

INSERT INTO `player_deaths` (`id`, `player_id`, `date`, `level`) VALUES
(4, 7, 1552950531, 15),
(8, 7, 1564215711, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`, `serial`) VALUES
(7, 1, 101, 7759, 1, '', 'VZ93W-3G0TI-VGYX9-MR1P9'),
(7, 3, 102, 1999, 1, '', 'N8RZW-DXFTU-K72GS-P12HE'),
(7, 6, 103, 8927, 1, '', '00NQ4-MQCR1-QIY9U-S8CIL'),
(7, 7, 104, 7761, 1, '', 'VR30Z-M6N8Z-UUVFH-2CQUR'),
(7, 9, 105, 11322, 1, '', '937C9-826IN-07TX0-I6GB2'),
(7, 102, 106, 2152, 85, 0x0f55, '5YC4L-I6E5E-BFC8O-JMXHZ'),
(7, 102, 107, 11255, 1, 0x0f01, '9G7Y7-COOYC-EVZUF-MVWSC'),
(7, 102, 108, 11337, 1, '', '28MMR-4TR97-X9UNO-UDH9L'),
(7, 102, 109, 11331, 1, '', 'M6BTP-K7CF6-6CZ0O-33HRY'),
(7, 102, 110, 11329, 4, 0x0f04, 'GWEOU-K3CR8-11Y1F-5GKF6'),
(7, 102, 111, 2160, 100, 0x0f64, 'P0IH1-DZ90N-OR2QF-OJQDV'),
(7, 102, 112, 7620, 1, 0x0f01, 'IXJL6-N19K7-4FBN8-0OV1T'),
(7, 102, 113, 7618, 1, 0x0f01, '6EUC4-B32VC-NHZYX-2K1KH'),
(7, 102, 114, 2689, 19, 0x0f13, 'GJ4RE-83SJQ-WHEZJ-MFLS9'),
(7, 102, 115, 2648, 1, '', 'GUB5Z-8IJGJ-48445-QI0LU'),
(7, 102, 116, 2545, 1, 0x0f01, 'C0FGN-U0JXN-XRU3Q-3VHUN'),
(7, 102, 117, 2646, 1, '', 'O1Q3N-UORK4-S0J09-6V4FB'),
(7, 102, 118, 3969, 1, '', 'QV13E-6PTE3-SWQ0K-Z4WTN'),
(7, 102, 119, 2447, 1, '', 'JM2K6-9SD7C-NLFVQ-Y496N'),
(16, 1, 101, 2447, 1, 0x800100060073657269616c0117000000424e4b42332d335648345a2d32545443322d364f575453, 'BNKB3-3VH4Z-2TTC2-6OWTS'),
(16, 3, 102, 1999, 1, 0x800100060073657269616c011700000046344937432d38375a454a2d32544651522d31354d3652, 'F4I7C-87ZEJ-2TFQR-15M6R'),
(16, 4, 103, 3969, 1, 0x800100060073657269616c0117000000354a3632542d46305458472d5a483642552d57564e3945, '5J62T-F0TXG-ZH6BU-WVN9E'),
(16, 6, 104, 130, 1, 0x800100060073657269616c011700000032543636332d4a473338512d4e554550392d3855383249, '2T663-JG38Q-NUEP9-8U82I'),
(16, 7, 105, 114, 1, 0x800100060073657269616c011700000053593756582d574b5738562d55423353302d4950584b4f, 'SY7VX-WKW8V-UB3S0-IPXKO'),
(16, 8, 106, 2646, 1, 0x800100060073657269616c011700000055334959362d53473245462d455a3639442d324f563855, 'U3IY6-SG2EF-EZ69D-2OV8U'),
(16, 102, 107, 7620, 50, 0x0f32800100060073657269616c0117000000565a53374e2d4845585a372d54305557342d4831314c50, 'VZS7N-HEXZ7-T0UW4-H11LP'),
(16, 102, 108, 7618, 50, 0x0f32800100060073657269616c011700000045593759552d32305a56312d35514634592d5134533135, 'EY7YU-20ZV1-5QF4Y-Q4S15'),
(16, 102, 109, 2689, 20, 0x0f14800100060073657269616c011700000035314846382d51553246422d4c4d42355a2d4e585a4b46, '51HF8-QU2FB-LMB5Z-NXZKF'),
(16, 102, 110, 2648, 1, 0x800100060073657269616c0117000000464d3749382d36425356362d47483330382d524e4f3439, 'FM7I8-6BSV6-GH308-RNO49'),
(16, 102, 111, 2545, 1, 0x0f01800100060073657269616c011700000032364436502d394f5557372d4c4d37314d2d32594c4739, '26D6P-9OUW7-LM71M-2YLG9'),
(2374, 3, 101, 1999, 1, 0x800100060073657269616c01170000004c453233552d43355158432d474f424f582d4634325545, 'LE23U-C5QXC-GOBOX-F42UE'),
(2374, 6, 102, 130, 1, 0x800100060073657269616c011700000047353457422d4c3744324e2d5148594b452d343356444a, 'G54WB-L7D2N-QHYKE-43VDJ'),
(2374, 101, 103, 7620, 50, 0x0f32800100060073657269616c011700000031574a4e592d4e504b38582d4a445044372d484e38345a, '1WJNY-NPK8X-JDPD7-HN84Z'),
(2374, 101, 104, 7618, 50, 0x0f32800100060073657269616c01170000004d4f3553542d48584b47502d35364e554c2d49484f554d, 'MO5ST-HXKGP-56NUL-IHOUM'),
(2374, 101, 105, 2689, 20, 0x0f14800100060073657269616c01170000004a423051302d4d595642522d4f444250432d545a524b47, 'JB0Q0-MYVBR-ODBPC-TZRKG'),
(2374, 101, 106, 2648, 1, 0x800100060073657269616c011700000055355238562d4d575847592d5831335a4f2d4e38565543, 'U5R8V-MWXGY-X13ZO-N8VUC'),
(2374, 101, 107, 2545, 1, 0x0f01800100060073657269616c01170000005056504b522d51534c354b2d4a594e58572d584b563632, 'PVPKR-QSL5K-JYNXW-XKV62'),
(2374, 101, 108, 114, 1, 0x800100060073657269616c0117000000514b335a4e2d4d453857432d4f535144522d5230514857, 'QK3ZN-ME8WC-OSQDR-R0QHW'),
(2374, 101, 109, 2646, 1, 0x800100060073657269616c011700000051575458422d52464639552d30304f48572d5131444d35, 'QWTXB-RFF9U-00OHW-Q1DM5'),
(2374, 101, 110, 3969, 1, 0x800100060073657269616c011700000049524e54312d52563550342d36423630472d4350545256, 'IRNT1-RV5P4-6B60G-CPTRV'),
(2374, 101, 111, 2447, 1, 0x800100060073657269616c01170000004a544a54342d4b334a53312d58463853482d4b35324c54, 'JTJT4-K3JS1-XF8SH-K52LT'),
(2375, 1, 101, 2447, 1, 0x800100060073657269616c01170000004e4e4b46322d5930324d382d44484d4c342d4556553852, 'NNKF2-Y02M8-DHML4-EVU8R'),
(2375, 3, 102, 1999, 1, 0x800100060073657269616c01170000004f4b5438452d4d544348442d43464c5a462d3333564531, 'OKT8E-MTCHD-CFLZF-33VE1'),
(2375, 4, 103, 3969, 1, 0x800100060073657269616c011700000052554830422d4e543252572d52305631452d565a325537, 'RUH0B-NT2RW-R0V1E-VZ2U7'),
(2375, 6, 104, 130, 1, 0x800100060073657269616c011700000055423954462d4a364335472d4a5642564f2d3235363446, 'UB9TF-J6C5G-JVBVO-2564F'),
(2375, 7, 105, 114, 1, 0x800100060073657269616c011700000035344b52562d4c42364d432d504b4b4e572d4545434d30, '54KRV-LB6MC-PKKNW-EECM0'),
(2375, 8, 106, 2646, 1, 0x800100060073657269616c01170000005a4d57344b2d464947454d2d4d333739582d564b49384d, 'ZMW4K-FIGEM-M379X-VKI8M'),
(2375, 102, 107, 1999, 1, 0x800100060073657269616c01170000004458464d4a2d37433454372d52325451372d4a4f57474a, 'DXFMJ-7C4T7-R2TQ7-JOWGJ'),
(2375, 102, 108, 7620, 50, 0x0f32800100060073657269616c01170000005539504b4e2d354f4945342d4e5a5744582d4436364947, 'U9PKN-5OIE4-NZWDX-D66IG'),
(2375, 102, 109, 7618, 50, 0x0f32800100060073657269616c011700000036444934522d544f39374b2d58504a36342d425757544a, '6DI4R-TO97K-XPJ64-BWWTJ'),
(2375, 102, 110, 2689, 20, 0x0f14800100060073657269616c01170000005251434b552d394c43524b2d424a4747442d494e344735, 'RQCKU-9LCRK-BJGGD-IN4G5'),
(2375, 102, 111, 2648, 1, 0x800100060073657269616c011700000044573953342d31484a59482d3854394d462d44424f5937, 'DW9S4-1HJYH-8T9MF-DBOY7'),
(2375, 102, 112, 2545, 1, 0x0f01800100060073657269616c0117000000484d4b324d2d34563659312d53595a46442d3653304e46, 'HMK2M-4V6Y1-SYZFD-6S0NF'),
(2375, 107, 113, 7620, 50, 0x0f32800100060073657269616c0117000000564647545a2d3037374a502d5839304c502d56354e3430, 'VFGTZ-077JP-X90LP-V5N40'),
(2375, 107, 114, 7618, 50, 0x0f32800100060073657269616c0117000000363735364d2d50585049472d54524a304f2d4f33433432, '6756M-PXPIG-TRJ0O-O3C42'),
(2375, 107, 115, 2689, 20, 0x0f14800100060073657269616c011700000035544d48322d344d3835322d44504d4f552d5355344a55, '5TMH2-4M852-DPMOU-SU4JU'),
(2375, 107, 116, 130, 1, 0x800100060073657269616c011700000057385053392d3143335a462d304c4d50422d4d51385639, 'W8PS9-1C3ZF-0LMPB-MQ8V9'),
(2375, 107, 117, 2648, 1, 0x800100060073657269616c011700000032324e504e2d49463149362d35584449302d3836544758, '22NPN-IF1I6-5XDI0-86TGX'),
(2375, 107, 118, 2545, 1, 0x0f01800100060073657269616c01170000004b304249312d484e31344a2d575847494b2d574645444e, 'K0BI1-HN14J-WXGIK-WFEDN'),
(2375, 107, 119, 114, 1, 0x800100060073657269616c011700000058345545512d54564c39322d38505a58332d5952383950, 'X4UEQ-TVL92-8PZX3-YR89P'),
(2375, 107, 120, 2646, 1, 0x800100060073657269616c011700000034375457592d394e3952502d50574232492d4e4b475357, '47TWY-9N9RP-PWB2I-NKGSW'),
(2375, 107, 121, 3969, 1, 0x800100060073657269616c011700000043304a42332d4c4a39424f2d55453638382d4f354d4447, 'C0JB3-LJ9BO-UE688-O5MDG'),
(2375, 107, 122, 2447, 1, 0x800100060073657269616c011700000034445257392d504a5359332d34574c494f2d3648575738, '4DRW9-PJSY3-4WLIO-6HWW8'),
(2376, 1, 101, 2447, 1, '', 'C6DKN-0OJ26-K2GT4-Z06NT'),
(2376, 3, 102, 1999, 1, '', 'OHLPX-0BR4T-KPNEL-F6V8U'),
(2376, 4, 103, 3969, 1, '', 'DTWTB-N4DWL-RC3K0-XZBZ9'),
(2376, 6, 104, 130, 1, '', 'U2RH3-DD4NF-BH7IY-6FWMI'),
(2376, 7, 105, 114, 1, '', '0YN3O-50LFU-PNGHJ-SC4CQ'),
(2376, 8, 106, 2646, 1, '', '2EYXE-JEXG8-MTVF9-RF7E3'),
(2376, 102, 107, 1999, 1, '', 'MT0TM-9DDST-RF80B-P7C7Q'),
(2376, 102, 108, 7620, 50, 0x0f32, 'ZGCBD-8NJEE-NJLGV-2RY8F'),
(2376, 102, 109, 7618, 50, 0x0f32, 'GCIMY-H9XLY-ITY8E-ZGIGI'),
(2376, 102, 110, 2689, 19, 0x0f13, 'B14BT-FTD8Y-H31LH-JGZ70'),
(2376, 102, 111, 2648, 1, '', 'FNG80-5ZOFR-YQL99-FEE7G'),
(2376, 102, 112, 2545, 1, 0x0f01, 'XYJWU-824SD-HIOID-JJNQL'),
(2376, 107, 113, 7620, 50, 0x0f32, 'TNGPJ-WQJVF-OGKT0-ON3BX'),
(2376, 107, 114, 7618, 50, 0x0f32, 'S9660-GNVEV-HEH1P-O4LKX'),
(2376, 107, 115, 2689, 20, 0x0f14, 'ONFP4-PBUDE-TR4Q3-5MDBN'),
(2376, 107, 116, 130, 1, '', 'RHC9T-F0XYI-ND7O2-8D160'),
(2376, 107, 117, 2648, 1, '', 'U3VM3-SJEM9-6QPNL-PG1R6'),
(2376, 107, 118, 2545, 1, 0x0f01, 'OZNOF-C5INO-7O599-FJE18'),
(2376, 107, 119, 114, 1, '', 'JOYFO-0SHMF-Z2ZX6-DCIJY'),
(2376, 107, 120, 2646, 1, '', 'CD5ZB-ZY2TV-JO4XQ-JBCY5'),
(2376, 107, 121, 3969, 1, '', 'BZ3WP-RT5YE-PQJ08-21B8T'),
(2376, 107, 122, 2447, 1, '', '301GG-ENZL8-3H3NN-UQ4EC'),
(2377, 1, 101, 2447, 1, '', 'F19LY-YUJJD-L0UQ2-PUIK8'),
(2377, 3, 102, 1999, 1, '', 'INSLR-WTDGG-QL01F-XEQ3S'),
(2377, 4, 103, 3969, 1, '', 'JIJ9J-ZTLRN-8UXUO-E4PF8'),
(2377, 6, 104, 130, 1, '', 'BWNL8-4HWGQ-BB7NL-2T6X9'),
(2377, 7, 105, 114, 1, '', 'EKRSK-5ZHLZ-BUYGB-EEY81'),
(2377, 8, 106, 2646, 1, '', 'HQNV2-M14W5-RBXOF-36T0V'),
(2377, 102, 107, 1999, 1, '', 'EOTIH-UQQXR-O70NI-B0VIR'),
(2377, 102, 108, 7620, 50, 0x0f32, 'H91UP-O3S95-YSI37-P44XZ'),
(2377, 102, 109, 7618, 50, 0x0f32, 'O6VHX-9EO7G-XRQKU-5V7JD'),
(2377, 102, 110, 2689, 20, 0x0f14, 'V5OKO-MVS4H-THBBT-NKCDV'),
(2377, 102, 111, 2648, 1, '', 'N3Q8F-MZQMC-S1RXK-P7CNL'),
(2377, 102, 112, 2545, 1, 0x0f01, '9WYVQ-IX3H7-2U1WT-09X8G'),
(2377, 107, 113, 7620, 50, 0x0f32, 'SPLP9-CN6IB-8JEMO-VCFUV'),
(2377, 107, 114, 7618, 50, 0x0f32, 'K0DHY-V0LYX-U3CMC-I46NL'),
(2377, 107, 115, 2689, 20, 0x0f14, 'LKR2J-8SZJK-UYV3N-CDEXN'),
(2377, 107, 116, 130, 1, '', '96366-FVOO6-1X0MK-61G68'),
(2377, 107, 117, 2648, 1, '', 'IPY05-CPECC-TNGR3-3Y3IU'),
(2377, 107, 118, 2545, 1, 0x0f01, 'QDNET-GG3TS-0NYFG-VLEGS'),
(2377, 107, 119, 114, 1, '', 'BB4WG-P1HFL-QWMYB-390VW'),
(2377, 107, 120, 2646, 1, '', 'MYNTB-W591H-UTOVM-JOLNP'),
(2377, 107, 121, 3969, 1, '', '8ZOSE-GUQDT-KPGY3-71UX9'),
(2377, 107, 122, 2447, 1, '', '8FROE-CKM9U-ZVSOU-QWGE2'),
(2378, 1, 101, 2447, 1, 0x800100060073657269616c0117000000424e4b42332d335648345a2d32545443322d364f575453, ''),
(2378, 3, 102, 1999, 1, 0x800100060073657269616c011700000046344937432d38375a454a2d32544651522d31354d3652, ''),
(2378, 4, 103, 3969, 1, 0x800100060073657269616c0117000000354a3632542d46305458472d5a483642552d57564e3945, ''),
(2378, 6, 104, 130, 1, 0x800100060073657269616c011700000032543636332d4a473338512d4e554550392d3855383249, ''),
(2378, 7, 105, 114, 1, 0x800100060073657269616c011700000053593756582d574b5738562d55423353302d4950584b4f, ''),
(2378, 8, 106, 2646, 1, 0x800100060073657269616c011700000055334959362d53473245462d455a3639442d324f563855, ''),
(2378, 102, 107, 7620, 50, 0x0f32800100060073657269616c0117000000565a53374e2d4845585a372d54305557342d4831314c50, ''),
(2378, 102, 108, 7618, 50, 0x0f32800100060073657269616c011700000045593759552d32305a56312d35514634592d5134533135, ''),
(2378, 102, 109, 2689, 20, 0x0f14800100060073657269616c011700000035314846382d51553246422d4c4d42355a2d4e585a4b46, ''),
(2378, 102, 110, 2648, 1, 0x800100060073657269616c0117000000464d3749382d36425356362d47483330382d524e4f3439, ''),
(2378, 102, 111, 2545, 1, 0x0f01800100060073657269616c011700000032364436502d394f5557372d4c4d37314d2d32594c4739, ''),
(2379, 1, 101, 2447, 1, 0x800100060073657269616c0117000000424e4b42332d335648345a2d32545443322d364f575453, ''),
(2379, 3, 102, 1999, 1, 0x800100060073657269616c011700000046344937432d38375a454a2d32544651522d31354d3652, ''),
(2379, 4, 103, 3969, 1, 0x800100060073657269616c0117000000354a3632542d46305458472d5a483642552d57564e3945, ''),
(2379, 6, 104, 130, 1, 0x800100060073657269616c011700000032543636332d4a473338512d4e554550392d3855383249, ''),
(2379, 7, 105, 114, 1, 0x800100060073657269616c011700000053593756582d574b5738562d55423353302d4950584b4f, ''),
(2379, 8, 106, 2646, 1, 0x800100060073657269616c011700000055334959362d53473245462d455a3639442d324f563855, ''),
(2379, 102, 107, 7620, 50, 0x0f32800100060073657269616c0117000000565a53374e2d4845585a372d54305557342d4831314c50, ''),
(2379, 102, 108, 7618, 50, 0x0f32800100060073657269616c011700000045593759552d32305a56312d35514634592d5134533135, ''),
(2379, 102, 109, 2689, 20, 0x0f14800100060073657269616c011700000035314846382d51553246422d4c4d42355a2d4e585a4b46, ''),
(2379, 102, 110, 2648, 1, 0x800100060073657269616c0117000000464d3749382d36425356362d47483330382d524e4f3439, ''),
(2379, 102, 111, 2545, 1, 0x0f01800100060073657269616c011700000032364436502d394f5557372d4c4d37314d2d32594c4739, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_killers`
--

CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_skills`
--

CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(16, 0, 10, 0),
(16, 1, 10, 0),
(16, 2, 10, 0),
(16, 3, 10, 0),
(16, 4, 10, 0),
(16, 5, 10, 0),
(16, 6, 10, 0),
(2374, 0, 10, 0),
(2374, 1, 10, 0),
(2374, 2, 10, 16),
(2374, 3, 10, 0),
(2374, 4, 10, 0),
(2374, 5, 10, 0),
(2374, 6, 10, 0),
(2375, 0, 10, 0),
(2375, 1, 10, 0),
(2375, 2, 11, 6),
(2375, 3, 10, 0),
(2375, 4, 10, 0),
(2375, 5, 10, 0),
(2375, 6, 10, 0),
(2376, 0, 10, 0),
(2376, 1, 10, 0),
(2376, 2, 14, 45),
(2376, 3, 10, 0),
(2376, 4, 10, 0),
(2376, 5, 10, 0),
(2376, 6, 10, 0),
(2377, 0, 10, 0),
(2377, 1, 10, 0),
(2377, 2, 13, 55),
(2377, 3, 10, 0),
(2377, 4, 10, 0),
(2377, 5, 10, 0),
(2377, 6, 10, 0),
(2378, 0, 10, 0),
(2378, 1, 10, 0),
(2378, 2, 10, 0),
(2378, 3, 10, 0),
(2378, 4, 10, 0),
(2378, 5, 10, 0),
(2378, 6, 10, 0),
(2379, 0, 10, 0),
(2379, 1, 10, 0),
(2379, 2, 10, 0),
(2379, 3, 10, 0),
(2379, 4, 10, 0),
(2379, 5, 10, 0),
(2379, 6, 10, 0),
(17, 0, 10, 0),
(17, 1, 10, 0),
(17, 2, 10, 0),
(17, 3, 10, 0),
(17, 4, 10, 0),
(17, 5, 10, 0),
(17, 6, 10, 0),
(18, 0, 10, 0),
(18, 1, 10, 0),
(18, 2, 10, 0),
(18, 3, 10, 0),
(18, 4, 10, 0),
(18, 5, 10, 0),
(18, 6, 10, 0),
(19, 0, 10, 0),
(19, 1, 10, 0),
(19, 2, 10, 0),
(19, 3, 10, 0),
(19, 4, 10, 0),
(19, 5, 10, 0),
(19, 6, 10, 0),
(20, 0, 10, 0),
(20, 1, 10, 0),
(20, 2, 10, 0),
(20, 3, 10, 0),
(20, 4, 10, 0),
(20, 5, 10, 0),
(20, 6, 10, 0),
(21, 0, 10, 0),
(21, 1, 10, 0),
(21, 2, 10, 0),
(21, 3, 10, 0),
(21, 4, 10, 0),
(21, 5, 10, 0),
(21, 6, 10, 0),
(22, 0, 10, 0),
(22, 1, 10, 0),
(22, 2, 10, 0),
(22, 3, 10, 0),
(22, 4, 10, 0),
(22, 5, 10, 0),
(22, 6, 10, 0),
(23, 0, 10, 0),
(23, 1, 10, 0),
(23, 2, 10, 0),
(23, 3, 10, 0),
(23, 4, 10, 0),
(23, 5, 10, 0),
(23, 6, 10, 0),
(24, 0, 10, 0),
(24, 1, 10, 0),
(24, 2, 10, 0),
(24, 3, 10, 0),
(24, 4, 10, 0),
(24, 5, 10, 0),
(24, 6, 10, 0),
(2371, 0, 10, 0),
(2371, 1, 10, 0),
(2371, 2, 10, 0),
(2371, 3, 10, 0),
(2371, 4, 10, 0),
(2371, 5, 10, 0),
(2371, 6, 10, 0),
(2372, 0, 10, 0),
(2372, 1, 10, 0),
(2372, 2, 10, 0),
(2372, 3, 10, 0),
(2372, 4, 10, 0),
(2372, 5, 10, 0),
(2372, 6, 10, 0),
(2373, 0, 10, 0),
(2373, 1, 10, 0),
(2373, 2, 10, 0),
(2373, 3, 10, 0),
(2373, 4, 10, 0),
(2373, 5, 10, 0),
(2373, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_statements`
--

CREATE TABLE `player_statements` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `player_statements`
--

INSERT INTO `player_statements` (`id`, `player_id`, `channel_id`, `text`, `date`) VALUES
(1, 7, 0, '!bless', 1688418525),
(2, 7, 0, '!bless', 1688418723),
(3, 7, 0, '!bless', 1688418731),
(4, 7, 0, '!bless', 1688418736),
(5, 7, 0, '!bless', 1688418742),
(6, 7, 0, '!bless', 1688418768),
(7, 7, 0, '!bless', 1688418772),
(8, 7, 0, 'hi', 1688419280),
(9, 7, 0, 'trade', 1688419281),
(10, 7, 0, 'viagem', 1688419282),
(11, 7, 0, 'konohagakure', 1688419286),
(12, 7, 0, 'sim', 1688419288),
(13, 7, 0, '!bless', 1688419301),
(14, 7, 0, '!aol', 1688419302),
(15, 7, 0, '!jutus', 1688419307),
(16, 7, 0, '!commands', 1688419315),
(17, 7, 0, '!command', 1688419316),
(18, 7, 0, 'hi', 1688419318),
(19, 7, 0, 'viagem', 1688419321),
(20, 7, 0, 'getsugakure', 1688419324),
(21, 7, 0, 'sim', 1688419326),
(22, 7, 0, 't', 1688419363),
(23, 7, 0, '!bless', 1688432501),
(24, 7, 0, '!bless', 1688433617),
(25, 7, 0, '!bless', 1688433660),
(26, 7, 0, '!bless', 1688433804),
(27, 7, 0, '!bless', 1688433838),
(28, 7, 0, '!bless', 1688433859),
(29, 7, 0, '!bless', 1688433941),
(30, 7, 0, '!bless', 1688434143),
(31, 7, 0, '!bless', 1688434155),
(32, 7, 0, '!bless', 1688434167),
(33, 7, 0, '!bless', 1688434177),
(34, 7, 0, '!bless', 1688434182),
(35, 7, 0, '!bless', 1688434188),
(36, 7, 0, '!bless', 1688434229),
(37, 7, 0, '!bless', 1688434233),
(38, 7, 0, '!bless', 1688434396),
(39, 7, 0, '!bless', 1688434420),
(40, 7, 0, '!bless', 1688434436),
(41, 7, 0, '!bless', 1688434478),
(42, 7, 0, '!bless', 1688434661),
(43, 7, 0, '!bless', 1688434812),
(44, 7, 0, '!bless', 1688434827),
(45, 7, 0, 'waaaa', 1688435707),
(46, 7, 0, '!bless', 1688435764),
(47, 7, 0, '!bless', 1688435843),
(48, 7, 0, '!bless', 1688436644),
(49, 7, 0, '!bless', 1688452220),
(50, 7, 0, '!bless', 1688452226),
(51, 7, 0, '!bless', 1688452266),
(52, 7, 0, '!bless', 1688452577),
(53, 7, 0, '!bless', 1688453008),
(54, 7, 0, '!bless', 1688453123),
(55, 7, 0, '!bless', 1688453133),
(56, 7, 0, '!bless', 1688453398),
(57, 7, 0, '!bless', 1688453404),
(58, 7, 0, '!bless', 1688453924),
(59, 7, 0, 'aaaaaaaaaaaaaaaaa', 1688458812),
(60, 7, 0, '/addskill pan deluxe, 500', 1688459245),
(61, 7, 0, '/addskill pan deluxe, 500', 1688459267),
(62, 7, 0, 'ssssss', 1688459398),
(63, 7, 0, 'chakra feet', 1688487493),
(64, 7, 0, 'chakra feet', 1688487493),
(65, 7, 0, 'chakra feet', 1688487494),
(66, 7, 0, 'chakra feet', 1688487494),
(67, 7, 0, 'chakra feet', 1688487495),
(68, 7, 0, '!bless', 1688512535),
(69, 7, 0, '!bless', 1688512562),
(70, 7, 0, '!bless', 1688512590),
(71, 7, 0, '!bless', 1688512639),
(72, 7, 0, '!bless', 1688512664),
(73, 7, 0, '!bless', 1688513544),
(74, 7, 0, '!bless', 1688513682),
(75, 7, 0, '!stamina off', 1688513690),
(76, 16, 0, 'utani sonic hur', 1688513781),
(77, 16, 0, 'utani sonic hur', 1688513782),
(78, 16, 0, 'utani sonic hur', 1688513782),
(79, 16, 0, 'utani sonic hur', 1688513783),
(80, 16, 0, 'utani sonic hur', 1688513783),
(81, 7, 0, '!bless', 1688513786),
(82, 7, 0, '!bless', 1688579778),
(83, 2375, 0, 'utani sonic hur', 1688585591),
(84, 2375, 0, 'utani sonic hur', 1688585592),
(85, 2375, 0, 'utani sonic hur', 1688585592),
(86, 2375, 0, 'utani sonic hur', 1688585593),
(87, 2375, 0, 'utani sonic hur', 1688585594),
(88, 2375, 0, 'utani sonic hur', 1688585594),
(89, 2375, 0, 'utani sonic hur', 1688585595),
(90, 2377, 0, 'transform', 1688586191),
(91, 2377, 0, 'transformar', 1688586193),
(92, 2377, 0, '!transform', 1688586195),
(93, 2377, 0, '/commands', 1688586198),
(94, 7, 0, '!bless', 1688587035),
(95, 7, 0, 'd', 1688587036),
(96, 7, 0, 'Exani Tera', 1688587247),
(97, 7, 0, 'Exani Tera', 1688587247),
(98, 7, 0, 'Exani Tera', 1688587247),
(99, 7, 0, 'Exani Tera', 1688587247),
(100, 7, 0, 'Exani Tera', 1688587247),
(101, 7, 0, 'Exani Tera', 1688587247),
(102, 7, 0, 'Exani Tera', 1688587248),
(103, 7, 0, 'susano', 1688587271),
(104, 7, 0, 'dww', 1688587379),
(105, 7, 0, 'hi', 1688597386),
(106, 7, 0, 'trade', 1688597387),
(107, 7, 0, 'hi', 1688597427),
(108, 7, 0, 'trade', 1688597428),
(109, 7, 0, 'hi', 1688597432),
(110, 7, 0, 'trade', 1688597433),
(111, 7, 0, 'hi', 1688597443),
(112, 7, 0, 'trade', 1688597444),
(113, 7, 0, 'hi', 1688597452),
(114, 7, 0, 'trade', 1688597453),
(115, 7, 0, 'hi', 1688597521),
(116, 7, 0, 'trade', 1688597522),
(117, 7, 0, 'hi', 1688597579),
(118, 7, 0, 'trade', 1688597580),
(119, 7, 0, 'hi', 1688597626),
(120, 7, 0, 'trade', 1688597627),
(121, 7, 0, '!bless', 1688597736),
(122, 7, 0, '!bless', 1688597757),
(123, 7, 0, '!bless', 1688608512),
(124, 7, 0, '!bless', 1688671800),
(125, 7, 0, '!bless', 1688672784),
(126, 7, 0, '!bless', 1688673396),
(127, 7, 0, '!bless', 1688673489),
(128, 7, 0, '!bless', 1688809656),
(129, 7, 0, '!bless', 1688810957),
(130, 7, 0, '!bless', 1688811070),
(131, 7, 0, '!bless', 1688811132),
(132, 7, 0, '!bless', 1689000205),
(133, 2376, 0, 'utani sonic hur', 1689000504),
(134, 2376, 0, 'utani sonic hur', 1689000504),
(135, 2376, 0, 'Cyclone', 1689000505),
(136, 2376, 0, 'Cyclone', 1689000505),
(137, 2376, 0, 'Cyclone', 1689000505),
(138, 2376, 0, 'Cyclone', 1689000505),
(139, 2376, 0, 'utani sonic hur', 1689000505),
(140, 2376, 0, 'Cyclone', 1689000509),
(141, 2376, 0, 'Cyclone', 1689000509),
(142, 2376, 0, 'chakra feet', 1689000769),
(143, 7, 0, '!bless', 1689000996),
(144, 7, 0, 'hi', 1689001022),
(145, 7, 0, 'trade', 1689001023),
(146, 2376, 0, 'hi', 1689001070),
(147, 2376, 0, 'missao', 1689001072),
(148, 2376, 0, 'yes', 1689001076),
(149, 2376, 0, 'hi', 1689001077),
(150, 2376, 0, 'bye', 1689001079),
(151, 2376, 0, 'hi', 1689001079),
(152, 2376, 0, 'missao', 1689001081),
(153, 7, 0, '!bless', 1689001123),
(154, 7, 0, '!bless', 1689002674),
(155, 7, 0, '!bless', 1689002735),
(156, 2377, 0, 'throw shuriken', 1689003140),
(157, 2376, 0, 'ss', 1689004413),
(158, 2376, 0, 'wwww', 1689004414),
(159, 7, 0, '!bless', 1689004441);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(7, '', '1'),
(7, '13001', '1'),
(7, '13002', '1'),
(7, '13004', '1'),
(7, '19332', '0'),
(7, '199211', '1'),
(7, '2113', '1'),
(7, '2522', '1'),
(7, '25396', '1688587437'),
(7, '27001', '-1'),
(7, '27500', '-1'),
(7, '30220122041', '1'),
(7, '3424675', '0'),
(7, '3433301', '0'),
(7, '3482101', '0'),
(7, '3482103', '0'),
(7, '3482106', '0'),
(7, '3727678', '0'),
(7, '43333', '1688591045'),
(7, '43531', '1688418699'),
(7, '48903', '0'),
(7, '49708', '0'),
(7, '5221', '1689000399'),
(7, '611110', '1689086716'),
(7, '676628', '1688591326'),
(7, '72702', '0'),
(7, '8205', '1689001020'),
(16, '', '1'),
(16, '13001', '1'),
(16, '13002', '1'),
(16, '19332', '0'),
(16, '2113', '1'),
(16, '2522', '1'),
(16, '27001', '1'),
(16, '3424675', '0'),
(16, '3433301', '0'),
(16, '3727678', '0'),
(16, '49708', '0'),
(2374, '', '1'),
(2374, '13002', '1'),
(2374, '19332', '0'),
(2374, '2113', '1'),
(2374, '2522', '1'),
(2374, '27001', '-1'),
(2374, '27500', '-1'),
(2374, '3424675', '0'),
(2374, '3433301', '0'),
(2374, '3727678', '0'),
(2374, '49708', '0'),
(2375, '13001', '1'),
(2375, '19332', '0'),
(2375, '2113', '1'),
(2375, '2522', '1'),
(2375, '27001', '-1'),
(2375, '27500', '-1'),
(2375, '3424675', '0'),
(2375, '3433301', '0'),
(2375, '3727678', '0'),
(2375, '49708', '0'),
(2376, '', '1'),
(2376, '13001', '1'),
(2376, '13002', '1'),
(2376, '176201', '1'),
(2376, '19332', '0'),
(2376, '2113', '1'),
(2376, '2522', '1'),
(2376, '27001', '-1'),
(2376, '27500', '-1'),
(2376, '3424675', '0'),
(2376, '3433301', '0'),
(2376, '3727678', '0'),
(2376, '49708', '0'),
(2376, '66620', '1'),
(2376, '8205', '1689001094'),
(2377, '', '1'),
(2377, '13001', '1'),
(2377, '13002', '1'),
(2377, '19332', '0'),
(2377, '2113', '1'),
(2377, '2522', '1'),
(2377, '27001', '-1'),
(2377, '27500', '-1'),
(2377, '3424675', '0'),
(2377, '3433301', '0'),
(2377, '3727678', '0'),
(2377, '49708', '0'),
(2377, '66620', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_viplist`
--

CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `poll` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll_votes`
--

CREATE TABLE `poll_votes` (
  `poll_id` int(11) NOT NULL,
  `votes` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('encryption', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(96, 0, 'Bivenvenido!'),
(97, 0, 'Naruto Atom Online! Bom Jogo!'),
(98, 0, 'Bivenvenido!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(1, 0, 1688418502),
(2, 0, 1688459410);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiles`
--

CREATE TABLE `tiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `house_id` int(10) UNSIGNED NOT NULL,
  `x` int(5) UNSIGNED NOT NULL,
  `y` int(5) UNSIGNED NOT NULL,
  `z` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tile_items`
--

CREATE TABLE `tile_items` (
  `tile_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tourney`
--

CREATE TABLE `tourney` (
  `id` int(8) NOT NULL,
  `player_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `woe`
--

CREATE TABLE `woe` (
  `id` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zaypay_payment`
--

CREATE TABLE `zaypay_payment` (
  `payID` bigint(30) NOT NULL,
  `account_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_changelog`
--

CREATE TABLE `z_changelog` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_featured_article`
--

CREATE TABLE `z_featured_article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` tinyint(4) NOT NULL DEFAULT '1',
  `post_icon_id` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `icon_id`, `post_icon_id`) VALUES
(44, 44, 1579272424, 1, 0, 40, 2, 7, '<p style=\"text-align: center;\"><span style=\"font-size: large;\"><strong>NTO Hard - 2D RPG&nbsp;<span style=\"color: #00ff00;\">Online</span></strong></span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: small;\"><strong>[ + ] NOVO CLIENT 1.7 Evite DeBug P/ Download Clique <a href=\"client/NTOHard1_7.zip\">AQUI </a>!</strong></span></p>\r\n<address style=\"text-align: center;\"><span style=\"font-size: small;\"><strong>Quer saber mais ? Participe do nosso grupo no Discord !</strong></span></address>\r\n<p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<iframe src=\"https://discordapp.com/widget?id=603933288012316700&amp;theme=dark\" frameborder=\"0\" width=\"439\" height=\"344\"></iframe>&nbsp;</p>', 'NTO Hard Online !', 0, 1579272424, 0, 0, '200.101.116.222', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_monsters`
--

CREATE TABLE `z_monsters` (
  `hide_creature` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `gfx_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_network_box`
--

INSERT INTO `z_network_box` (`id`, `network_name`, `network_link`) VALUES
(1, 'facebook', 'MegaTibia.TibiaMax');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_news_big`
--

CREATE TABLE `z_news_big` (
  `hide_news` tinyint(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `topic_df` varchar(255) NOT NULL,
  `text_df` text NOT NULL,
  `topic_ot` varchar(255) NOT NULL,
  `text_ot` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_news_big`
--

INSERT INTO `z_news_big` (`hide_news`, `date`, `author`, `author_id`, `image_id`, `topic_df`, `text_df`, `topic_ot`, `text_ot`) VALUES
(1, 1352212684, '[ADM]-Beckman', 2240600, 4, 'Start MegaTibia', '</br><img src=\"images/letters/E.gif\" alt=\"\"/>stamos de volta galera, a pedidos de muitos e tambÃ©m uma imensa vontade prÃ³pria de toda a equipe, decidimos e conseguimos retornar com o <b>TibiaMax</b> ou pra outros <b>MegaTibia</b>. Temos grandes perspectivas de da tudo certo dessa vez, e tenho certeza que ajuda de todos vocÃªs nÃ£o vai faltar. Sem duvidas vocÃªs Ã© a peÃ§a fundamental pra tudo da certo e quero contar com todos vocÃªs, os que jÃ¡ participaram do servidor passado e de todos os novos players, os que estÃ£o com a agente e os ainda iram chegar, peÃ§o que divulguem o Server, que nos ajude a encontra os erros, para assim podermos ajustÃ¡-los.</br></br>\r\n<img src=\"images/letters/F.gif\" alt=\"\"/>izemos algumas alteraÃ§Ãµes sobre items vip, diminuÃ­mos danos e certos poderes, sei que muitos nÃ£o gostam de item vip no Server, mais sei tambÃ©m que no dia que os que nÃ£o gostam passarem a ter item vip irÃ£o muda de opiniÃ£o. NÃ£o mudamos muito, no mapa mesmo nÃ£o mechemos em nada, nÃ£o fizemos nenhuma alteraÃ§Ã£o de quest e scripts, ficamos com a versÃ£o do tÃ­bia 8.60 porque pra nÃ³s da Equipe TibiaMax Ã© a melhor versÃ£o de tÃ­bia comparada com a mais recentes e creio que vocÃªs tambÃ©m tenham a mesma opiniÃ£o.</br></br>\r\n<img src=\"images/letters/A.gif\" alt=\"\"/>tualmente utilizamos uma mega estrutura interna de um sistema operacional e componentes  favorÃ¡veis a um Ã³timo desempenho para o jogo. Utilizamos o sistema operacional <i>CentOS 6.3-64, Hynix 36GB DDR3 x8 memÃ³ria RAM, Uplink speed 10000 Mbps Force Full Speed, Dual Intel Xeon-Westmere 5670-Hexcore [2.93GHz], Drive Controller Mainboard  Onboard  SATAII Controller Western Digital WD RE4 WD1003FBYX 1000GB</i> e todo esse processo de sucesso graÃ§as a ajuda fundamental de um cara top Linux Brasil o <i>Joffily</i> conhecido tambÃ©m na Ã¡rea de OTServ como <i>Kel Serific</i> dono do <b>AlcatrazWolrd</b>.</br></br>\r\n<img src=\"images/letters/G.gif\" alt=\"\"/>alera mais informaÃ§Ãµes sobre o Server procurem em Server info, caso tenha duvidas nos envie um e-mail para <b>confirmacao@tibiamax.com</b>, nÃ£o perca tempo faÃ§a sua doaÃ§Ã£o e explore toda a Ã¡rea vip cheia de monster e respawns fora do normal, seja o top, seja o melhor pvp, participe da melhor guild, traga toda sua galera, monte suas battles, resumindo ta tudo ai, sÃ³ aproveitar e vamos nos ajudar para mantermos nossa diversÃ£o por vÃ¡rios dias meses e anos. Mais detalhes procurem a equipe estaremos disponÃ­veis ajudar pelo e-mail, vamos estÃ¡ mais ativos no e-mail do que in-game, talvez in-game fica sÃ³ tutores e sÃªnior tutores, utilizem sempre o help. Bom jogo e muita felicidade a todos nÃ³s!\r\n</br></br><center><font size=\"5\"><b>IP:</b> <i>venus.mega-tibia.net</i></font></center>', '.', '.'),
(0, 1388963764, '[ADM]-Beckman', 4867248, 0, 'MegaTibia ON-line', '</br><img src=\"images/letters/M.gif\" alt=\"\"/><b>egaTibia</b> <font color=\"#00CD00\"><b>ON-line</b></font>,sejam bem vindos todos os players, nosso servidor tem uma grande estrutura, muita diversÃ£o, wars, quests, ups, grandes guilds.\r\nFaÃ§a agora mesmo sua conta, convide seus amigos, monte seu team, nos ajude a divulgar nosso IP.</br></br>\r\n<img src=\"layouts/tibiacom/images/content/bullet.gif\">Fizemos algumas alteraÃ§Ãµes sobre items vip, diminuÃ­mos danos e certos poderes, sei que muitos nÃ£o gostam de item vip no Server, mais sei tambÃ©m que no dia que os que nÃ£o gostam passarem a ter item vip irÃ£o muda de opiniÃ£o. NÃ£o mudamos muito, no mapa mesmo nÃ£o mechemos em nada, nÃ£o fizemos nenhuma alteraÃ§Ã£o de quests e scripts, ficamos com a versÃ£o do tÃ­bia <b>8.60</b> porque pra nÃ³s da Equipe <b>MegaTibia</b> acreditamos ser a melhor versÃ£o de tÃ­bia comparada com a mais recentes e creio que vocÃªs tambÃ©m tenham a mesma opiniÃ£o.</br></br>\r\n<img src=\"layouts/tibiacom/images/content/bullet.gif\">Galera mais informaÃ§Ãµes sobre o Server procurem em Server info, caso tenha duvidas nos envie um e-mail para <b>confirmacao@megatibia.net</b>, nÃ£o perca tempo faÃ§a sua doaÃ§Ã£o e explore toda a Ã¡rea vip cheia de monster e respawns fora do normal, seja o top, seja o melhor pvp, participe da melhor guild, traga toda sua galera, monte suas battles, resumindo ta tudo ai, sÃ³ aproveitar e vamos nos ajudar para mantermos nossa diversÃ£o por vÃ¡rios dias meses e anos. Mais detalhes procurem-nos atravÃ©s do <u>e-mail</u>, vamos estÃ¡ mais ativos no <u>e-mail</u> do que <b>in-game</b>, talvez <b>in-game</b> fica sÃ³ <u>tutores</u> e <u>sÃªnior tutores</u>, utilizem sempre o help. Bom jogo e muita felicidade a todos nÃ³s!</br></br><center><font size=\"5\"><b>IP:</b> <i>venus.megatibia.net</i></font></center>', '.', '.'),
(0, 1391829766, '[ADM]-Beckman', 2101697, 0, 'Resetado!', '</br><img src=\"images/letters/R.gif\" alt=\"\"/>esetado, depois de alguns problemas, decepÃ§Ãµes, falhas e grandes ajustes, a Equipe decidiu resetar o servidor para renovar tudo e assim obter novamente o sucesso. </br>Nosso servidor mapa Global Ã© um dos melhores da Ã¡rea de OTserver, sem bugs, grandes hunts, raÃ§as equilibradas, uma imensa Ã¡rea de VIP com grandes respawns .</br> Agradecemos muito a todos que sempre nos ajudam divulgando o Server, a todos os players que jogam se divertem no nosso servidor, aqueles que sempre estÃ£o conosco como teams que sempre jogaram e jogam..</br>\r\nEsse Server Ã© pra valer, espero a colaboraÃ§Ã£o de todos que possam nos ajudar de todas as formas e mil desculpas pelas falhas passadas e mais uma vez agora Ã© pra valer. .</br>DÃªem suas sugestÃµes opiniÃµes e criticas estamos sempre ativos no e-mail, <b>confirmaÃ§Ã£o@megatibia.net</b>..</br>\r\nTodos os players que fizeram suas doaÃ§Ãµes terÃ£o seus pontos de volta e com a promoÃ§Ã£o, enviem-nos um e-mail para <b>confirmaÃ§Ã£o@megaitbia.net</b> e iremos confirmar seus dados para devolver seus pontos..</br></br>\r\n<i>Divirta-se!</i></br><center><font size=\"5\"><b>IP:</b> <i>venus.megatibia.net</i></font></center>', '.', '.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_news_tickers`
--

INSERT INTO `z_news_tickers` (`date`, `author`, `image_id`, `text`, `hide_ticker`) VALUES
(1, 0, 1, '<p style=\"text-align: center;\"><span style=\"font-size: large;\"><strong>Test&nbsp;Server</strong>&nbsp;-&nbsp;<strong>NTO Hard RPG Online !</strong></span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: small;\">&nbsp; &nbsp;Ol&aacute;, atualmente o servidor encontra-se em vers&atilde;o Test, sendo assim voc&ecirc; ter&aacute; acesso antecipado a todas as recompensas que est&atilde;o dispon&iacute;veis em nosso servidor.</span></p>\r\n<p><span style=\"font-size: small;\">&nbsp; &nbsp;A previs&atilde;o para reinaugura&ccedil;&atilde;o est&aacute; marcada para acontecer no final da primeira semana de julho, enquanto isso estamos dispon&iacute;veis para testar e &eacute; claro, aproveitar para conhecer melhor o jogo.</span></p>\r\n<p><span style=\"font-size: small;\">&nbsp; &nbsp;O servidor volta completamente diferente das vers&otilde;es passadas, caso voc&ecirc; queira entender melhor acesse o nosso forum, local espec&iacute;fico para comunica&ccedil;&atilde;o pr&oacute;xima entre a administra&ccedil;&atilde;o e jogadores.</span></p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: small;\"><a href=\"http://www.ntohard.forumeiros.com/\">http://www.ntohard.forumeiros.com</a></span></p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://oi64.tinypic.com/a1lf0g.jpg\" alt=\"\" width=\"251\" height=\"251\" /></p>\r\n<p>&nbsp;</p>', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_ots_guildcomunication`
--

CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shopguild_history_item`
--

CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `looktype` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_shopguild_offer`
--

INSERT INTO `z_shopguild_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`, `looktype`) VALUES
(1, 1, 2545, 1, 0, 0, 'item', 'shurikens', 'A Shuriken', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shop_history_pacc`
--

CREATE TABLE `z_shop_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_shop_history_pacc`
--

INSERT INTO `z_shop_history_pacc` (`id`, `to_name`, `to_account`, `from_nick`, `from_account`, `price`, `pacc_days`, `trans_state`, `trans_start`, `trans_real`) VALUES
(1, 'Rayleigh', 64, '', 64, 10, 30, 'realized', 1572718936, 1572718936),
(2, 'Belattrix', 182, '', 182, 10, 30, 'realized', 1572905597, 1572905597),
(3, 'Mascote', 181, '', 182, 10, 30, 'realized', 1572905607, 1572905607),
(4, 'Ames Ehh Rei', 209, '', 613, 10, 30, 'realized', 1572969996, 1572969996),
(5, 'One Above All', 621, '', 613, 10, 30, 'realized', 1572970109, 1572970109),
(6, 'Jorge Comecu', 656, '', 656, 10, 30, 'realized', 1573052511, 1573052511),
(7, 'Na Shikamaru', 572, '', 60, 10, 30, 'realized', 1573087028, 1573087028),
(8, 'Mythus', 12, '', 12, 10, 30, 'realized', 1573089128, 1573089128),
(9, 'Dzset Fmzk', 210, '', 613, 10, 30, 'realized', 1573158964, 1573158964),
(10, 'Uchiha Madara', 154, '', 154, 10, 30, 'realized', 1573163860, 1573163860),
(11, 'Pokawzesz Returns', 672, '', 672, 10, 30, 'realized', 1573247112, 1573247112),
(12, 'Come Meucu', 619, '', 60, 10, 30, 'realized', 1573253675, 1573253675),
(13, 'Theuszoly', 627, '', 182, 10, 30, 'realized', 1573304152, 1573304152),
(14, 'Chama No Zap', 385, '', 385, 10, 30, 'realized', 1573304599, 1573304599),
(15, 'Sabrina Spellman', 533, '', 533, 10, 30, 'realized', 1573306078, 1573306078),
(16, 'Zika Obscurion', 587, '', 587, 10, 30, 'realized', 1573547481, 1573547481),
(17, 'Amorizio', 6, '', 6, 10, 30, 'realized', 1574015701, 1574015701),
(18, 'Tsunade Marrentona', 174, '', 6, 10, 30, 'realized', 1574015795, 1574015795),
(19, 'Zika Health', 736, '', 736, 10, 30, 'realized', 1574188251, 1574188251),
(20, 'Agatsuma Zenitsu', 944, '', 944, 10, 30, 'realized', 1574192147, 1574192147),
(21, 'Kakashi', 306, '', 306, 10, 30, 'realized', 1574199587, 1574199587),
(22, 'Black Label', 963, '', 963, 10, 30, 'realized', 1574206670, 1574206670),
(23, 'Jonathanjohnes', 933, '', 933, 10, 30, 'realized', 1574217466, 1574217466),
(24, 'Bores', 1052, '', 352, 10, 30, 'realized', 1574387821, 1574387821),
(25, 'Papai Jon Voltou', 932, '', 932, 10, 30, 'realized', 1574420939, 1574420939),
(26, 'Madara Utimate', 923, '', 923, 10, 30, 'realized', 1574798497, 1574798497),
(27, 'Old Legend', 1219, '', 1219, 10, 30, 'realized', 1574807739, 1574807739),
(28, 'Coyote Sucessagem', 548, '', 548, 10, 30, 'realized', 1574808228, 1574808228),
(29, 'Roronoa Zoro', 991, '', 933, 10, 30, 'realized', 1574809954, 1574809954),
(30, 'Ruby', 1036, '', 1036, 10, 30, 'realized', 1574872520, 1574872520),
(31, 'Well Uchiha', 1468, '', 1468, 10, 30, 'realized', 1575533633, 1575533633),
(32, 'Gaara Capitalista', 71, '', 71, 10, 30, 'realized', 1575582831, 1575582831),
(33, 'Khada Jhin', 1023, '', 1023, 10, 30, 'realized', 1575638944, 1575638944),
(34, 'Eryke', 1173, '', 1173, 10, 30, 'realized', 1575769898, 1575769898),
(35, 'Khaos Sarutobi', 1593, '', 944, 10, 30, 'realized', 1575785232, 1575785232),
(36, 'Khaos Rinnegan', 944, '', 944, 10, 30, 'realized', 1575785272, 1575785272),
(37, 'Diego Mt', 1072, '', 1072, 10, 30, 'realized', 1575807128, 1575807128),
(38, 'Gaara Fodan', 1380, '', 1380, 10, 30, 'realized', 1575817090, 1575817090),
(39, 'Jinka', 1518, '', 1518, 10, 30, 'realized', 1575943742, 1575943742),
(40, 'Kiba', 1141, '', 1173, 10, 30, 'realized', 1576033127, 1576033127),
(41, 'Bazir', 1529, '', 1529, 10, 30, 'realized', 1576075859, 1576075859),
(42, 'Sweting', 887, '', 887, 10, 30, 'realized', 1576455163, 1576455163),
(43, 'Igor', 1023, '', 1023, 10, 30, 'realized', 1576489390, 1576489390),
(44, 'Poeira', 588, '', 588, 10, 30, 'realized', 1576645767, 1576645767),
(45, 'Oitorabos', 1895, '', 1895, 10, 30, 'realized', 1576864120, 1576864120),
(46, 'Dzset Fmzk', 210, '', 1468, 10, 30, 'realized', 1576864445, 1576864445),
(47, 'Djxxt Fmzk', 209, '', 1468, 10, 30, 'realized', 1576888511, 1576888511),
(48, 'Raszard', 431, '', 431, 10, 30, 'realized', 1577123198, 1577123198),
(49, 'Menino Rede', 1512, '', 1512, 10, 30, 'realized', 1577144848, 1577144848),
(50, 'Gabi Sz', 1430, '', 1430, 10, 30, 'realized', 1577191523, 1577191523),
(51, 'Ryndo', 2013, '', 2013, 10, 30, 'realized', 1577217279, 1577217279),
(52, 'Boguinha', 1837, '', 1837, 10, 30, 'realized', 1577443122, 1577443122),
(53, 'Minatoh', 2115, '', 2115, 10, 30, 'realized', 1577494538, 1577494538),
(54, 'Latye', 325, '', 325, 10, 30, 'realized', 1577570873, 1577570873),
(55, 'Fimose', 2193, '', 325, 10, 30, 'realized', 1577570985, 1577570985),
(56, 'Gordo De Obito', 2148, '', 2148, 10, 30, 'realized', 1577630470, 1577630470),
(57, 'Skt Sasuke', 320, '', 320, 10, 30, 'realized', 1577655400, 1577655400),
(58, 'Renegado', 115, '', 325, 10, 30, 'realized', 1577689223, 1577689223),
(59, 'Hawk', 390, '', 390, 10, 30, 'realized', 1577817528, 1577817528),
(60, 'Riick', 2262, '', 2262, 10, 30, 'realized', 1577848900, 1577848900),
(61, 'Spuky', 1996, '', 1996, 10, 30, 'realized', 1577919432, 1577919432),
(62, 'Renji Yomo', 2279, '', 2262, 10, 30, 'realized', 1577928005, 1577928005),
(63, 'Aquiles', 2226, '', 2226, 10, 30, 'realized', 1578059497, 1578059497),
(64, 'Skt Sakura', 676, '', 320, 10, 30, 'realized', 1578291648, 1578291648),
(65, 'Itz Crazy', 1458, '', 1318, 10, 30, 'realized', 1578555638, 1578555638),
(66, 'Narutinho', 1459, '', 1318, 10, 30, 'realized', 1578571150, 1578571150),
(67, 'Kraus', 1318, '', 1459, 10, 30, 'realized', 1578589583, 1578589583),
(68, 'Power Erguido', 2413, '', 1837, 10, 30, 'realized', 1578661520, 1578661520),
(69, 'Son Goku', 932, '', 932, 10, 30, 'realized', 1579087071, 1579087071),
(70, 'Faelzoor Flash', 431, '', 431, 10, 30, 'realized', 1579102671, 1579102671),
(71, 'Eaemyg', 1968, '', 1968, 10, 30, 'realized', 1579218984, 1579218984),
(72, 'Lula', 320, '', 320, 10, 30, 'realized', 1580269310, 1580269310),
(73, 'Themandrak', 2664, '', 2664, 10, 30, 'realized', 1582233640, 1582233640);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `looktype` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`, `looktype`) VALUES
(1, 10, 0, 30, 0, 0, 'pacc', 'Torne-se Premium Account durante 30 dias.', 'Premium Account', 0, 0),
(2, 5, 0, 0, 0, 0, 'redskull', 'Remova sua skull Red/Black.\r\n(Requer estar Offline)', 'Remove Red/Black Skull', 0, 0),
(3, 5, 0, 0, 0, 0, 'changename', 'Altere o nome de seu personagem.\r\n(Requer estar Offline)', 'Change Name', 0, 0),
(4, 10, 11231, 1, 0, 0, 'item', 'Item especial, troque por VIP Coin com o NPC Sarutobi.', 'Scroll 10 VIP Coin', 0, 0),
(5, 25, 11232, 1, 0, 0, 'item', 'Item especial, troque por VIP Coin com o NPC Sarutobi.', 'Scroll 25 VIP Coin', 0, 0),
(6, 50, 11233, 1, 0, 0, 'item', 'Item especial, troque por VIP Coin com o NPC Sarutobi.', 'Scroll 50 VIP Coin', 0, 0),
(7, 35, 2467, 1, 0, 0, 'item', 'Set Saga NÃ­vel 7 - ( Sem restriÃ§Ã£o de level p/ equipar )', 'Senju Protector', 0, 0),
(8, 35, 2463, 1, 0, 0, 'item', 'Set Saga NÃ­vel 7 - ( Sem restriÃ§Ã£o de level p/ equipar )', 'Senju Armor', 0, 0),
(9, 35, 2465, 1, 0, 0, 'item', 'Set Saga NÃ­vel 7 - ( Sem restriÃ§Ã£o de level p/ equipar )', 'Senju Legs', 0, 0),
(10, 35, 2470, 1, 0, 0, 'item', 'Set Saga NÃ­vel 7 - ( Sem restriÃ§Ã£o de level p/ equipar )', 'Senju Boots', 0, 0),
(11, 35, 2454, 1, 0, 0, 'item', 'Aprimore a versÃ£o do seu Senju p/ Ultimate Senju Set Saga NÃ­vel 8.', 'Senju Enchant', 0, 0),
(12, 35, 11434, 1, 0, 0, 'item', 'Atk: 295 (Requer level 60 p/ equipar)', 'Cetre Rikkudo', 0, 0),
(13, 25, 11424, 1, 0, 0, 'item', 'Atk: 265 (Requer level 60 p/ equipar)', 'Shibuki Sword', 0, 0),
(14, 25, 2376, 1, 0, 0, 'item', 'Atk: 265 (Requer level 60 p/ equipar)', 'Slayer Punho', 0, 0),
(15, 50, 2218, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Madara', 0, 0),
(16, 50, 2198, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Hashirama', 0, 0),
(17, 50, 2219, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Tobirama', 0, 0),
(18, 50, 2220, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Hiruzen', 0, 0),
(19, 50, 2221, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Minato', 0, 0),
(20, 50, 2222, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Tsunade', 0, 0),
(21, 50, 2201, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Kakashi', 0, 0),
(22, 50, 2338, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Naruto', 0, 0),
(26, 35, 11430, 1, 0, 0, 'item', 'Def: 175 + 10 % protect all', 'Juubi Shield', 0, 0),
(27, 25, 2170, 1, 0, 0, 'item', 'Full Blessing  + 250 Health p/s', 'Tsunade Amulet', 0, 0),
(29, 50, 11191, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Hidan', 0, 0),
(30, 50, 11190, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Obito', 0, 0),
(31, 50, 11192, 1, 0, 0, 'itemvip', 'Personagem Exclusivo ( + 10 % Dano Extra )', 'Scroll Killer Bee', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_shop_points_bought`
--

CREATE TABLE `z_shop_points_bought` (
  `id` int(15) NOT NULL,
  `amount` int(15) NOT NULL,
  `type` varchar(255) NOT NULL,
  `accountid` int(15) NOT NULL,
  `code` varchar(255) NOT NULL,
  `paypalmail` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_spells`
--

CREATE TABLE `z_spells` (
  `name` varchar(255) NOT NULL,
  `spell` varchar(255) NOT NULL,
  `spell_type` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `mlvl` int(11) NOT NULL DEFAULT '0',
  `soul` int(11) NOT NULL DEFAULT '0',
  `pacc` varchar(255) NOT NULL,
  `vocations` varchar(255) NOT NULL,
  `conj_count` int(11) NOT NULL DEFAULT '0',
  `hide_spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_tracker`
--

CREATE TABLE `z_tracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `typetracker` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Indices de la tabla `auction_system`
--
ALTER TABLE `auction_system`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Indices de la tabla `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD KEY `kill_id` (`kill_id`);

--
-- Indices de la tabla `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`);

--
-- Indices de la tabla `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`);

--
-- Indices de la tabla `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indices de la tabla `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_kills_ibfk_1` (`war_id`),
  ADD KEY `guild_kills_ibfk_2` (`death_id`),
  ADD KEY `guild_kills_ibfk_3` (`guild_id`);

--
-- Indices de la tabla `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indices de la tabla `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- Indices de la tabla `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Indices de la tabla `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `house_data`
--
ALTER TABLE `house_data`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`);

--
-- Indices de la tabla `house_lists`
--
ALTER TABLE `house_lists`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`);

--
-- Indices de la tabla `killers`
--
ALTER TABLE `killers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_id` (`death_id`);

--
-- Indices de la tabla `login_history`
--
ALTER TABLE `login_history`
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `lottery`
--
ALTER TABLE `lottery`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marriage_system`
--
ALTER TABLE `marriage_system`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `online` (`online`),
  ADD KEY `deleted` (`deleted`);

--
-- Indices de la tabla `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD PRIMARY KEY (`player_id`),
  ADD UNIQUE KEY `player_id` (`player_id`,`sid`);

--
-- Indices de la tabla `player_items`
--
ALTER TABLE `player_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_killers`
--
ALTER TABLE `player_killers`
  ADD KEY `kill_id` (`kill_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_skills`
--
ALTER TABLE `player_skills`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_statements`
--
ALTER TABLE `player_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indices de la tabla `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vip_id` (`vip_id`);

--
-- Indices de la tabla `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD KEY `poll_id` (`poll_id`);

--
-- Indices de la tabla `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Indices de la tabla `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Indices de la tabla `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`);

--
-- Indices de la tabla `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `player_id` (`player_id`);

--
-- Indices de la tabla `tiles`
--
ALTER TABLE `tiles`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD KEY `x` (`x`,`y`,`z`),
  ADD KEY `house_id` (`house_id`,`world_id`);

--
-- Indices de la tabla `tile_items`
--
ALTER TABLE `tile_items`
  ADD UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  ADD KEY `sid` (`sid`);

--
-- Indices de la tabla `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indices de la tabla `tourney`
--
ALTER TABLE `tourney`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `woe`
--
ALTER TABLE `woe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `zaypay_payment`
--
ALTER TABLE `zaypay_payment`
  ADD PRIMARY KEY (`payID`);

--
-- Indices de la tabla `z_changelog`
--
ALTER TABLE `z_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_featured_article`
--
ALTER TABLE `z_featured_article`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indices de la tabla `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shop_history_pacc`
--
ALTER TABLE `z_shop_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_shop_points_bought`
--
ALTER TABLE `z_shop_points_bought`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `z_tracker`
--
ALTER TABLE `z_tracker`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2741;

--
-- AUTO_INCREMENT de la tabla `auction_system`
--
ALTER TABLE `auction_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `guild_kills`
--
ALTER TABLE `guild_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `killers`
--
ALTER TABLE `killers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lottery`
--
ALTER TABLE `lottery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2381;

--
-- AUTO_INCREMENT de la tabla `player_deaths`
--
ALTER TABLE `player_deaths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `player_statements`
--
ALTER TABLE `player_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT de la tabla `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `server_reports`
--
ALTER TABLE `server_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tourney`
--
ALTER TABLE `tourney`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `woe`
--
ALTER TABLE `woe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `z_changelog`
--
ALTER TABLE `z_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_featured_article`
--
ALTER TABLE `z_featured_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `z_network_box`
--
ALTER TABLE `z_network_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=558;

--
-- AUTO_INCREMENT de la tabla `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_shop_history_pacc`
--
ALTER TABLE `z_shop_history_pacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `z_shop_points_bought`
--
ALTER TABLE `z_shop_points_bought`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `z_tracker`
--
ALTER TABLE `z_tracker`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Filtros para la tabla `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_statements`
--
ALTER TABLE `player_statements`
  ADD CONSTRAINT `player_statements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `polls`
--
ALTER TABLE `polls`
  ADD CONSTRAINT `polls_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
