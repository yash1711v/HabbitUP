
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HabitUp/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:meta/meta.dart';

part 'tips_event.dart';
part 'tips_state.dart';

class TipsBloc extends Bloc<TipsEvent, TipsState>  {



  TipsBloc() : super(TipsInitial())  {


    on<TipsEvent>((event, emit) async {
      String Theme=await Sharedpref().getThemeData();
      final Map<String, Widget> tips = {

        'Habits as Compound Interest': RichText(
            textAlign: TextAlign.center,
            text:   TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(
                    text:
                    "Habits function like compound interest in self-improvement. Consistently improving by even just"),
                TextSpan(
                  text: " 1 percent daily ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: "can yield significant results over time"),
              ],
            )),
        'Focus on Systems, Not Goals': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "Instead of solely focusing on setting ambitious goals,"),
                TextSpan(
                  text: " prioritize building effective systems.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "It's the consistent execution of these systems, comprised of small atomic habits, that leads to remarkable outcomes."),
              ],
            )),
        'Focus on Identity': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(

              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Instead of solely fixating on specific outcomes,"),
                TextSpan(
                  text:
                  " cultivate habits that align with the identity of the person you aspire to become.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "For instance, if you aim to be a healthier individual\n,adopt habits such as regular exercise and mindful eating,\nwhich reinforce the identity of a health-conscious person"),
              ],
            )),
        'Continuous Self-Reflection': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Regularly "),
                TextSpan(
                  text: " assess your beliefs and values ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "to ensure they are in harmony with the identity you wish to embody.Adjust your habits accordingly to support this evolving identity.For example, if you aim to become more empathetic,incorporate daily practices such as active listening and acts of kindness into your routine."),
              ],
            )),
        'Create Clear Cues': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Establish clear and noticeable cues ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                  "that trigger the desired behavior. Whether it's placing your running shoes by the door for a morning jog or setting a",
                ),
                TextSpan(
                    text:
                    "reminder on your phone to meditate before bed,making the cue obvious increases the likelihood of following through with the habit."),
              ],
            )),
        'Belief Reinforcement through Habit Formation': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Recognize the power of habits in shaping your self-perception and beliefs. "),
                TextSpan(
                  text: "Choose habits that not only contribute to desired outcomes but also reinforce positive beliefs about yourself",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "For instance, if you seek to boost confidence, establish habits such as daily affirmations or tackling challenging tasks head-on, which can affirm your capabilities and strengthen your self-belief."),
              ],
            )),
        'Make Habits Appealing': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Find ways to "),
                TextSpan(
                  text: "make the habit attractive and enjoyable. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "This could involve pairing the habit with something you already enjoy or adding elements of fun or creativity to the activity. For instance, listening to your favorite podcast while doing household chores or joining a group fitness class to make exercising more enjoyable."),
              ],
            )),
        'Simplify the Process': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Make the habit as "),
                TextSpan(
                  text: "easy and effortless ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "as possible to perform. "),
                TextSpan(
                  text: "Remove any barriers or obstacles ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                    text:
                    "that may hinder habit formation."),

                TextSpan(
                  text: "Break down the habit into smaller, manageable steps and gradually increase complexity over time. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

                TextSpan(
                    text:
                    "For example, if you want to read more, start by setting aside just 10 minutes a day and gradually increase the duration as the habit becomes more ingrained."),

              ],
            )),
        'Heighten Awareness': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Cultivate mindfulness and awareness of your habits by consciously observing your actions. Start by "),
                TextSpan(
                  text: "paying attention to the cues that trigger certain behaviors and the resulting outcomes. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "Theightened awareness is essential for initiating behavior change. "),
              ],
            )),
        'Practice Pointing-and-Calling': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Engage in the practice of "),
                TextSpan(
                  text: "pointing-and-calling ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    "to elevate your awareness from unconscious habits to conscious actions. Verbally acknowledging your actions as you perform them can help break the automaticity of habits and foster a more deliberate approach to behavior."),
              ],
            )),
        'Utilize the Habits Scorecard': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Employ the Habits Scorecard ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "exercise as a tool to enhance self-awareness of your behaviors. This involves documenting your daily habits and behaviors to gain insight ",

                ),
                TextSpan(
                    text:
                    "into patterns and areas for improvement. Regularly reviewing the scorecard can aid in identifying habits that may need adjustment or replacement."),
              ],
            )),
        'Utilize Clear Cues': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Leverage the power of ",

                ),
                TextSpan(
                  text: "clear cues, ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                    text:
                    'such as time and location, to make your desired habits obvious. For instance, if you want to start reading daily, specify a particular time and location, like "I will read for 20 minutes every morning at the kitchen table."'),
              ],
            )),
        'Create Implementation Intentions': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text: "Formulate implementation intentions by  ",

                ),
                TextSpan(
                  text: "pairing a new habit with a specific time and location. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text:
                    'Use the formula "I will [BEHAVIOR] at [TIME] in [LOCATION]" to solidify your commitment. For example, "I will meditate for 10 minutes at 7 AM in the living room "'),
              ],
            )),
        'Adopt Habit Stacking': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Employ the ",

                ),
                TextSpan(
                  text: "habit stacking technique to integrate a new habit with an existing one. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                    text:
                    'Use the formula "After [CURRENT HABIT], I will [NEW HABIT]" to seamlessly incorporate the new behavior. For instance, "After brushing my teeth, I will floss." This ensures the new habit becomes associated with an established routine, increasing its likelihood of adoption.'),
              ],
            )),
        'Leverage Contextual Changes': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Recognize that even ",

                ),
                TextSpan(
                  text: "small adjustments in your environment can have a significant impact ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                    text:
                    'on your behavior over time. By modifying your surroundings to support positive habits, you can effectively shape your actions. '),
              ],
            )),
        'Highlight Prominent Cuess': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Be mindful of the cues that initiate habits, as ",

                ),
                TextSpan(
                  text: "we tend to notice cues that stand out. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                    text:
                    'on your behavior over time. By modifying your surroundings to support positive habits, you can effectively shape your actions. '),
              ],
            )),
        'Associate Habits with Context': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Understand that habits are not just triggered by singular cues but by the entire context surrounding ",

                ),
                TextSpan(
                  text: "he behavior. By aligning your habits with specific environments or situations, you can strengthen their association and consistency. ",


                ),
              ],
            )),
        'Leverage New Environments for Habit Formation': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Take advantage of ",

                ),
                TextSpan(
                  text: "new environments ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "when building new habits, as ",
                ),
                TextSpan(
                  text: "you're not contending with old cues. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Embrace the opportunity to establish fresh routines and associations that support your desired behaviors. ",
                ),

              ],
            )),
        'Create Distraction-Free Zones': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Designate specific areas or times  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'in your environment where distractions and temptations are minimized. For instance, establish a "no-phone zone" during meal times or allocate a designated workspace free from clutter or sources of procrastination. By creating environments conducive to focus and productivity, you make it easier to resist temptations and stay on track with your goals. ',
                ),
              ],
            )),
        'Enhance Attractiveness': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Increase the appeal of desired habits by associating them with  ",


                ),
                TextSpan(
                  text: 'rewarding experiences. Incorporate elements that trigger dopamine release, ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'such as setting up a reward system or visualizing the benefits of completing the habit. By making the habit more enticing, you enhance motivation and increase the likelihood of habit formation. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ],
            )),
        'Utilize Temptation Bundling': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Employ the  ",


                ),
                TextSpan(
                  text: 'strategy of temptation bundling ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'to make habits more attractive. Pair a desired action with a necessary one to create a positive association. For example, listen to your favorite podcast only while exercising or reserve special treats for after completing challenging tasks. This not only makes the habit more enjoyable but also reinforces positive behavior. ',
                ),
              ],
            )),
        'Choose Your Social Environment Wisely': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Surround yourself with individuals who exhibit the behaviors you wish to adopt. ",


                ),
                TextSpan(
                  text: 'Join communities or groups',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'where your desired behavior is not only accepted but also encouraged. This fosters a ',


                ),
                TextSpan(
                  text: 'supportive environment that reinforces your habits. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ],
            )),
        'Leverage Social Influence': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Recognize the impact of social norms and peer influence on your habits. ",


                ),
                TextSpan(
                  text: 'Embrace the power of social accountability ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'by sharing your goals and progress with others. This encourages you to align your behavior with the expectations of your social groups. ',


                ),
              ],
            )),
        'Seek Approval and Recognition': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Harness the motivation provided by  ",


                ),
                TextSpan(
                  text: 'social approval, respect, and praise. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'When a behavior is associated with ',
                ),

                TextSpan(
                  text: 'positive social outcomes, it becomes more attractive. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

                TextSpan(
                  text: 'Focus on how your desired habits can contribute to your social standing and garner admiration from others. ',
                ),

              ],
            )),
        'Reframe the Attractiveness': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Apply the ",


                ),
                TextSpan(
                  text: 'inversion of the 2nd Law of Behavior Change ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'by making ',
                ),

                TextSpan(
                  text: 'undesirable habits unattractive. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

                TextSpan(
                  text: 'Highlight the negative consequences or drawbacks of engaging in the behavior to  ',
                ),
                TextSpan(
                  text: 'diminish its appeal. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Emphasize the benefits of avoiding the bad habit to reinforce its unattractiveness. ',
                ),

              ],
            )),
        'Understand Motivations': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Recognize that every behavior stems from ",


                ),
                TextSpan(
                  text: 'both surface-level cravings and deeper underlying motives. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'Identify the underlying needs or desires driving your habits to address them effectively. By ',
                ),

                TextSpan(
                  text: 'understanding the root cause of your habits, you can develop strategies to modify or replace them. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

              ],
            )),
        'Create Motivation Rituals': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Establish ",


                ),
                TextSpan(
                  text: 'motivation rituals ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'by engaging in enjoyable activities immediately before tackling difficult habits. This creates ',
                ),

                TextSpan(
                  text: 'positive associations ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

                TextSpan(
                  text: 'and uplifts your mood, making the challenging habit seem more manageable. Incorporate activities you genuinely enjoy to boost motivation and alleviate resistance. ',
                ),

              ],
            )),
        'Prioritize Action over Planning': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Instead of getting caught up in extensive planning, ",


                ),
                TextSpan(
                  text: 'prioritize taking action. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'Break down your desired habits into ',
                ),

                TextSpan(
                  text: 'small, manageable steps  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

                TextSpan(
                  text: 'and focus on consistently performing them. Remember, the most effective way to learn and solidify habits is through practice and repetition.',
                ),

              ],
            )),
        'Embrace Repetition for Automation': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Understand that habit formation occurs through ",


                ),
                TextSpan(
                  text: 'repetition and consistent practice. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: "Rather than solely focusing on the duration you've been performing a habit, ",
                ),

                TextSpan(
                  text: 'prioritize the frequency and consistency ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

                TextSpan(
                  text: 'of its execution. By repeatedly engaging in the behavior, you gradually automate it, making it easier to sustain over time ',
                ),

              ],
            )),
        'Optimize Your Environment for Success': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Design your surroundings to facilitate positive behaviors by ",


                ),
                TextSpan(
                  text: 'minimizing barriers and increasing convenience. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: "Arrange your environment in a way that makes it effortless to engage in desired habits. For example, place healthy snacks at eye level in your kitchen to make nutritious eating more accessible.  ",
                ),


              ],
            )),
        'Manipulate Friction to Your Advantage': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Adjust the ",


                ),
                TextSpan(
                  text: 'level of friction  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: "associated with behaviors to influence habit formation. ",
                ),
                TextSpan(
                  text: 'Decrease friction for good habits ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: "by removing obstacles and making them easier to perform. Conversely,",
                ),
                TextSpan(
                  text: 'increase friction for bad habits ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: "by introducing obstacles or deterrents. By manipulating friction, you can steer yourself toward more desirable behaviors effortlessly. ",
                ),

              ],
            )),
        'Implement the Two-Minute Rule': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "When establishing a new habit, adhere to the Two-Minute Rule, which suggests that the  ",


                ),
                TextSpan(
                  text: 'initial steps of the habit should take less than two minutes to complete. ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: "Breaking down habits into small, manageable tasks makes them easier to initiate and increases the likelihood of consistent execution. For example, if you aim to develop a habit of reading daily, start by committing to reading just one page. ",
                ),

              ],
            )),
        'Ritualize the Beginning of Habits': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: <TextSpan>[
                TextSpan(text: "Develop rituals or routines to initiate habits effectively. By ritualizing the beginning of a habit, you create a psychological cue that helps you transition into a state of deep focus or productivity. Establishing a  ",


                ),
                TextSpan(
                  text: 'consistent starting ritual ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: "can improve your ability to engage in tasks requiring concentration and effort. For instance, before starting work or study sessions, you might listen to a specific song or perform a brief mindfulness exercise to signal the beginning of focused work. ",
                ),

              ],
            )),
        'Implement Commitment Devices': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Utilize commitment devices to ",

                ),
                TextSpan(
                  text: 'reinforce desired behaviors  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"and make it difficult to deviate from them. A commitment device could be anything from setting up automatic bill payments to scheduling regular workouts with a fitness buddy. By making a proactive choice in the present that locks in better behavior for the future, you ",

                ),
                TextSpan(text:"increase accountability and consistency in your habits.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
        'Leverage Automation': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Automate your habits to ensure consistent execution over time. Identify areas where ",

                ),
                TextSpan(
                  text: 'technology can streamline  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"and simplify your routines, such as setting reminders for daily meditation or using apps to track your progress towards goals. By relying on technology to automate tasks, you reduce the cognitive load associated with maintaining habits and increase the likelihood of long-term adherence.",
                ),

              ],
            )),
        'Focus on Immediate Rewards': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Structure your habits ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "in a way that provides immediate satisfaction or rewards. Incorporate elements that offer ",


                ),
                TextSpan(text:"instant gratification ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(
                  text: "or positive reinforcement upon completion of the behavior. Whether it's treating yourself to a small reward after completing a task or acknowledging your progress with positive self-talk, immediate satisfaction increases the likelihood of habit repetition. ",


                ),
              ],
            )),
        'Celebrate Small Wins': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Cultivate a sense of immediate success by celebrating even the smallest achievements related to your habits. Recognize and acknowledge your progress, no matter how minor, to create a  ",

                ),
                TextSpan(
                  text: 'positive feedback loo  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"that reinforces the habit. By feeling immediately successful, you reinforce the behavior and increase the likelihood of repeating it in the future. "
                  ,),

              ],
            )),
        'Utilize Habit Trackers': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Incorporate ",
                ),
                TextSpan(
                  text: 'habit trackers or visual forms of measurement  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"into your routine to monitor progress and reinforce satisfaction. Whether it's using a physical calendar to mark off completed habits or utilizing digital apps to track streaks, ",),
                TextSpan(
                  text: 'visualizing your progress  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text:"provides tangible evidence of your commitment and motivates continued behavior. ",
                ),
              ],
            )),
        'Prioritize Consistency': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Strive to maintain consistency in your habits by adhering to the ",
                ),
                TextSpan(
                  text: "Don't break the chain"+" and "+ "Never miss twice ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(
                  text: 'principles. Keep track of your  ',
                ),
                TextSpan(text:"habit streak ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'and make it a priority to avoid breaking the chain of consecutive days. If you do miss a day, make a concerted effort to resume your habit as soon as possible to prevent further disruption.  ',
                ),
                TextSpan(text:"Consistency is key ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "to habit formation and long-term success."),
              ],
            )),
        'Introduce Accountability Measures': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Engage the help of an ",
                ),
                TextSpan(
                  text: "accountability partner",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:" or ",
                ),
                TextSpan(
                  text: 'establish a habit contractr  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text:"to add immediate consequences to inaction. Knowing that someone else is monitoring your progress creates a social cost to not following through with your commitments. The fear of disappointing others or tarnishing your reputation can serve as a powerful motivator to stick to your desired habits. ",
                ),


              ],
            )),
        'Make Bad Habits Unsatisfying': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Apply the inversion of the ",
                ),
                TextSpan(
                  text: "4th Law of Behavior Change by making bad habits painful or unsatisfying. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:" or ",
                ),
                TextSpan(
                  text: 'Identify the negative consequences or drawbacks associated with indulging in unhealthy behaviors and magnify them. By increasing the perceived costs of engaging in bad habits, you decrease the likelihood of repetition and strengthen your resolve to adopt healthier alternatives.   ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            )),
        'Choose Habits Aligned with Your Strengths': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Opt for habits that  ",
                ),
                TextSpan(text:" and ",
                ),
                TextSpan(
                  text: "align with your strengths. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"By selecting habits that resonate with your skills and inclinations, you increase the likelihood of success and find it easier to make progress. Assess your strengths and preferences to identify habits that best suit you, allowing for smoother integration into your lifestyle. ",
                ),

              ],
            )),
        'Create Favorable Circumstance': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Play to your strengths by  ",
                ),

                TextSpan(
                  text: "If existing opportunities don't align with your strengths, consider creating your own game or setting where you can leverage your advantages. By crafting favorable circumstances, you maximize your chances of success and mitigate the impact of any inherent disadvantages.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),

              ],
            )),
        'Apply the Goldilocks Rule': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Aim to work on tasks or habits that are  ",
                ),

                TextSpan(
                  text: "neither too easy nor too difficult, ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"but  ",
                ),

                TextSpan(
                  text: "just challenging enough ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"to keep you engaged and motivated. By operating at the edge of your current abilities, you experience peak motivation and are more likely to sustain progress over time. Continuously adjust the difficulty of your habits to maintain this optimal level of challenge and motivation.  ",
                ),
              ],
            )),
        'Embrace Consistency Over Excitement': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Recognize that  ",
                ),

                TextSpan(
                  text: "sustained success ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"is not solely dependent on feeling motivated or excited. Cultivate the discipline to persevere with your habits even when they become routine or less interesting. Focus on ",
                ),

                TextSpan(
                  text: "sticking to your schedule ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"and maintaining consistency, regardless of external factors or fluctuations in motivation. It's the ability to keep going even during mundane or uninspiring moments that ultimately leads to long-term success."),
              ],
            )),
        'Incorporate Reflection and Review': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Integrate  ",
                ),

                TextSpan(
                  text: "regular reflection ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"and review sessions into your routine to maintain awareness of your performance and progress over time. Set aside"),

                TextSpan(
                  text: "dedicated time to evaluate your habits and actions, identifying areas for improvement and celebrating successes. ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text:"By consciously assessing your performance, you can refine your habits and enhance your ability to achieve mastery."),

              ],
            )),
        'Embrace Growth Beyond Identity': RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              style: TextStyle(
                color: Theme=="DarkTheme"?Colors.white:Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: const <TextSpan>[
                TextSpan(text:"Be open to evolving beyond your current identity and self-perceptions. Recognize that holding tightly to a fixed identity can hinder personal growth and development. Allow yourself the ",
                ),

                TextSpan(
                  text: "flexibility ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),

                ),
                TextSpan(text:"to adapt and embrace new experiences, habits, and perspectives. By "),

                TextSpan(
                  text: "letting go of rigid identities,  ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text:"you "),
                TextSpan(
                  text: "create space for exploration, learning, and expansion.  ",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),

              ],
            )),


        // Add more tips as needed
      };






      _getRandomTip() {
        final random = Random();
        final keys = tips.keys.toList();
        final String randomTipHeading = keys[random.nextInt(keys.length)];
        final Widget? randomTipContent = tips[randomTipHeading];

        return {'heading': randomTipHeading, 'content': randomTipContent};
      }
      var value=_getRandomTip();

       if(event is TipsEventHitted){


         emit(RandomTipState(RandomStringMap: value,));
       }

    });
  }


}

