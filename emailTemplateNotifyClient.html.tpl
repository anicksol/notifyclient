<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <meta content="IE=edge,chrome=1" name="x-ua-compatible">

    <title>Freezvon: Call from {{ .Dst }} to {{ .Src }}</title>

    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link crossorigin="anonymous" href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body style="height: 100%; padding: 0; background-color: #E3E5F2; width: 100%; overflow-x: hidden; font-family: 'Inter', sans-serif; font-style: normal; font-weight: 500; font-size: 16px; line-height: 1.5; letter-spacing: -0.2px; text-align: left; ">
<div style="background-color: #E3E5F2; color: #343D4A;">
    <header style="position: relative; padding-top: 24px;">
        <div class="container" style="max-width: 640px; margin: auto;">
            <div class="logo text-left pb-3"
                 style="display: inline-block; position: relative; font-weight: 700; font-size: 27px; line-height: 1.48; letter-spacing: -0.5px; color: #020D1D; padding: 5px 10% 5px 10%">
                <a href="https://freezvon.com/" style="color: #0066FF;">
                    <img alt="freezvon" src="https://cdn.telephonic-solutions.com/email/freezvon_email_logo.png"
                         style="max-width: 100%; height: auto;">
                </a>
            </div>
        </div>
    </header>
    <main>
        <div class="container" style="max-width: 640px; margin: auto;">
            <div class="first-block white-block"
                 style="position: relative; width: 100%; background-color: #FFFFFF; background-image: linear-gradient(#ffffff,#ffffff); border-radius: 16px; padding: 32px; margin: 0 10% 0 0%;">
                <div class="first-block__top align-items-center"
                     style="position: relative; display: block;padding: 0% 0% 0% 0%; width: 100%; ">
                    <table style="">
                        <tr>
                            <td rowspan="2" style="width: 20%;margin: 0 0% 0 5%;vertical-align: top">
                                <img alt="freezvon" src="https://cdn.telephonic-solutions.com/email/Number.png"
                                     style="max-width: 100%; height: auto; float: left;">
                            </td>
                            <td style="width: 80%; margin: 0 10% 0 5%; ">
                                <p style="font-weight: 400; font-size: 16px; line-height: 1.13; text-align: left">Hello dear customer
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%; height: auto;font-weight: 600; font-size: 28px; letter-spacing: -1.5px; color: #020D1D; min-width: 180px; text-align: left; height: auto;">
                                <p class="first-block__title"
                                   style="font-weight: 600; font-size: 28px; letter-spacing: -1.5px; color: #020D1D; min-width: 180px; text-align: left; height: auto; margin: 0 5%;">
                                    SIP offline </p>
                            </td>
                        </tr>
                    </table>
                </div>
                <br/>
                <p class="mb-0">You have call from {{ .Src }} to  {{ .Dst }} at {{ .Date }}.</p>
                <p class="mb-0">But your SIP was offline and call was failed.</p>
                {{ if .IsError }}
                <p><span class="star" style="color: #0066FF;">*</span>{{ .Error }}</p>
                {{ end }}
            </div>

            <div class="button-block white-block"
                 style="position: relative; width: 100%; height: auto; background-color: #FFFFFF; background-image: linear-gradient(#ffffff,#ffffff); border-radius: 16px; padding: 32px; margin: 10px 10% 10px 0%;">
                <p style="margin-bottom: 0;">Service is our priority! Every opinion of our clients matters to us.</p>
                <p style="margin: 0;">We will be glad if you share your experience of working with us.</p>

                <table style="width: -webkit-fill-available; padding-top: 24px;">
                    <tr style="width: 100%">
                        <td style="width: 30%; height: 1px;"></td>
                        <td style="width: 40%; text-align: center;"><a
                                class="btn btn-dark justify-content-center align-items-center"
                                href="https://www.trustpilot.com/evaluate/freezvon.com"
                                style="width: 250px; height: 56px; margin: auto; padding: 15px 32px;  font-weight: 500; font-size: 14px; line-height: 1.43; letter-spacing: -0.6px; text-align: center; text-transform: none; -webkit-transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, -webkit-box-shadow .15s ease-in-out; transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, -webkit-box-shadow .15s ease-in-out; -o-transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out; background-color: #020D1D; color: #FFF; border-color: #020D1D; border-radius: 8px; text-decoration: none; outline: none; -webkit-box-shadow: none; box-shadow: none; -webkit-appearance: none;"
                                title="Freezvon on TrustPilot">Share your feedback</a></td>
                        <td style="width: 30%; height: 1px;"></td>
                    </tr>
                </table>
            </div>
            <div class="contacts-block white-block"
                 style="position: relative; width: 100%; background-color: #FFFFFF; background-image: linear-gradient(#ffffff,#ffffff); border-radius: 16px; padding: 32px; margin: 10px 10% 10px 0%; font-weight: 400; font-size: 14px; line-height: 1.43; letter-spacing: -0.4px;">
                <p style="margin: 0">Best regards,<br>Support Team, <a href="https://freezvon.com/" style="color: #0066FF;">Freezvon.com</a>
                </p>
                <div class="contacts-block__list row" style="float: unset; width: 100%; margin: 0px 5% 5px 0%;">
                    <div class="col-md-4 contacts-block__phone"
                         style="padding: 5px 0% 5px 0%; float: left; width: 30%; min-width:180px;">
                        <p class="text-nowrap" style="color: #020D1D; text-align: left; margin-bottom: 0; height: 20px;"><span
                                class="country"
                                style="text-transform: uppercase; color: #797E86;">ET:</span>
                            <a href="tel:+3726682660" style="color: #020D1D;">+372 668 26 60</a></p>
                        <p class="text-nowrap" style="color: #020D1D; text-align: left; margin-bottom: 0; height: 20px;"><span
                                class="country"
                                style="text-transform: uppercase; color: #797E86;">UK:</span>
                            <a href="tel:+448081697757" style="color: #020D1D;">+44 808 16 97 757</a></p>
                        <p class="text-nowrap" style="color: #020D1D; text-align: left; margin-bottom: 0; height: 20px;"><span
                                class="country"
                                style="text-transform: uppercase; color: #797E86;">USA:</span>
                            <a href="tel:+18009866891" style="color: #020D1D;">+1 800 98 66 891</a></p>
                    </div>
                    <div class="col-md-4 contacts-block__connect"
                         style="padding: 5px 0% 5px 0%; float: left; width: 30%; min-width:180px;">
                        <p class="text-nowrap" style="color: #020D1D; text-align: left; margin-bottom: 0px; height: 20px;"><a
                                href="mailto:support@freezvon.com"
                                style="color: #020D1D;"><img
                                src="https://cdn.telephonic-solutions.com/email/mail.gif"
                                style="max-width: 100%; width: 15px; "><span
                                style="margin-left: 5px; vertical-align:center; margin-bottom: 2px;">support@freezvon.com</span></a>
                        </p>
                        <p class="text-nowrap" style="color: #020D1D; text-align: left; margin-bottom: 0px; height: 20px;"><a
                                href="skype:support.TSLLP?chat"
                                style="color: #020D1D;"><img
                                src="https://cdn.telephonic-solutions.com/email/skype.gif"
                                style="max-width: 100%; width: 15px;"><span
                                style="margin-left: 5px; vertical-align:center;margin-bottom: 2px;">support.tsllp</span></a>
                        </p>
                        <p class="text-nowrap" style="color: #020D1D; text-align: left; margin-bottom: 0px; height: 20px;"><a
                                href="https://m.me/freezvoncom"
                                style="color: #020D1D;"><img
                                src="https://cdn.telephonic-solutions.com/email/messenger.gif"
                                style="max-width: 100%; width: 15px;"><span
                                style="margin-left: 5px; vertical-align:center; margin-bottom: 2px;">Facebook Messenger</span></a>
                        </p>
                    </div>
                    <div class="col-md-4 contacts-block__connect"
                         style="padding: 5px 0% 5px 0%; float: left; width: 30%; min-width:190px;display: block; position: relative;">
                        <p class="text-nowrap" style="color: #020D1D;  text-align: left; margin-bottom: 0px; height: 20px; ">
                            <a href="https://telegram.me/freezvon" style="color: #020D1D;"><img
                                    src="https://cdn.telephonic-solutions.com/email/telegram.gif"
                                    style="max-width: 100%; width: 15px;"><span
                                    style="margin-left: 5px; vertical-align:center; margin-bottom: 2px;">Telegram</span></a>
                        </p>
                        <p class="text-nowrap"
                           style="color: #020D1D; text-align: left; margin-bottom: 0px; height: 20px; background-color: #FFFFFF; background-image: linear-gradient(#ffffff,#ffffff);">
                            <a href="https://wa.me/3726682660" style="color: #020D1D;">
                                <img src="https://cdn.telephonic-solutions.com/email/whatsapp.gif"
                                     style="max-width: 100%; width: 15px; "><span
                                    style="margin-left: 5px; vertical-align:center; margin-bottom: 2px;">WhatsApp</span></a>
                        </p>
                    </div>
                </div>
                <br>
                <div class="logo text-left mb-0"
                     style="display: block; position: relative; font-weight: 700; font-size: 27px; line-height: 1.48; letter-spacing: -0.5px; color: #020D1D;float: unset;width: max-content; ">
                    <a href="https://freezvon.com/" style="color: #0066FF;">
                        <img alt="freezvon" src="https://cdn.telephonic-solutions.com/email/freezvon_email_logo.png"
                             style="width: 161px; height: auto;margin: 5% 0 0 0;">
                    </a>
                </div>
            </div>
        </div>
    </main>
    <footer class="text-center" style="position: relative; padding-bottom: 24px;">
        <div style="max-width: 640px; padding-left: 32px; padding-right: 32px; margin: auto;">
            <div style="text-align: center">
                <p style="font-weight: 400; font-size: 12px; line-height: 1; letter-spacing: -0.2px; color: #797E86; margin-bottom: 0;">
                    You received this email because you left your email address <span class="mail" style="color: #343D4A;">{{.Email}}</span>
                    at <a href="https://freezvon.com/" style="text-decoration: underline; color: #797E86;">Freezvon.com</a>
                </p>
            </div>
            <div style="text-align: center">
                <p style="font-weight: 400; font-size: 12px; line-height: 1; letter-spacing: -0.2px; color: #797E86; margin-bottom: 0;">
                    You can unsubscribe <a
                        href="https://api.telephonic-solutions.com/api/v1/emailunsubscribe?email={{.Email}}&templateid=16"
                        style="text-decoration: underline; color: #797E86;">here</a>.
                </p>
            </div>
        </div>
    </footer>
</div>
</body>
</html>