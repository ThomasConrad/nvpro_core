/*
 * Copyright (c) 2022, NVIDIA CORPORATION.  All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-FileCopyrightText: Copyright (c) 2014-2022 NVIDIA CORPORATION
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef LIGHT_CONTRIB_H
#define LIGHT_CONTRIB_H 1

#include "func.glsl"
#include "dh_lighting.h"

LightContrib lightContribution(Light light, vec3 surfacePos, vec3 surfaceNormal, vec3 view_incident)
{
  LightContrib contrib;
  contrib.incidentVector  = vec3(0.0F);
  contrib.halfAngularSize = 0.0F;
  contrib.intensity       = vec3(0.0F);
  float irradiance        = 0.0F;

  if(light.type == eLightTypeDirectional)
  {
    contrib.incidentVector  = light.direction;
    contrib.halfAngularSize = light.angularSizeOrInvRange * 0.5F;
    irradiance              = light.intensity;
  }
  else if(light.type == eLightTypeSpot || light.type == eLightTypePoint)
  {
    vec3  light_to_surface = surfacePos - light.position;
    float distance         = sqrt(dot(light_to_surface, light_to_surface));
    float r_distance       = 1.0F / distance;
    contrib.incidentVector = light_to_surface * r_distance;

    float attenuation = 1.F;
    if(light.angularSizeOrInvRange > 0.0F)
    {
      attenuation = square(saturate(1.0F - square(square(distance * light.angularSizeOrInvRange))));

      if(attenuation == 0.0F)
        return contrib;
    }

    float spotlight = 1.0F;
    if(light.type == eLightTypeSpot)
    {
      float lDotD           = dot(contrib.incidentVector, light.direction);
      float direction_angle = acos(lDotD);
      spotlight             = 1.0F - smoothstep(light.innerAngle, light.outerAngle, direction_angle);

      if(spotlight == 0.0F)
        return contrib;
    }

    if(light.radius > 0.0F)
    {
      contrib.halfAngularSize = atan(min(light.radius * r_distance, 1.0F));

      // A good enough approximation for 2 * (1 - cos(halfAngularSize)), numerically more accurate for small angular sizes
      float solidAngleOverPi = square(contrib.halfAngularSize);

      float radianceTimesPi = light.intensity / square(light.radius);

      irradiance = radianceTimesPi * solidAngleOverPi;
    }
    else
    {
      irradiance = light.intensity * square(r_distance);
    }

    irradiance *= spotlight * attenuation;
  }

  contrib.intensity = irradiance * light.color;


  vec3 V = -view_incident;
  vec3 L = -contrib.incidentVector;
  vec3 R = reflect(view_incident, surfaceNormal);

  return contrib;
}

#endif