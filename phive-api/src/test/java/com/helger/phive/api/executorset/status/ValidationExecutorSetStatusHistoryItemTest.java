/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.phive.api.executorset.status;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.time.OffsetDateTime;

import org.junit.Test;

import com.helger.datetime.helper.PDTFactory;

/**
 * Test class for class {@link ValidationExecutorSetStatusHistoryItem}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSetStatusHistoryItemTest
{
  @Test
  public void testBasic ()
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();
    final ValidationExecutorSetStatusHistoryItem aItem = new ValidationExecutorSetStatusHistoryItem (aNow,
                                                                                                     "TestAuthor",
                                                                                                     "CODE1",
                                                                                                     "Some change happened");
    assertEquals (aNow, aItem.getChangeDateTime ());
    assertEquals ("TestAuthor", aItem.getAuthor ());
    assertEquals ("CODE1", aItem.getChangeCode ());
    assertEquals ("Some change happened", aItem.getText ());
    assertNotNull (aItem.toString ());
  }

  @Test
  public void testWithNullChangeCode ()
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();
    final ValidationExecutorSetStatusHistoryItem aItem = new ValidationExecutorSetStatusHistoryItem (aNow,
                                                                                                     "Author",
                                                                                                     null,
                                                                                                     "Text");
    assertNull (aItem.getChangeCode ());
    assertEquals ("Author", aItem.getAuthor ());
    assertEquals ("Text", aItem.getText ());
  }
}
