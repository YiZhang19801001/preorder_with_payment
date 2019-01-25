<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class Payment
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    protected $order_no;
    protected $order_status;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($order_no, $order_status)
    {
        $this->order_no = $order_no;
        $this->order_status = $order_status;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('tableOrder');
    }
    public function broadcastWith() /**add data to the broadcast event */
    {
        //return $this->orderItem;
        return ["order_no" => $this->order_no,
            "order_status" => $this->order_status,
        ];
    }
}
