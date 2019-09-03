<?php
/**
 * This file is part of the TelegramBot package.
 *
 * (c) Avtandil Kikabidze aka LONGMAN <akalongman@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Longman\TelegramBot\Commands\UserCommands;

use Longman\TelegramBot\Commands\UserCommand;
use Longman\TelegramBot\Entities\InlineKeyboard;
use Longman\TelegramBot\Request;

/**
 * User "/inlinekeyboard" command
 */
class JoinsignalCommand extends UserCommand
{
    /**
     * @var string
     */
    protected $name = 'joinsignal';

    /**
     * @var string
     */
    protected $description = 'Join our Service';

    /**
     * @var string
     */
    protected $usage = '/joinsignal';

    /**
     * @var string
     */
    protected $version = '0.1.0';

    /**
     * Command execute method
     *
     * @return \Longman\TelegramBot\Entities\ServerResponse
     * @throws \Longman\TelegramBot\Exception\TelegramException
     */
    public function execute()
    {
        $chat_id = $this->getMessage()->getChat()->getId();

        $inline_keyboard = new InlineKeyboard([
            ['text' => 'BASIC', 'url' => 'bossforexsignal.com/join/basic-signal'],
            ['text' => 'PRO', 'url' => 'bossforexsignal.com/join/pro-signal'],
        ], [
             ['text' => 'PREMIUM', 'url' => 'https://bossforexsignal.com/join/premium-signal'],
            ['text' => 'FREE', 'url' => 'https://bossforexsignal.com/join/free-signal'],
        ]);

        $data = [
            'chat_id'      => $chat_id,
            'text'         => 'test text to be sended',
            'reply_markup' => $inline_keyboard,
        ];

        return Request::sendMessage($data);
    }
}
