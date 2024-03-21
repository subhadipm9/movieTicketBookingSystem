package com.movieTicketBookingSystem;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.movieTicketBookingSystem.model.TheaterScreening;
import com.movieTicketBookingSystem.repository.TheaterScreeningRepository;
import com.movieTicketBookingSystem.service.TheaterScreeningServiceImpl;


class TheaterScreeningServiceImplTest {

    @Mock
    private TheaterScreeningRepository theaterScreeningRepository;

    @InjectMocks
    private TheaterScreeningServiceImpl theaterScreeningService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testSetTheaterScreening() {
        TheaterScreening theaterScreening = new TheaterScreening();
        when(theaterScreeningRepository.save(theaterScreening)).thenReturn(theaterScreening);

        TheaterScreening result = theaterScreeningService.setTheaterScreening(theaterScreening);

        assertNotNull(result);
        assertEquals(theaterScreening, result);
    }

    @Test
    void testGetAllTheaterScreeningDetails() {
        List<TheaterScreening> theaterScreenings = new ArrayList<>();
        when(theaterScreeningRepository.findAll()).thenReturn(theaterScreenings);

        List<TheaterScreening> result = theaterScreeningService.getAllTheaterScreeningDetails();

        assertNotNull(result);
        assertEquals(theaterScreenings, result);
    }

   
    @Test
    void testDeleteTheater() {
        int screenId = 1;
        doNothing().when(theaterScreeningRepository).deleteById(screenId);

        theaterScreeningService.deleteTheater(screenId);
    }

    @Test
    void testGetTheaterScreenDetailsUsingDateAndTime() {
        Date dateId = Date.valueOf("2024-02-17");
        String timeId = "Morning";
        int screenNo = 1;
        List<TheaterScreening> theaterDetailsOptional = new ArrayList<>();
        TheaterScreening theaterScreening = new TheaterScreening();
        theaterScreening.setMovieDate(dateId);
        theaterScreening.setStartTime(timeId);
        theaterScreening.setScreenNo(screenNo);
        theaterDetailsOptional.add(theaterScreening);
        when(theaterScreeningRepository.findByScreenNo(screenNo)).thenReturn(theaterDetailsOptional);

        TheaterScreening result = theaterScreeningService.getTheaterScreenDetailsUsingDateAndTime(dateId, timeId, screenNo);

        assertNotNull(result);
        assertEquals(theaterScreening, result);
        assertEquals(dateId, result.getMovieDate());
        assertEquals(timeId, result.getStartTime());
        assertEquals(screenNo, result.getScreenNo());
    }

    @Test
    void testGetTheaterScreenDetailsUsingDateAndTime_NotFound() {
        Date dateId = Date.valueOf("2024-02-17");
        String timeId = "Morning";
        int screenNo = 1;
        List<TheaterScreening> theaterDetailsOptional = new ArrayList<>();
        when(theaterScreeningRepository.findByScreenNo(screenNo)).thenReturn(theaterDetailsOptional);

        TheaterScreening result = theaterScreeningService.getTheaterScreenDetailsUsingDateAndTime(dateId, timeId, screenNo);

        assertNull(result);
    }

    @Test
    void testAddMovieToTheater() {
        TheaterScreening theaterScreening = new TheaterScreening();
        theaterScreening.setMovieDate(Date.valueOf("2024-02-17"));
        theaterScreening.setStartTime("Morning");
        theaterScreening.setScreenNo(1);
        when(theaterScreeningRepository.save(theaterScreening)).thenReturn(theaterScreening);
        when(theaterScreeningRepository.findByScreenNo(theaterScreening.getScreenNo())).thenReturn(new ArrayList<>());

        boolean result = theaterScreeningService.addMovieToTheater(theaterScreening);

        assertTrue(result);
    }

    @Test
    void testAddMovieToTheater_MovieAlreadyExists() {
        TheaterScreening theaterScreening = new TheaterScreening();
        theaterScreening.setMovieDate(Date.valueOf("2024-02-17"));
        theaterScreening.setStartTime("Morning");
        theaterScreening.setScreenNo(1);
        List<TheaterScreening> theaterDetailsOptional = new ArrayList<>();
        theaterDetailsOptional.add(theaterScreening);
        when(theaterScreeningRepository.findByScreenNo(theaterScreening.getScreenNo())).thenReturn(theaterDetailsOptional);

        boolean result = theaterScreeningService.addMovieToTheater(theaterScreening);

        assertFalse(result);
    }

    @Test
    void testSetSeatNumbers() {
        int theaterId = 1;
        int noOfSeats = 5;
        TheaterScreening theaterScreening = new TheaterScreening();
        theaterScreening.setBookedSeats(10);
        Optional<TheaterScreening> setTheaterScreeningSeatOptional = Optional.of(theaterScreening);
        when(theaterScreeningRepository.findById(theaterId)).thenReturn(setTheaterScreeningSeatOptional);
        when(theaterScreeningRepository.save(setTheaterScreeningSeatOptional.get())).thenReturn(theaterScreening);

        theaterScreeningService.setSeatNumbers(theaterId, noOfSeats);

        assertEquals(15, theaterScreening.getBookedSeats());
    }

    @Test
    void testGetTheaterDetailsOnMovie() {
        int movieId = 1;
        List<TheaterScreening> theaterDetails = new ArrayList<>();
        when(theaterScreeningRepository.findAllByMovieIdForScreen(movieId)).thenReturn(theaterDetails);

        List<TheaterScreening> result = theaterScreeningService.getTheaterDetailsOnMovie(movieId);

        assertNotNull(result);
        assertEquals(theaterDetails, result);
    }

    @Test
    void testGetTheaterDetailsOnMovie_NotFound() {
        int movieId = 1;
        when(theaterScreeningRepository.findAllByMovieIdForScreen(movieId)).thenReturn(null);

        List<TheaterScreening> result = theaterScreeningService.getTheaterDetailsOnMovie(movieId);

        assertNull(result);
    }

    @Test
    void testGetTheaterScreeningById() {
        int screenIdBooked = 1;
        TheaterScreening theaterScreening = new TheaterScreening();
        Optional<TheaterScreening> theaterScreeningOptional = Optional.of(theaterScreening);
        when(theaterScreeningRepository.findById(screenIdBooked)).thenReturn(theaterScreeningOptional);

        Optional<TheaterScreening> result = theaterScreeningService.getTheaterScreeningById(screenIdBooked);

        assertNotNull(result);
        assertEquals(theaterScreeningOptional, result);
    }

    @Test
    void testSetCancelSeatNumbers() {
        int screenId = 1;
        int noOfSeats = 2;
        TheaterScreening theaterScreening = new TheaterScreening();
        theaterScreening.setBookedSeats(10);
        Optional<TheaterScreening> setTheaterScreeningSeatOptional = Optional.of(theaterScreening);
        when(theaterScreeningRepository.findById(screenId)).thenReturn(setTheaterScreeningSeatOptional);
        when(theaterScreeningRepository.save(setTheaterScreeningSeatOptional.get())).thenReturn(theaterScreening);

        theaterScreeningService.setCancelSeatNumbers(screenId, noOfSeats);

        assertEquals(8, theaterScreening.getBookedSeats());
    }
}