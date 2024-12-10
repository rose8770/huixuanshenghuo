--1.参数列表
local voucherId = ARGV[1]
local userId = ARGV[2]

local stockKey = 'seckill:stock' .. voucherId

local orderKey = 'seckill:order' .. voucherId

--3.脚本业务
if(tonumber(redis.call('get',stockKey)) <=0)then
    --库存不足，返回1
    return 1
end
--3.2判断用户是否下单
if(redis.call('sismember',orderKey,userId) == 1) then
    --存在说明重复下单，返回2
    return 2
end
--扣库存
redis.call('incrby', stockKey, -1)
--下单
redis.call('sadd', orderKey, userId)