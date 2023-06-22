# frozen_string_literal: true

transform "jenkins.plugins.hipchat.HipChatNotifier", "org.jenkinsci.plugins.buildnamesetter.BuildNameSetter", "org.jenkinsci.plugins.builduser.BuildUser", "com.cloudbees.jenkins.GitHubSetCommitStatusBuilder", "org.jenkinsci.plugins.github.status.GitHubCommitStatusSetter", "org.jvnet.hudson.plugins.SbtPluginBuilder", "com.github.terma.jenkins.githubprcoveragestatus.CompareCoverageAction", "org.jenkinsci.plugins.github.status.GitHubCommitStatusSetter", "hudson.plugins.timestamper.TimestamperBuildWrapper", "hudson.plugins.ansicolor.AnsiColorBuildWrapper", "hudson.plugins.gradle.BuildScanBuildWrapper", "com.chikli.hudson.plugin.naginator.NaginatorPublisher", "org.jenkinsci.plugins.ParameterizedRemoteTrigger.RemoteBuildConfiguration", "com.cloudbees.jenkins.GitHubCommitNotifier", "hudson.plugins.descriptionsetter.DescriptionSetterPublisher" do
  nil
end
