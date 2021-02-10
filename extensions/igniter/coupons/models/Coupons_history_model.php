<?php

namespace Igniter\Coupons\Models;

use Model;

/**
 * Coupons History Model Class
 */
class Coupons_history_model extends Model
{
    const CREATED_AT = 'date_used';

    const UPDATED_AT = null;

    /**
     * @var string The database table name
     */
    protected $table = 'igniter_coupons_history';

    /**
     * @var string The database table primary key
     */
    protected $primaryKey = 'coupon_history_id';

    protected $guarded = [];

    protected $appends = ['customer_name'];

    protected $casts = [
        'coupon_history_id' => 'integer',
        'coupon_id' => 'integer',
        'order_id' => 'integer',
        'customer_id' => 'integer',
        'min_total' => 'float',
        'amount' => 'float',
        'status' => 'boolean',
    ];

    public $relation = [
        'belongsTo' => [
            'customer' => 'Admin\Models\Customers_model',
            'order' => 'Admin\Models\Orders_model',
            'coupon' => 'Igniter\Coupons\Models\Coupons_model',
        ],
    ];

    public $timestamps = TRUE;

    public function getCustomerNameAttribute($value)
    {
        return ($this->customer AND $this->customer->exists) ? $this->customer->full_name : $value;
    }

    public function scopeIsEnabled($query)
    {
        return $query->where('status', '1');
    }

    public function touchStatus()
    {
        $this->status = ($this->status < 1) ? 1 : 0;

        return $this->save();
    }

    /**
     * @param \Igniter\Flame\Cart\CartCondition $couponCondition
     * @param \Admin\Models\Orders_model $order
     * @return \Admin\Models\Coupons_history_model|bool
     */
    public static function createHistory($couponCondition, $order)
    {
        if (!$coupon = $couponCondition->getModel())
            return FALSE;

        $model = new static;
        $model->order_id = $order->getKey();
        $model->customer_id = $order->customer ? $order->customer->getKey() : 0;
        $model->coupon_id = $coupon->coupon_id;
        $model->code = $coupon->code;
        $model->amount = $couponCondition->getValue();
        $model->min_total = $coupon->min_total;

        if ($model->fireSystemEvent('couponHistory.beforeAddHistory', [$model, $couponCondition, $order->customer, $coupon], TRUE) === FALSE)
            return FALSE;

        $model->save();

        return $model;
    }
}