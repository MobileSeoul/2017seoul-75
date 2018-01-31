var _visible = argument0;


if( _visible == true)
{

    if( instance_exists( o_bus_inzoomin ) == false)
    {
        instance_create( 70,106, o_bus_inzoomin);
    }

    with( o_bus_in_holder )
    {
        visible = true;
    }
    
    with( o_bus_in_chair)
    {
        visible = true;
    }
    

}
else
{

    with( o_bus_inzoomin)
    {
        instance_destroy();
    }
    
    
     with( o_bus_in_holder )
    {
        visible = false;
    }
    
    with( o_bus_in_chair)
    {
        visible = false;
    }
    
}
