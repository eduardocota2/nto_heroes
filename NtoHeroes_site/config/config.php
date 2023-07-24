<?PHP
# PAGE: donate.php
$config['site']['usePagseguro'] = true; //true show / false hide
$config['site']['usePaypal'] = true;	//true show / false hide
$config['site']['useDeposit'] = false;	//true show / false hide
$config['site']['useZaypay'] = false;	//true show / false hide
$config['site']['useContenidopago'] = false;	//true show / false hide
$config['site']['useOnebip'] = false;	//true show / false hide


$config['pagSeguro']['email'] = "roberto-games78@hotmail.com"; //Email Pagseguro
$config['pagSeguro']['token'] = "17dcb3a0-6d4b-4e12-98a8-0c1cc97d67eeeb1095534d25a11db082709083c3836bcef5-7775-4fc4-8362-364a4a9046ca"; // TOKEN
$config['pagSeguro']['urlRedirect'] = 'http://www.nto-hard.com/?subtopic=donate&action=final';
$config['pagSeguro']['urlNotification'] = 'http://www.nto-hard.com/retpagseguro.php';
$config['pagSeguro']['productName'] = 'Premium Points'; // Nome do produto que irá aparecer no pagseguro
$config['pagSeguro']['productValue'] = 1.00; // valor de cada ponto ex.: 0.50 = R$ 0,50 / 1.50 = R$ 1,50 ....
$config['pagSeguro']['doublePoints'] = false; // se true ativa double points / se false desativa
$config['pagSeguro']['host'] = 'localhost'; // host banco de dados
$config['pagSeguro']['database'] = 'nto_hard_test'; // nome do banco de dados
$config['pagSeguro']['databaseUser'] = 'root'; // usuario banco de dados
$config['pagSeguro']['databasePass'] = 'root123'; // senha banco de dados﻿

# Account Maker Config
$config['site']['serverPath'] = "/home/otx";
$config['site']['useServerConfigCache'] = false;
$config['site']['worlds'] = array(0 => 'Gesior ACC');
$towns_list[0] = array(1 => 'Konoha');

$config['site']['outfit_images_url'] = '/outfit.php';
$config['site']['item_images_url'] = 'http://item-images.ots.me/960/';
$config['site']['item_images_extension'] = '.gif';
$config['site']['flag_images_url'] = 'http://flag-images.ots.me/';
$config['site']['flag_images_extension'] = '.png';
$config['site']['players_group_id_block'] = 3;
$config['site']['limitDeath'] = 5;
$config['site']['levelVideo'] = 150;

# Create Account Options
$config['site']['one_email'] = false;
$config['site']['create_account_verify_mail'] = false;
$config['site']['verify_code'] = true;
$config['site']['email_days_to_change'] = 5;
$config['site']['newaccount_premdays'] = 3;
$config['site']['send_register_email'] = false;

# Create Character Options
$config['site']['newchar_vocations'][0] = array(2=>"Sasuke Sample", 3=>"Sakura Sample", 4=>"Lee Sample", 5=>"Neji Sample", 6=>"Tenten Sample", 7=>"Gaara Sample", 8=>"Kiba Sample", 9=>"Shikamaru Sample", 10=>"Chouji Sample", 21=>"Kisame Sample", 22=>"Konan Sample", 23=>"Temari Sample"); ## , 42=>"Boruto Sample", 43=>"Anbu Sample", 44=>"Sasori Sample", 45=>"Danzoo Sample", 46=>"Menma Sample"
$config['site']['newchar_towns'][0] = array(1);
$config['site']['max_players_per_account'] = 12;


# Emails Config
$config['site']['send_emails'] = true;
$config['site']['mail_address'] = "xxx@xxxx.com.br";
$config['site']['smtp_enabled'] = true;
$config['site']['smtp_host'] = "smtp.xxxxx.com.br";
$config['site']['smtp_port'] = 587;
$config['site']['smtp_auth'] = true;
$config['site']['smtp_user'] = "xxx@xxx.com.br";
$config['site']['smtp_pass'] = "xxx";

# PAGE: whoisonline.php
$config['site']['private-servlist.com_server_id'] = 1;
/*
Server id on 'private-servlist.com' to show Players Online Chart (whoisonline.php page), set 0 to disable Chart feature.
To use this feature you must register on 'private-servlist.com' and add your server.
Format: number, 0 [disable] or higher
*/

# PAGE: characters.php
$config['site']['quests'] = array('Annihilator' => 5000,'Demon Helmet' => 2645,'Pits of Inferno' => 5550);
$config['site']['show_skills_info'] = true;
$config['site']['show_vip_storage'] = 0;

# PAGE: accountmanagement.php
$config['site']['send_mail_when_change_password'] = true;
$config['site']['send_mail_when_generate_reckey'] = true;
$config['site']['generate_new_reckey'] = true;
$config['site']['generate_new_reckey_price'] = 500;

# PAGE: guilds.php
$config['site']['guild_need_level'] = 30;
$config['site']['guild_need_pacc'] = false;
$config['site']['guild_image_size_kb'] = 50;
$config['site']['guild_description_chars_limit'] = 2000;
$config['site']['guild_description_lines_limit'] = 6;
$config['site']['guild_motd_chars_limit'] = 250;

# PAGE: adminpanel.php
$config['site']['access_admin_panel'] = 3;
$config['site']['access_tickers'] = 3;
$config['site']['access_admin_painel'] = 3;
$config['site']['access_staff_painel'] = 3;

# PAGE: latestnews.php
$config['site']['news_limit'] = 6;

# PAGE: killstatistics.php
$config['site']['last_deaths_limit'] = 40;

# PAGE: team.php
$config['site']['groups_support'] = array(2, 3, 4, 5, 6, 7);

# PAGE: highscores.php
$config['site']['groups_hidden'] = array(4, 5, 6);
$config['site']['accounts_hidden'] = array(1);

# PAGE: shopsystem.php
$config['site']['shop_system'] = true;
$config['site']['shopguild_system'] = false;

# PAGE: lostaccount.php
$config['site']['email_lai_sec_interval'] = 180;

# Layout Config
$config['site']['layout'] = 'tibiarl';
$config['site']['vdarkborder'] = '#505050';
$config['site']['darkborder'] = '#717171';
$config['site']['lightborder'] = '#a4a4a4';
$config['site']['download_page'] = false;
$config['site']['serverinfo_page'] = true;
