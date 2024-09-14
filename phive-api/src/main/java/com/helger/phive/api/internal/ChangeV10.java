package com.helger.phive.api.internal;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Internal annotation for myself to remember changes for the next major release
 *
 * @author Philip Helger
 */
@Retention (RetentionPolicy.SOURCE)
@Target ({ ElementType.TYPE, ElementType.METHOD, ElementType.CONSTRUCTOR, ElementType.FIELD })
@ChangeV10 ("Use the ph-commons annotation ChangeNextMajorRelease instead")
public @interface ChangeV10
{
  String value();
}
