<?php
/**
 * This file is part of the TelegramBot package.
 *
 * (c) Avtandil Kikabidze aka LONGMAN <akalongman@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Longman\TelegramBot\Commands\AdminCommands;

use Longman\TelegramBot\Entities\Keyboard;
use Longman\TelegramBot\Entities\InlineKeyboard;
use Longman\TelegramBot\Request;
use Longman\TelegramBot\Conversation;
use Longman\TelegramBot\Commands\AdminCommand;
use Longman\TelegramBot\Entities\Message;
use Longman\TelegramBot\Exception\TelegramException;

class AutosendchannelCommand extends AdminCommand
{
    /**
     * @var string
     */
    protected $name = 'autosendchannel';

    /**
     * @var string
     */
    protected $description = 'Send message to a channel';

    /**
     * @var string
     */
    protected $usage = '/autosendchannel <message to send>';

    /**
     * @var string
     */
    protected $version = '0.2.0';

    /**
     * @var bool
     */
    protected $need_mysql = true;

    /**
     * Conversation Object
     *
     * @var \Longman\TelegramBot\Conversation
     */
    protected $conversation;

    /**
     * Command execute method
     *
     * @return \Longman\TelegramBot\Entities\ServerResponse|mixed
     * @throws \Longman\TelegramBot\Exception\TelegramException
     */
    public function execute()
    {
         $data = [];
        $data['chat_id'] = '@dodetest';
        $data['text'] = 'JOIN OUR SIGNAL WITH BOSSFOREXSIGNAL.COM!';
        $inline_keyboard = new InlineKeyboard([
            ['text' => 'BASIC', 'url' => 'bossforexsignal.com/join/basic-signal'],
        ], [
            ['text' => 'PRO', 'url' => 'bossforexsignal.com/join/pro-signal'],
        ], [
             ['text' => 'PREMIUM', 'url' => 'https://bossforexsignal.com/join/premium-signal'],
        ], [
            ['text' => 'FREE', 'url' => 'https://bossforexsignal.com/join/free-signal'],
        ]
        );

        $data['reply_markup'] = $inline_keyboard; 


        $result = Request::sendMessage($data);
        // if ($result->isOk()) {
        //     echo 'Message sent succesfully to: '.$data['chat_id'] ;
        // } else {
        //     echo 'Sorry message not sent to: '.$data['chat_id'] ;
        // }
        return $result;
    }


}
