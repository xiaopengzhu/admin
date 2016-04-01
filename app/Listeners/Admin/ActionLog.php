<?php

namespace App\Listeners\Admin;

use App\Events\Admin\ActionLog as EventsActionLog;

use App\Models\Admin\ActionLog as ActionLogModel;
use Request;

class ActionLog
{
    private $model;

    /**
     * Create the event handler.
     *
     */
    public function __construct()
    {
        $this->model = new ActionLogModel();
    }

    /**
     * Handle the event.
     *
     * @param  EventsActionLog  $event
     * @return void
     */
    public function handle(EventsActionLog $event)
    {
        $addData['username'] = $event->userName;
        $addData['user_id'] = $event->userId;
        $addData['ip'] = Request::ip();
        $addData['ip_address'] = '';
        $addData['add_time'] = time();
        $addData['realname'] = $event->realName;
        $addData['content'] = $event->message;
        $this->model->add($addData);
    }
}
