package com.ghn.jersey;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/message")
public class JerseyService
{
    @GET
    public String getMsg()
    {
         return "Manahona letsy an! - Jersey 2.x";
    }
}
