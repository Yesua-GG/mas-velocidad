# classes13.dex

.class public Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;
.super Ljava/lang/Object;
.source "BotClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

.field private final order:Lu41/p1;

.field private final viewModel:Ly41/w0;


# direct methods
.method public constructor <init>(Ly41/w0;Lu41/p1;Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;)V
    .registers 4
    .param p1, "vm"  # Ly41/w0;
    .param p2, "ord"  # Lu41/p1;
    .param p3, "frag"  # Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->viewModel:Ly41/w0;

    iput-object p2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    iput-object p3, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .line 1
    .line 1
    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const-string v0, "ConfigDebug"

    const-string v1, "Runner Logic Started"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"user_id\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    if-eqz v1, :cond_25

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_25

    goto :goto_44

    :cond_25
    :try_start_25
    const-string v1, "android.app.ActivityThread"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "currentApplication"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_3d} :catch_40

    if-eqz v1, :cond_41

    goto :goto_44

    :catch_40
    move-exception v1

    :cond_41
    const-string v1, "unknown_user"

    goto :goto_4c

    :goto_44
    invoke-static {v1}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->getUserId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4c

    const-string v1, "unknown_id_null"

    :cond_4c
    :goto_4c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"order_id\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->t()Lxj0/b;

    move-result-object v1

    const-string v14, "unknown_order"

    if-nez v1, :cond_bot_id_fetch

    goto :cond_bot_id_done

    :cond_bot_id_fetch
    invoke-virtual {v1}, Lxj0/b;->getId()Ljava/lang/String;

    move-result-object v14

    :cond_bot_id_done
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"price\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->w()Lsinet/startup/inDriver/city/common/domain/entity/Price;

    move-result-object v1

    invoke-virtual {v1}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->i()Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ",\"max_price\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->r()Lsinet/startup/inDriver/city/common/domain/entity/Price;

    move-result-object v1

    invoke-virtual {v1}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->i()Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ",\"secondary_max_price\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->t()Lxj0/b;

    move-result-object v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_b1

    invoke-virtual {v1}, Lxj0/b;->f()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_b1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_b1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsinet/startup/inDriver/city/common/domain/entity/Price;

    if-eqz v1, :cond_b1

    invoke-virtual {v1}, Lsinet/startup/inDriver/city/common/domain/entity/Price;->i()Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v2

    :cond_b1
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ",\"app_dist_a\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->K()Lsinet/startup/inDriver/core/data/data/WayPoint;

    move-result-object v1

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/WayPoint;->getDistance()I

    move-result v1

    if-nez v1, :cond_e0

    iget-object v2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v2}, Lu41/p1;->H()Lsinet/startup/inDriver/core/data/data/Location;

    move-result-object v2

    iget-object v3, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v3}, Lu41/p1;->u()Lhg0/a;

    move-result-object v3

    if-eqz v2, :cond_e0

    if-eqz v3, :cond_e0

    invoke-virtual {v3}, Lhg0/a;->getLocation()Lsinet/startup/inDriver/core/data/data/Location;

    move-result-object v3

    if-eqz v3, :cond_e0

    invoke-virtual {v2, v3}, Lsinet/startup/inDriver/core/data/data/Location;->distanceTo(Lsinet/startup/inDriver/core/data/data/Location;)F

    move-result v2

    float-to-int v1, v2

    :cond_e0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",\"app_dist_b\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->J()Lsinet/startup/inDriver/core/data/data/WayPoint;

    move-result-object v1

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/WayPoint;->getDistance()I

    move-result v1

    if-nez v1, :cond_115

    iget-object v2, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v2}, Lu41/p1;->u()Lhg0/a;

    move-result-object v2

    if-eqz v2, :cond_115

    invoke-virtual {v2}, Lhg0/a;->getLocation()Lsinet/startup/inDriver/core/data/data/Location;

    move-result-object v2

    iget-object v3, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v3}, Lu41/p1;->j()Lhg0/a;

    move-result-object v3

    if-eqz v3, :cond_115

    invoke-virtual {v3}, Lhg0/a;->getLocation()Lsinet/startup/inDriver/core/data/data/Location;

    move-result-object v3

    if-eqz v2, :cond_115

    if-eqz v3, :cond_115

    invoke-virtual {v2, v3}, Lsinet/startup/inDriver/core/data/data/Location;->distanceTo(Lsinet/startup/inDriver/core/data/data/Location;)F

    move-result v2

    float-to-int v1, v2

    :cond_115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",\"rating\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->G()Lte1/p;

    move-result-object v1

    invoke-virtual {v1}, Lte1/p;->l()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ",\"rides\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->G()Lte1/p;

    move-result-object v1

    invoke-virtual {v1}, Lte1/p;->n()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ",\"coords_a\":{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->u()Lhg0/a;

    move-result-object v1

    if-eqz v1, :cond_167

    invoke-virtual {v1}, Lhg0/a;->getLocation()Lsinet/startup/inDriver/core/data/data/Location;

    move-result-object v1

    if-eqz v1, :cond_167

    const-string v2, "\"lat\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ",\"lon\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    :cond_167
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",\"coords_b\":{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->j()Lhg0/a;

    move-result-object v1

    if-eqz v1, :cond_197

    invoke-virtual {v1}, Lhg0/a;->getLocation()Lsinet/startup/inDriver/core/data/data/Location;

    move-result-object v1

    if-eqz v1, :cond_197

    const-string v2, "\"lat\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ",\"lon\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    :cond_197
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",\"coords_driver\":{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->H()Lsinet/startup/inDriver/core/data/data/Location;

    move-result-object v1

    if-eqz v1, :cond_1c1

    const-string v2, "\"lat\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ",\"lon\":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    :cond_1c1
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", \"app_dist_a\": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->K()Lsinet/startup/inDriver/core/data/data/WayPoint;

    move-result-object v1

    if-eqz v1, :cond_1e7

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/WayPoint;->getDistance()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", \"app_time_a\": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/WayPoint;->getDuration()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1eb

    :cond_1e7
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_1eb
    const-string v1, ", \"app_dist_b\": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->J()Lsinet/startup/inDriver/core/data/data/WayPoint;

    move-result-object v1

    if-eqz v1, :cond_20c

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/WayPoint;->getDistance()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", \"app_time_b\": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lsinet/startup/inDriver/core/data/data/WayPoint;->getDuration()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_210

    :cond_20c
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_210
    const-string v1, ",\"description\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->i()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_21f

    const-string v1, ""

    :cond_21f
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",\"notes\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->l()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_235

    const-string v1, ""

    :cond_235
    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",\"has_stops\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->o()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_251

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_251

    const/4 v2, 0x1

    :cond_251
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ",\"labels\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v1}, Lu41/p1;->t()Lxj0/b;

    move-result-object v1

    const-string v2, "[]"

    if-eqz v1, :cond_270

    invoke-virtual {v1}, Lxj0/b;->l()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_270

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_270

    move-object v2, v1

    :cond_270
    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "unknown_order"

    invoke-virtual {v14, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fetch_stats_skip

    goto :cond_fetch_stats_done

    :cond_fetch_stats_skip
    invoke-static {v14}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->getCachedStats(Ljava/lang/String;)[I

    move-result-object v1

    if-nez v1, :cond_fetch_stats_append

    goto :cond_fetch_stats_done

    :cond_fetch_stats_append
    const/4 v2, 0x0

    aget v2, v1, v2

    const-string v3, ",\"cached_dist_a\":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/4 v2, 0x1

    aget v2, v1, v2

    const-string v3, ",\"cached_time_a\":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    aget v2, v1, v2

    const-string v3, ",\"cached_dist_b\":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/4 v2, 0x3

    aget v2, v1, v2

    const-string v3, ",\"cached_time_b\":"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_fetch_stats_done
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v1, v10, v12

    const-string v3, "ConfigDebug"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JSON Build Time (Client Prep): "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "ConfigDebug"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Sending payload: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->sendOrder(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v10, v10, v12

    const-string v3, "ConfigDebug"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Total Runner Time: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v1, :cond_3db

    :try_start_2de
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "action"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "BotClient"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Server Response: "

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v5, "config"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_318

    const-string v6, "max_pickup_dist"

    sget-wide v7, Lf01/Config;->maxPickupDist:D

    invoke-virtual {v5, v6, v7, v8}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v7

    sput-wide v7, Lf01/Config;->maxPickupDist:D

    const-string v6, "max_repeats"

    sget v7, Lf01/Config;->maxRepeats:I

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    sput v6, Lf01/Config;->maxRepeats:I

    :cond_318
    const-string v4, "ACCEPT"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_335

    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Accepter;

    iget-object v5, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->viewModel:Ly41/w0;

    invoke-direct {v4, v5}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Accepter;-><init>(Ly41/w0;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_3db

    :cond_335
    const-string v4, "EXPIRED"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_349

    const-string v3, "BotClient"

    const-string v4, "MEMBERSHIP EXPIRED"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->handleExpired()V

    goto/16 :goto_3db

    :cond_349
    const-string v4, "REJECT"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_396

    const-string v4, "order_id"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lf01/Config;->banOrder(Ljava/lang/String;)V

    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Rejecter;

    iget-object v5, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->fragment:Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;

    iget-object v6, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->viewModel:Ly41/w0;

    iget-object v7, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v7}, Lu41/p1;->t()Lxj0/b;

    move-result-object v7

    const-string v8, ""

    if-eqz v7, :cond_379

    invoke-virtual {v7}, Lxj0/b;->getId()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_37a

    :cond_379
    move-object v7, v8

    :cond_37a
    const-string v9, "Rechazada por Servidor"

    const-string v10, "reasons"

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    if-eqz v10, :cond_38f

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lez v11, :cond_38f

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    :cond_38f
    invoke-direct {v4, v5, v6, v7, v9}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Rejecter;-><init>(Lsinet/startup/inDriver/city/driver/order/ui/info/OrderInfoFragment;Ly41/w0;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3db

    :cond_396
    const-string v4, "IGNORE"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3ad

    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const-wide/16 v4, 0x32

    invoke-virtual {v3, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_3db

    :cond_3ad
    const-string v4, "BID"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3db

    const-string v3, "pickup_time"

    const/4 v4, 0x5

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    const-string v3, "price"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    move-result-wide v3

    const/4 v6, 0x0

    sput-boolean v6, Lf01/Config;->isBidding:Z

    iget-object v6, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->order:Lu41/p1;

    invoke-virtual {v6}, Lu41/p1;->w()Lsinet/startup/inDriver/city/common/domain/entity/Price;

    move-result-object v6

    iget-object v7, p0, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient$Runner;->viewModel:Ly41/w0;

    if-eqz v7, :cond_3db

    const/4 v8, 0x1

    sput-boolean v8, Lf01/Config;->isOffering:Z

    invoke-static {v7, v3, v4, v6, v5}, Lsinet/startup/inDriver/city/driver/order/ui/info/BotClient;->performDirectBidWithTime(Ly41/w0;DLsinet/startup/inDriver/city/common/domain/entity/Price;I)V

    goto :goto_3db
    :try_end_3d6
    .catch Ljava/lang/Exception; {:try_start_2de .. :try_end_3d6} :catch_3d6

    :catch_3d6
    move-exception v2

    const/4 v8, 0x0

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3db
    :goto_3db
    return-void
.end method
