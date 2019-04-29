package edu.neu.project.service;

import java.util.Collection;
import java.util.List;

import edu.neu.project.domain.Question;
import edu.neu.project.domain.Usr;

public interface UsrService {
	public void addUsr(Usr usr);
	public Collection<Usr> listUsr();
	public Usr getUser(Long id);
	public void saveorUpdate(Usr usr);
	public Usr getUserbyEmail(String email);
	public void deleteUser(Long id);
	public List<Question> getQuestionsAnswered(Usr user);
}
